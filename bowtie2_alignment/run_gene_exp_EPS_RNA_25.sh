#!/bin/bash
#
#SBATCH --job-name=geneexp
#SBATCH --output=job_output/geneexp.%j.out
#SBATCH --error=job_output/geneexp.%j.err
#SBATCH --time=10:00
#SBATCH --nodes=1
##SBATCH --mem=50M

date

# Initialize Conda in the script
__conda_setup="$('/home/cantsaywisp1308/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
eval "$__conda_setup"
unset __conda_setup

# Activate the Conda environment
conda activate myenv

# Debugging: Print the conda environment and PATH
echo "Conda Environment: $(conda info --envs)"
echo "PATH: $PATH"
echo "FeatureCounts Path: $(which featureCounts)"
echo "FeatureCounts Version: $(featureCounts -v)"

# Define variables
GTF="data/ncbi_dataset/data/GCF_000184745.1/genomic.gtf"
OUTPUT="output/EPS_RNA_25_bt2_results/ge"
INPUT="output/EPS_RNA_25/*.sam"

# Construct and run the featureCounts command
a="featureCounts -p -t transcript,exon -a ${GTF} -o ${OUTPUT} ${INPUT}"
echo $a
eval $a

# Process the output file
b="cat ${OUTPUT} | cut -f1,7- | sed 1d > ${OUTPUT}.mat"
echo $b
eval $b

date
