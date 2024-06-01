import subprocess

def run_bowtie2_index(reference_genome, index_base, bowtie2_build_path):
    """
    Run Bowtie2 to index a reference genome.

    Parameters:
    reference_genome (str): Path to the reference genome file (FASTA format).
    index_base (str): Base name for the index files to be created.
    bowtie2_build_path (str): Full path to the Bowtie2-build executable.
    """
    try:
        # Construct the Bowtie2-build command
        command = [bowtie2_build_path, reference_genome, index_base]

        # Run the command using subprocess
        result = subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        # Print the stdout and stderr from the command
        print("STDOUT:", result.stdout.decode())
        print("STDERR:", result.stderr.decode())
        print("Indexing completed successfully.")

    except subprocess.CalledProcessError as e:
        print(f"An error occurred while running Bowtie2-build: {e}")
        print("STDOUT:", e.stdout.decode())
        print("STDERR:", e.stderr.decode())

# Example usage
reference_genome = 'data/ncbi_dataset/data/GCF_000184745.1/GCF_000184745.1_ASM18474v1_genomic.fna'
index_base = 'bowtie2_index/var_para_EPS'
bowtie2_build_path = 'C:/Program Files (x86)/bowtie2-2.5.3-mingw-aarch64/bowtie2-build'

run_bowtie2_index(reference_genome, index_base, bowtie2_build_path)
