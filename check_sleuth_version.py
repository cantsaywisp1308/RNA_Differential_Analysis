import subprocess

# Define path to R executable
r_executable = "C:\\Program Files\R\\R-4.3.3\\bin\\R.exe"  # Replace with the actual path to the R executable

# Define R script to retrieve Sleuth version
r_script = """
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("sleuth")
cat(packageVersion("sleuth"))
"""

# Execute R script and retrieve Sleuth version
sleuth_version = subprocess.run([r_executable, '--slave', '-e', r_script], capture_output=True, text=True).stdout.strip()

# Print Sleuth version
print("Sleuth version:", sleuth_version)
