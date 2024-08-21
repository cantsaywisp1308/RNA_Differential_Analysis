#!/bin/bash

# Directories and reference files
REFERENCE="/home/cantsaywisp1308/data/ncbi_dataset/data/GCF_000184745.1/GCF_000184745.1_ASM18474v1_genomic.fna"
GTF="/home/cantsaywisp1308/data/ncbi_dataset/data/GCF_000184745.1/genomic.gtf" # For aligner if needed
#GATK="path/to/gatk.jar"
INPUT_DIR= "/home/cantsaywisp1308/output/BAM_files/illumina_25/"
OUTPUT_DIR="/home/cantsaywisp1308/variovorax_paradoxus_GATK/ilumina_25/"

# Create output directory if it does not exist
mkdir -p $OUTPUT_DIR

# List of input SAM files
FILES=("3161_1_S1.sam" "3161_2_S2.sam" "3161_3_S3.sam" "3161_4_S4.sam" "3162_5_S5.sam" "3162_6_S6.sam" "3163_7_S7.sam" "3163_8_S8.sam" "3164_9_S9.sam")

# Function to process each file
process_file() {
	local file=$1
	local base=$(basename $file .sam)
	echo "Processing $file..."

	# Split N Cigar Reads
	gatk --java-options "-Xmx4g" SplitNCigarReads \
	-R $REFERENCE \
	-I $OUTPUT_DIR/${base}_sorted.bam \
	-O $OUTPUT_DIR/${base}_split.bam

	# Run HaplotypeCaller
	gatk --java-options "-Xmx4g" HaplotypeCaller \
	-R $REFERENCE \
	-I $OUTPUT_DIR/${base}_split.bam \
	-O $OUTPUT_DIR/${base}_raw_variants.vcf \
	--dont-use-soft-clipped-bases \
	--standard-min-confidence-threshold-for-calling 20.0

	# Filter Variants
	gatk --java-options "-Xmx4g" VariantFiltration \
	-R $REFERENCE \
	-V $OUTPUT_DIR/${base}_raw_variants.vcf \
	-O $OUTPUT_DIR/${base}_filtered_variants.vcf \
	--filter-expression "QD < 2.0 || FS > 30.0 || MQ < 40.0" \
	--filter-name "RNASeqFilter"

	echo "Finished processing $file."
}
# Loop over each file and process it
for file in "${FILES[@]}"; do
process_file $file
done
echo "All files processed."
