BATCH --job-name=create_index
#SBATCH --output=job_output/create_index.%j.out
#SBATCH --error=job_output/create_index.%j.err
##SBATCH --time=1:00:00
#SBATCH --nodes=1
##SBATCH --mem=50M


date

source ~/.bashrc
conda activate diff_exp_env 

#FASTA="/exports/home/jolivieri/data/genomes/TAIR10/TAIR10_chr_all.fas"
#NAME="TAIR10"

FASTA="data/ncbi_dataset/data/GCF_000184745.1/GCF_000184745.1_ASM18474v1_genomic.fna"
NAME="var_para_EPS"

mkdir -p index/
a="bowtie2-build ${FASTA} index/${NAME}"
echo $a
eval $a

date
