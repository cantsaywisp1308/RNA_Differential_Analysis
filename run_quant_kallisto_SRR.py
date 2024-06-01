import subprocess
import os

def run_kallisto_quant(transcriptome_index, fastq1, fastq2, output_directory):
    """
    Run Kallisto quantification on paired-end FASTQ files.

    Args:
    - transcriptome_index: Path to the Kallisto index file.
    - fastq1: Path to the first FASTQ file.
    - fastq2: Path to the second FASTQ file.
    - output_directory: Path to the directory where Kallisto output will be saved.
    """
    # Create output directory if it doesn't exist
    gff_file = "data/ncbi_dataset/data/GCF_000184745.1/GCF_000184745.1_ASM18474v1_genomic.fna"
    os.makedirs(output_directory, exist_ok=True)

    # Command to run Kallisto quantification
    command = ["kallisto", "quant", "-i", transcriptome_index, "-o", output_directory, "--genomebam" ,"-b", "100", "--gtf", gff_file ,fastq1, fastq2]

    # Run the command
    subprocess.run(command)

if __name__ == "__main__":
    ORIGIN_FOLDER = "3164_illumina_reads"

    #files = ["3164_10_S10_","3164_11_S11_","3164_12_S12_","3164_13_S1_","3164_14_S2_","3164_15_S3_","3164_16_S4_","3164_17_S5_","3164_18_S6_"]
    files = ["SRR10613920", "SRR10613921", "SRR10613922", "SRR10613923", "SRR10613924", "SRR10613925", "SRR10613926",
             "SRR10613927", "SRR10613928"]
    # Example usage
    for file in files:
        transcriptome_index = f"kallisto_index/index"  # Path to the Kallisto index file
        fastq1 = f"{file}/{file}_1.fastq"  # Path to the first FASTQ file
        fastq2 = f"{file}/{file}_2.fastq"  # Path to the second FASTQ file
        output_directory = f"kallisto_output/RNA_Seq_BAM/{file}"  # Output directory for Kallisto results

        # Run Kallisto quantification
        run_kallisto_quant(transcriptome_index, fastq1, fastq2, output_directory)

    # folder = "SRR10613920"
    # transcriptome_index = f"kallisto_index/index"  # Path to the Kallisto index file
    # fastq1 = f"{folder}/{folder}_1.fastq"  # Path to the first FASTQ file
    # fastq2 = f"{folder}/{folder}_2.fastq"  # Path to the second FASTQ file
    # output_directory = f"kallisto_output/{folder}"  # Output directory for Kallisto results
    #
    # # Run Kallisto quantification
    # run_kallisto_quant(transcriptome_index, fastq1, fastq2, output_directory)


