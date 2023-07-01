#!/usr/bin/bash
#USAGE: time bash run_bcl2fastq_sample_0038.sh &> bcl2fastq_0038_log_out.txt
#docs:  https://support.illumina.com/content/dam/illumina-support/documents/documentation/software_documentation/bcl2fastq/bcl2fastq2-v2-20-software-guide-15051736-03.pdf

module load bcl2fastq/2.20.0
BCL_DIR=../data/00_sequencing_runs
FASTQ_DIR=../data/01_fastq
PROJECT_ID="0010"
SEQ_ID="190219_A00642_0010_AHHCHVDMXX"
SAMPLE_SHEET=sample_sheets/sample_0010.csv

ionice -c 2 -n 7 bcl2fastq --runfolder-dir $BCL_DIR/$SEQ_ID \
	  --output-dir $FASTQ_DIR/$PROJECT_ID \
	  --sample-sheet=$SAMPLE_SHEET \
	  --no-lane-splitting \
      -r 30 -p 30 -w 30 &> ./bcl2fastq_${PROJECT_ID}_log_out.txt
