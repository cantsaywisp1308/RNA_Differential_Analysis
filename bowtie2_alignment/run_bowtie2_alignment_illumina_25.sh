#!/bin/bash
#
#SBATCH --job-name=align
#SBATCH --output=job_output/align.%j.out
#SBATCH --error=job_output/align.%j.err
#SBATCH --time=1:00:00
#SBATCH --nodes=1

date

# Initialize Conda in the script
__conda_setup="$('/home/cantsaywisp1308/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
eval "$__conda_setup"
unset __conda_setup

# Activate the Conda environment
conda activate myenv

# Loop through the SRR numbers
for i in {8..9}
do
	     NAME="3164_${i}_S${i}_"
	     INPUT1="raw_data/illumina_25/3164_${i}_S${i}/${NAME}R1_001.fastq.gz"
	     INPUT2="raw_data/illumina_25/3164_${i}_S${i}/${NAME}R2_001.fastq.gz"

	     # Check if input files exist
	     if [[ -f "$INPUT1" && -f "$INPUT2" ]]; then
	     	mkdir -p output
	     	a="bowtie2 -x index/var_para_EPS -1 ${INPUT1} -2 ${INPUT2} -S output/${NAME}.sam --no-unal"
	     	echo $a
	     	eval $a
	     else
		echo "Input files for ${NAME} do not exist. Skipping..."
fi
done
date
