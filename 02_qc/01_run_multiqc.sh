multiqc \
../data/00_sequencing_runs/190219_A00642_0010_AHHCHVDMXX \
../data/00_sequencing_runs/190830_A00642_0037_BHL3LFDMXX \
../data/00_sequencing_runs/190830_A00642_0038_AHCWFLDRXX \
../data/01_fastq/0010 \
../data/01_fastq/0037 \
../data/01_fastq/0038 \
../data/03_qc/fastqc/0010 \
../data/03_qc/fastqc/0037 \
../data/03_qc/fastqc/0038 \
../data/02_aligned/0010 \
../data/02_aligned/0037 \
../data/02_aligned/0038 \
-m fastqc -m star -m bcl2fastq \
--export \
--outdir multiqc --filename multiqc_report_dmb_all --interactive
