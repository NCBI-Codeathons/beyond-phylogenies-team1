# CONVERGRAPH-TEST

This project folder provides an install and test script for [Convergraph](https://github.com/sammysheep/convergraph). To run it, simply navigate to this folder and run:

```{bash}
# Assumes you have installed Rust
./install.sh && ./test-convergraph-covid.sh
```

This installation depends on [installing Rust](https://www.rust-lang.org/tools/install).

## Manifest
- `install.sh` - installs convergraph and compiles it
- `test-convergraph-covid.sh` - performs a simple analysis using Convergraph v0.1 (what existed at the time of this writing)
- `Wuhan-MT019531-AA.txt` - amino acid sequence for the spike gene of the SARS-Cov-2 Wuhan virus (MT019531).
-  `query-data-aa.txt.gz` - gzip compressed tab-delimited file with accessions and amino acid sequence for aligned SC2 spike protein sequences (see Data Notes)

## Data Notes

Relationship to previous data from the code-a-thon:
```{bash}
zcat < ../../convergraph/data/input-data.1.txt.gz |cut -f2,6 > query-data-aa.txt
```

Data were generated from a database of NCBI SARS-CoV-2 sequences aligned to Wuhan (removing indels). Original data were unique by CDS but not necessarily by protein sequence. The provided reference file is the outgroup used by Convergraph since it is ancestral to *Delta* and *Omicron*. Importantly, other criteria were also used:
- Spike gene only.
- Date collected from 2021-07-01 to 2022-03-31
- No frameshift insertions
- No ambiguous data longer than 4 residues or codons
- No partial or missing codons
