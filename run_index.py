import os
import subprocess

def index_transcriptome_from_fastq(output_directory):
    """
    Index the transcriptome FASTA file using Kallisto from FASTQ files.

    Args:
    - fastq1: Path to the first FASTQ file.
    - fastq2: Path to the second FASTQ file.
    - output_directory: Path to the directory where Kallisto index will be saved.

    Returns:
    - index_file: Path to the Kallisto index file.
    """
    # Create output directory if it doesn't exist
    os.makedirs(output_directory, exist_ok=True)

    index_file = "data/ncbi_dataset/data/GCF_000184745.1/cds_from_genomic.fna"

    # Command to run Kallisto index
    command = ["kallisto", "index", "-i", os.path.join(output_directory, "index"),  index_file]

    # Run the command
    subprocess.run(command)

    # Path to the index file
    index_file = os.path.join(output_directory, "index.idx")

    return index_file


if __name__ == "__main__":
    #folders = ["SRR10613923","SRR10613924","SRR10613925","SRR10613926","SRR10613927","SRR10613928"]
    # Example usage
    # for folder in folders:
    #     fastq1 = f"{folder}/{folder}_1.fastq"  # Path to the first FASTQ file
    #     fastq2 = f"{folder}/{folder}_2.fastq"  # Path to the second FASTQ file
    #
    #
    #     # Index the transcriptome
    #
    #     print("Kallisto index file:", index_file)

    # folder = "SRR10613923"
    output_directory = f"kallisto_index"  # Output directory for Kallisto index
    index_file = index_transcriptome_from_fastq(output_directory)

