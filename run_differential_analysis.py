import os
import subprocess

def run_sleuth(tsv_directory, design_matrix_file, output_directory):
    """
    Run Sleuth for RNA differential analysis.

    Args:
    - tsv_directory: Path to the directory containing transcript abundance TSV files.
    - design_matrix_file: Path to the design matrix file (metadata).
    - output_directory: Path to the directory where Sleuth results will be saved.
    """
    # Create output directory if it doesn't exist
    os.makedirs(output_directory, exist_ok=True)

    # Command to run Sleuth
    command = ["sleuth", "r", "--num-bootstraps", "100", "--outdir", output_directory, "--useVarianceFiltering", "TRUE", "--thread", "4", "--design", design_matrix_file]

    # Add paths to transcript abundance TSV files
    tsv_files = [os.path.join(tsv_directory, f) for f in os.listdir(tsv_directory) if f.endswith(".tsv")]
    command.extend(tsv_files)

    # Run the command
    subprocess.run(command)

if __name__ == "__main__":
    folders = ["SRR10613920"]
    #,"SRR10613921","SRR10613922","SRR10613923","SRR10613924","SRR10613925","SRR10613926","SRR10613927","SRR10613928"
    # Example usage
    #for folder in folders:
    tsv_directory = "kallisto_output/SRR10613920/"  # Path to the directory containing transcript abundance TSV files
    design_matrix_file = "abundance.tsv"  # Path to the design matrix file (metadata)
    output_directory = "sleuth_output/SRR10613920"  # Output directory for Sleuth results

    # Run Sleuth for RNA differential analysis
    run_sleuth(tsv_directory, design_matrix_file, output_directory)

