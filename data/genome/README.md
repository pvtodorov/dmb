This directory holds downloaded genome and generated index.

The files are not uploaded. They can be generated using included scripts.

```Shell
nmq407@/projects/petar/dmb/data/genome$ duls
1.3G	drwxr-xr-x. 2 nmq407 cbmr_lg_fileaccess_perslab 164 May 27 02:29 ensembl
27G	drwxr-xr-x. 2 nmq407 cbmr_lg_fileaccess_perslab 468 May 27 02:38 index
24K	-rw-r--r--. 1 nmq407 cbmr_lg_fileaccess_perslab 732 Jul  1  2023 README.md
```

`tree` outputs:
```
.
├── ensembl
│   ├── CHECKSUMS
│   ├── CHECKSUMS_GTF
│   ├── Mus_musculus.GRCm39.109.gtf
│   └── Mus_musculus.GRCm39.dna.primary_assembly.fa
├── index
│   ├── chrLength.txt
│   ├── chrNameLength.txt
│   ├── chrName.txt
│   ├── chrStart.txt
│   ├── exonGeTrInfo.tab
│   ├── exonInfo.tab
│   ├── geneInfo.tab
│   ├── Genome
│   ├── genomeParameters.txt
│   ├── SA
│   ├── SAindex
│   ├── sjdbInfo.txt
│   ├── sjdbList.fromGTF.out.tab
│   ├── sjdbList.out.tab
│   └── transcriptInfo.tab
└── README.md

2 directories, 20 files
```