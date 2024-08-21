#!/bin/bash
INPUT="/home/cantsaywisp1308/output/"
#for i in {1..9}; do
	#echo "total reads in illumina_25/3164_${i}_S${i}.sam"
	#samtools view -F 4 -c $INPUT/illumina_25/3164_${i}_S${i}_.sam
#done

#for i in {10..18}; do
	#echo "total reads in illumina_30/3164_${i}_S${i}.sam"
	#samtools view -F 4 -c $INPUT/illumina_30/3164_${i}_S${i}_.sam
#done

#for i in {1..9}; do
	#echo "total reads in EPS_RNA_25/1_${i}_S${i}.sam"
	#samtools view -F 4 -c $INPUT/EPS_RNA_25/1_${i}_S${i}.sam
#done

for i in {0..8}; do
	echo "total reads in SRR_RNA_30/SRR1061392${i}.sam"
	samtools view -F 4 -c $INPUT/SRR_RNA_30/SRR1061392${i}.sam
done

echo "all files processed"
