#!/bin/bash

#STEP 3: Mark Duplicates and Sort - GATK4
# -----------------------------------------

#echo "STEP 3: Mark Duplicates and Sort - GATK4"

REF_GENOME="/home/cantsaywisp1308/data/ncbi_dataset/data/GCF_000184745.1/GCF_000184745.1_ASM18474v1_genomic.fna"

# Ensure the reference genome is indexed
samtools faidx $REF_GENOME

# Define the input directory containing the BAM files
INPUT_DIR="/home/cantsaywisp1308/output/BAM_files/EPS_RNA_25"

# Define the output directory for the VCF files
OUTPUT_DIR="/home/cantsaywisp1308/output/VCF_files/EPS_RNA_25"

# Create the output directory if it doesn't exist
mkdir -p $OUTPUT_DIR


# Loop through the BAM files from SRR10613920_sorted.bam to SRR10613928_sorted.bam
for i in {1..9}; do
	BAM_FILE="${INPUT_DIR}/1_${i}_S${i}_sorted.bam"
	BCF_FILE="${OUTPUT_DIR}/1_${i}_S${i}_.bcf"
	VCF_FILE="${OUTPUT_DIR}/1_${i}_S${i}_.vcf.gz"

	echo "Processing $BAM_FILE"

	# Run bcftools mpileup to generate BCF
	bcftools mpileup -Ou -f $REF_GENOME $BAM_FILE | bcftools call -mv -Ob -o $BCF_FILE
	# Convert BCF to VCF
	bcftools view $BCF_FILE -Oz -o $VCF_FILE
	# Index the VCF file
	bcftools index $VCF_FILE

	echo "Generated VCF for SRR${i}"
done
echo "All files processed."
