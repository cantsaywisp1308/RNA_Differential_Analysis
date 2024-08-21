#!/bin/bash
INPUT="/home/cantsaywisp1308/output/VCF_files"

for i in {1..9}; do
	echo "Counting variants QUAL > 10 of illumina_25/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>10' $INPUT/illumina_25/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l
	
	echo "Counting variants QUAL > 30 of illumina_25/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>30' $INPUT/illumina_25/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 50 of illumina_25/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>50' $INPUT/illumina_25/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 100 of illumina_25/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>100' $INPUT/illumina_25/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 200 of illumina_25/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>200' $INPUT/illumina_25/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

	echo "Counting all variants of illumina_25/3164_${i}_S${i}.vcf"
	bcftools view -H $INPUT/illumina_25/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

done

for i in {10..18}; do
	echo "Counting variants QUAL > 10 of illumina_30/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>10' $INPUT/illumina_30/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l
	
	echo "Counting variants QUAL > 30 of illumina_30/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>30' $INPUT/illumina_30/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 50 of illumina_30/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>50' $INPUT/illumina_30/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 100 of illumina_30/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>100' $INPUT/illumina_30/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 200 of illumina_30/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>200' $INPUT/illumina_30/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l
	
	echo "Counting all variants of illumina_30/3164_${i}_S${i}.vcf"
	bcftools view -H $INPUT/illumina_30/3164_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

done

for i in {1..9}; do
	echo "Counting variants QUAL > 10 of EPS_RNA_25/1_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>10' $INPUT/EPS_RNA_25/1_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l
	
	echo "Counting variants QUAL > 30 of EPS_RNA_25/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>30' $INPUT/EPS_RNA_25/1_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 50 of EPS_RNA_25/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>50' $INPUT/EPS_RNA_25/1_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 100 of EPS_RNA_25/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>100' $INPUT/EPS_RNA_25/1_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 200 of EPS_RNA_25/3164_${i}_S${i}.vcf"
	bcftools view -i 'QUAL>200' $INPUT/EPS_RNA_25/1_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

	echo "Counting all variants of EPS_RNA_25/3164_${i}_S${i}.vcf"
	bcftools view -H $INPUT/EPS_RNA_25/1_${i}_S${i}_.vcf.gz | grep -v '^#' | wc -l

done

for i in {0..8}; do
	echo "Counting variants QUAL > 10 of SRR_RNA_30/SRR1061392${i}.vcf"
	bcftools view -i 'QUAL>10' $INPUT/SRR_RNA_30/SRR1061392${i}.vcf.gz | grep -v '^#' | wc -l
	
	echo "Counting variants QUAL > 30 of SRR_RNA_30/SRR1061392${i}.vcf"
	bcftools view -i 'QUAL>30' $INPUT/SRR_RNA_30/SRR1061392${i}.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 50 of SRR_RNA_30/SRR1061392${i}.vcf"
	bcftools view -i 'QUAL>50' $INPUT/SRR_RNA_30/SRR1061392${i}.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 100 of SRR_RNA_30/SRR1061392${i}.vcf"
	bcftools view -i 'QUAL>100' $INPUT/SRR_RNA_30/SRR1061392${i}.vcf.gz | grep -v '^#' | wc -l

	echo "Counting variants QUAL > 200 of SRR_RNA_30/SRR1061392${i}.vcf"
	bcftools view -i 'QUAL>200' $INPUT/SRR_RNA_30/SRR1061392${i}.vcf.gz | grep -v '^#' | wc -l

	echo "Counting all variants of SRR_RNA_30/SRR1061392${i}.vcf"
	bcftools view -H $INPUT/SRR_RNA_30/SRR1061392${i}.vcf.gz | grep -v '^#' | wc -l


done

echo "All files processed!"
