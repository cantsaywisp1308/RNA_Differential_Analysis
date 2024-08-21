#!/bin/bash

# Define paths
INPUT_DIR="/home/cantsaywisp1308/output"
OUTPUT_DIR="/home/cantsaywisp1308/output/high_quality"
REF_DIR="data/ncbi_dataset/data/GCF_000184745.1/GCF_000184745.1_ASM18474v1_genomic.fna"


for i in {1..9}; do
	echo "Processing file illumina_25/3164_${i}_S${i}"
	#samtools view -h -q 30 -F 4 $INPUT_DIR/illumina_25/3164_${i}_S${i}_.sam > $OUTPUT_DIR/illumina_25/3164_${i}_S${i}_high_quality.sam
	echo "convert 3164_${i}_S${i}.bam"
	samtools view -S -b $OUTPUT_DIR/illumina_25/3164_${i}_S${i}_high_quality.sam > $OUTPUT_DIR/illumina_25/3164_${i}_S${i}_high_quality.bam
	echo "sort 3164_${i}_S${i}.bam"
	samtools sort $OUTPUT_DIR/illumina_25/3164_${i}_S${i}_high_quality.bam > $OUTPUT_DIR/illumina_25/3164_${i}_S${i}_sorted_high_quality.bam 
	echo "index 3164_${i}_S${i}.bam"
	samtools index $OUTPUT_DIR/illumina_25/3164_${i}_S${i}_sorted_high_quality.bam 
done

mkdir -p $OUTPUT_DIR/illumina_30/

for i in {10..18}; do
	echo "Processing file illumina_30/3164_${i}_S${i}"
	#samtools view -h -q 30 -F 4 $INPUT_DIR/illumina_30/3164_${i}_S${i}_.sam > $OUTPUT_DIR/illumina_30/3164_${i}_S${i}_high_quality.sam
	echo "convert 3164_${i}_S${i}.bam"
	samtools view -S -b $OUTPUT_DIR/illumina_30/3164_${i}_S${i}_high_quality.sam > $OUTPUT_DIR/illumina_30/3164_${i}_S${i}_high_quality.bam
	echo "sort 3164_${i}_S${i}.bam"
	samtools sort $OUTPUT_DIR/illumina_30/3164_${i}_S${i}_high_quality.bam > $OUTPUT_DIR/illumina_30/3164_${i}_S${i}_sorted_high_quality.bam 
	echo "index 3164_${i}_S${i}"
	samtools index $OUTPUT_DIR/illumina_30/3164_${i}_S${i}_sorted_high_quality.bam 
done

mkdir -p $OUTPUT_DIR/EPS_RNA_25/
for i in {1..9}; do
	echo "Processing file EPS_RNA_25/3164_${i}_S${i}"
	#samtools view -h -q 30 -F 4 $INPUT_DIR/EPS_RNA_25/1_${i}_S${i}.sam > $OUTPUT_DIR/EPS_RNA_25/1_${i}_S${i}_high_quality.sam
	echo "convert 1_${i}_S${i}.bam"
	samtools view -S -b $OUTPUT_DIR/EPS_RNA_25/1_${i}_S${i}_high_quality.sam > $OUTPUT_DIR/EPS_RNA_25/1_${i}_S${i}_high_quality.bam
	echo "sort 1_${i}_S${i}.bam"
	samtools sort $OUTPUT_DIR/EPS_RNA_25/1_${i}_S${i}_high_quality.bam > $OUTPUT_DIR/EPS_RNA_25/1_${i}_S${i}_sorted_high_quality.bam 
	echo "index 1_${i}_S${i}"
	samtools index $OUTPUT_DIR/EPS_RNA_25/1_${i}_S${i}_sorted_high_quality.bam 
done

mkdir -p $OUTPUT_DIR/SRR_RNA_30/
for i in {0..8}; do
	echo "Processing file SRR_RNA_30/SRR1061392${i}"
	#samtools view -h -q 30 -F 4 $INPUT_DIR/SRR_RNA_30/SRR1061392${i}.sam > $OUTPUT_DIR/SRR_RNA_30/SRR1061392${i}_high_quality.sam
	echo "convert SRR1061392${i}.bam"
	samtools view -S -b $OUTPUT_DIR/SRR_RNA_30/SRR1061392${i}_high_quality.sam > $OUTPUT_DIR/SRR_RNA_30/SRR1061392${i}_high_quality.bam
	echo "sort SRR1061392${i}.bam"
	samtools sort $OUTPUT_DIR/SRR_RNA_30/SRR1061392${i}_high_quality.sam > $OUTPUT_DIR/SRR_RNA_30/SRR1061392${i}_sorted_high_quality.sam 
	echo "index 3164_${i}_S${i}"
	samtools index $OUTPUT_DIR/SRR_RNA_30/SRR1061392${i}_sorted_high_quality.sam 
done

echo "All files processed"


