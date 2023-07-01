#!/bin/bash

module load star

# Set the number of threads for STAR
nThreads=60

# Set directories
genomeDir="../data/genome/ensembl"
indexDir="../data/genome/index"

# Make directories if they don't exist
mkdir -p $genomeDir
mkdir -p $indexDir

# Set URLs
genomeURL="ftp://ftp.ensembl.org/pub/current_fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz"
gtfURL="ftp://ftp.ensembl.org/pub/current_gtf/mus_musculus/Mus_musculus.GRCm39.109.gtf.gz"

# Set file paths
genomePath="$genomeDir/$(basename $genomeURL)"
gtfPath="$genomeDir/$(basename $gtfURL)"

# Download files
wget -O $genomePath $genomeURL
wget -O $gtfPath $gtfURL

# Download checksum files
wget -O $genomeDir/CHECKSUMS "ftp://ftp.ensembl.org/pub/current_fasta/mus_musculus/dna/CHECKSUMS"
wget -O $genomeDir/CHECKSUMS_GTF "ftp://ftp.ensembl.org/pub/current_gtf/mus_musculus/CHECKSUMS"

# Verify checksums
checksumGenome=$(grep $(basename $genomePath) $genomeDir/CHECKSUMS | awk '{print $1, $2}')
checksumGTF=$(grep $(basename $gtfPath) $genomeDir/CHECKSUMS_GTF | awk '{print $1, $2}')

if [[ "$checksumGenome" != "$(sum $genomePath)" ]]; then
  echo "Genome file checksum does not match. Deleting file."
  rm $genomePath
  exit 1
fi

if [[ "$checksumGTF" != "$(sum $gtfPath)" ]]; then
  echo "GTF file checksum does not match. Deleting file."
  rm $gtfPath
  exit 1
fi

# Uncompress the downloaded files
gunzip $genomePath
gunzip $gtfPath

# Update paths to uncompressed files
genomePath="${genomePath%.gz}"
gtfPath="${gtfPath%.gz}"

# Generate the STAR index
ionice -c 2 -n 7 STAR --runThreadN $nThreads \
  --runMode genomeGenerate \
  --genomeDir $indexDir \
  --genomeFastaFiles $genomePath \
  --sjdbGTFfile $gtfPath \
  --sjdbOverhang 50

