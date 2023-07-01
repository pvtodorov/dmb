#!/bin/bash

# Define the runs
runs=("0010" "0037" "0038")

# Loop through each run
for run in ${runs[@]}
do
    # Define the input and output directories
    input_dir="../data/01_fastq/${run}"
    output_dir="../data/03_qc/fastqc/${run}"

    # Create the output directory if it doesn't already exist
    mkdir -p ${output_dir}

    # Run fastqc on each .fastq.gz file in the input directory, outputting the results to the output directory
    ls ${input_dir}/*.fastq.gz | \
    xargs -n 1 -P 100 -I {} \
    ionice -c 2 -n 7 /tools/fastqc/0.12.1/fastqc \
    -o ${output_dir} {}
done
