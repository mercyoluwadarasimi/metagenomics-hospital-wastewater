# Hospital Wastewater Metagenomics Analysis

## Project Overview

This project is a bioinformatics analysis of publicly available hospital
wastewater metagenomic sequencing data.

The project was undertaken as a practical learning exercise in microbial
metagenomics, with emphasis on taxonomic profiling, microbial diversity,
relative abundance analysis, and antimicrobial resistance (AMR) detection.

## Study Samples

Six publicly available hospital wastewater samples were analyzed.

| Sample | Country | Accession |
|---|---|---|
| BH50_S111 | Benin | ERR7015346 |
| BH61_S116 | Benin | ERR7015351 |
| BFH19_S137 | Burkina Faso | ERR7015367 |
| BFH39_S158 | Burkina Faso | ERR7015387 |
| FH2_S163 | Finland | ERR7015396 |
| FH3_S164 | Finland | ERR7015397 |

## Analysis Workflow

The project uses Galaxy, Linux/WSL, and R.

### 1. Sequencing Data Processing

Initial sequencing-data processing and taxonomic classification were performed
using Galaxy.

The workflow included:

- Quality control of raw sequencing reads
- Read trimming
- Paired-end read processing
- Kraken2 taxonomic classification
- Combination of Kraken2 reports across samples

The resulting data were transferred to Linux/WSL for downstream analysis.

### 2. Taxonomic and Diversity Analysis

Downstream analysis was performed using R.

Completed analyses include:

- Genus-level abundance profiling
- Alpha diversity analysis
- Bray-Curtis dissimilarity
- Beta diversity analysis
- Principal Coordinates Analysis (PCoA)
- Relative abundance analysis
- Top-20 genus visualization
- Top-20 genus relative-abundance heatmap

The combined Kraken reports contained approximately 75.9 million classified
reads across the six samples.

### 3. Antimicrobial Resistance Analysis

AMR determinants were investigated across all six samples.

The AMR workflow included:

- Combining AMR detection results across samples
- AMR determinant identification
- Sample-level detection frequency
- AMR class profiling
- AMR class presence/absence analysis
- AMR class comparison between samples
- Visualization of major AMR classes
- Visualization of the top 20 AMR determinants
- Coverage and sequence-identity quality assessment

A total of 613 AMR detection records representing 234 unique AMR determinants
were identified across the six samples.

The most frequently represented AMR classes by detection records were
beta-lactams, aminoglycosides, and tetracyclines.

One mcr-10 determinant was detected in sample ERR7015367 with 100% reference
coverage and 99.81% sequence identity. This represents metagenomic detection
of an AMR determinant and should not be interpreted as direct evidence of
phenotypic antimicrobial resistance.

## Quality Control of AMR Detections

Across the 613 AMR detection records:

- Minimum reference coverage: 50.00%
- Maximum reference coverage: 100.00%
- Mean reference coverage: 89.69%
- All detections had sequence identity of at least 90%

Coverage and identity were considered when interpreting individual AMR
detections, particularly for partial matches.

## Key Results

The project demonstrates:

- Taxonomic characterization of hospital wastewater metagenomes
- Comparison of microbial diversity across samples
- Relative-abundance profiling of bacterial genera
- Detection and characterization of AMR determinants
- Comparison of AMR classes across wastewater samples
- Quality assessment of detected AMR sequences

The results provide a practical example of how publicly available metagenomic
data can be processed and analyzed for microbial community and antimicrobial
resistance surveillance.

## Repository Structure

```text
metagenomics-hospital-wastewater/
│
├── amr/                  # AMR detection results, tables, and figures
├── metadata/             # Sample metadata
├── results/              # Taxonomic, diversity, and relative-abundance results
├── scripts/              # Reproducible R analysis scripts
│
├── raw_fastq/            # Raw sequencing data (not tracked by Git)
├── trimmed/              # Trimmed reads (not tracked by Git)
├── qc/                   # Quality-control files (not tracked by Git)
├── taxonomic/            # Taxonomic intermediate files (not tracked by Git)
│
├── genus_abundance.tsv   # Genus-level abundance table
├── .gitignore
└── README.md
```
## Tools and Technologies
Galaxy
Kraken2
Linux / WSL
R
ggplot2
dplyr
tidyr
viridis
Git / GitHub
## Data and Reproducibility

The sequencing data used in this project are publicly available datasets.

Raw and trimmed sequencing files are not included in the GitHub repository
because of their size. Intermediate quality-control and taxonomic files are
also excluded through .gitignore.

Processed analysis tables, visualizations, AMR results, metadata, and
reusable analysis scripts are included where appropriate to document the
workflow and support reproducibility.

## Project Purpose

This project serves as a practical bioinformatics learning portfolio,
demonstrating the application of metagenomic analysis tools to hospital
wastewater data.

The project documents a workflow from sequencing quality control and taxonomic
classification through diversity analysis, visualization, and antimicrobial
resistance investigation.
