#!/bin/bash

# Define input and output directories
INPUT_DIR="/home/cantsaywisp1308/output/EPS_RNA_25/"
OUTPUT_DIR="/home/cantsaywisp1308/output/output/BAM_files/EPS_RNA_25/"

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Loop over the range of files from 3164_1_S1.sam to 3164_9_S9.sam
for i in {1..9}; do

	# Construct the input SAM filename
	INPUT_SAM="${INPUT_DIR}1_${i}_S${i}.sam"

	# Check if the input SAM file exists
	if [[ -f "$INPUT_SAM" ]]; then
	# Construct the output BAM filenames
	OUTPUT_BAM="${OUTPUT_DIR}1_${i}_S${i}.bam"
	SORTED_BAM="${OUTPUT_DIR}1_${i}_S${i}_sorted.bam"

	# Convert SAM to BAM
	samtools view -S -b "$INPUT_SAM" > "$OUTPUT_BAM"
	# Sort the BAM file
	samtools sort "$OUTPUT_BAM" -o "$SORTED_BAM"
	# Index the sorted BAM file

	samtools index "$SORTED_BAM"

	# Optionally, remove the unsorted BAM file to save space

	rm "$OUTPUT_BAM"

	echo "Processed ${INPUT_SAM} -> ${SORTED_BAM}"

else

echo "File ${INPUT_SAM} does not exist, skipping."
fi
done
echo "Conversion and indexing completed."
