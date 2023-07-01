#!/bin/bash

# Load STAR module
module load star

# Set run name and overhang length
run_name="0037"
overhang_length="50"

# Specify directories and files
input_dir="../data/01_fastq/${run_name}/"
genome_dir="../data/genome/index/"
gtf_path="../data/genome/ensembl/Mus_musculus.GRCm39.109.gtf"
output_dir="../data/02_aligned/${run_name}/"

# Check if output directory exists, if not, create it
if [ ! -d "$output_dir" ]; then
  mkdir -p "$output_dir"
fi

# Loop over each fastq file
for file in "${input_dir}"*R1_001.fastq.gz; do
  base_name=$(basename "${file}")
  sample=$(echo "${base_name}" | sed 's/R.*//')

  echo "Processing sample ${sample}"

  # Align with STAR
  ionice -c 2 -n 7 STAR --runThreadN 30 \
       --genomeDir "${genome_dir}" \
       --sjdbGTFfile "${gtf_path}" \
       --sjdbOverhang "${overhang_length}" \
       --readFilesIn "${input_dir}${sample}R1_001.fastq.gz" "${input_dir}${sample}R2_001.fastq.gz" \
       --readFilesCommand zcat \
       --outFileNamePrefix "${output_dir}${sample}" \
       --quantMode GeneCounts
done
