#!/bin/bash

#STEP 4: Create SNPs and Indels
# -----------------------------------------
#echo "STEP 4: Create SNPs and Indels"



# Define the input directory containing the BAM files
INPUT_DIR="/home/cantsaywisp1308/output/BAM_files/SRR_RNA_30"

# Define the output directory for the VCF files
OUTPUT_DIR="/home/cantsaywisp1308/output/VCF_files/SRR_RNA_30"

# Create the output directory if it doesn't exist
mkdir -p $OUTPUT_DIR


# Loop through the BAM files from SRR10613920_sorted.bam to SRR10613928_sorted.bam
for i in {10613920..10613928}; do
	          
	VCF_FILE="${OUTPUT_DIR}/SRR${i}.vcf.gz"
	SNP_FILE="${OUTPUT_DIR}/SRR${i}_snps.vcf.gz"
	IND_FILE="${OUTPUT_DIR}/SRR${i}_indels.vcf.gz"


	echo "Processing $BAM_FILE"
	# Run bcftools -v snps to generate SNP
	bcftools view -v snps $VCF_FILE -Oz -o $SNP_FILE
	# Run bcftools -v indels to generate INDELS
	bcftools view -v indels $VCF_FILE -Oz -o $IND_FILE

									        

echo "Generated VCF for SRR${i}"
done
echo "All files processed."
