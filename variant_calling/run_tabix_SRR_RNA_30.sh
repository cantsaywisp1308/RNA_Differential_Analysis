#!/bin/bash


INPUT_DIR="/home/cantsaywisp1308/output/VCF_files/illumina_25/"

# Loop over the range of files from 3164_1_S1.sam to 3164_9_S9.sam
for i in {0..8}; do
	                echo "Processing file 3164_${i}_S${i} variants"
			tabix -p vcf output/VCF_files/SRR_RNA_30/SRR1061392${i}_pass_indels.vcf.gz
			tabix -p vcf output/VCF_files/SRR_RNA_30/SRR1061392${i}_pass_snps.vcf.gz
done
echo "All files processed"
