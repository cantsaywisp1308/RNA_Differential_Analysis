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
    os.makedirs(output_directory, exist_ok=True)

    # Command to run Kallisto quantification
    command = ["kallisto", "quant", "-i", transcriptome_index, "-o", output_directory, "--pseudobam" ,"-b", "100", fastq1, fastq2]

    # Run the command
    subprocess.run(command)

if __name__ == "__main__":
    ORIGIN_FOLDER = "EPS_UoP_RNASeq_2022"

    #files = ["3164_10_S10_","3164_11_S11_","3164_12_S12_","3164_13_S1_","3164_14_S2_","3164_15_S3_","3164_16_S4_","3164_17_S5_","3164_18_S6_"]
    #files = ["1_4_S4", "1_5_S5", "1_7_S7",
    #         "1_8_S8", "1_9_S9", "1_10_S10", "1_11_S11", "1_12_S12"]
    files = ["1_3_S3", "1_6_S6"]

    # Example usage
    for file in files:
        transcriptome_index = f"kallisto_index/index"  # Path to the Kallisto index file
        fastq1 = f"{ORIGIN_FOLDER}/{file}/{file}_R1_001.fastq.gz"  # Path to the first FASTQ file
        fastq2 = f"{ORIGIN_FOLDER}/{file}/{file}_R2_001.fastq.gz"  # Path to the second FASTQ file
        output_directory = f"kallisto_output/EPS_UoP_RNASeq_2022/{file}"  # Output directory for Kallisto results

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


