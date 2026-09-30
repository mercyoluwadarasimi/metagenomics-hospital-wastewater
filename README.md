# Hospital Wastewater Metagenomics Analysis

## Project Overview

This project is a bioinformatics analysis of publicly available hospital
wastewater metagenomic sequencing data.

The project was undertaken as a practical learning exercise in microbial
metagenomics, with emphasis on taxonomic profiling, microbial diversity,
relative abundance analysis, and downstream investigation of antimicrobial
resistance and other metagenomic features.

## Study Samples

Six publicly available hospital wastewater samples were selected for analysis.

| Sample | Country | Accession |
|---|---|---|
| BH50_S111 | Benin | ERR7015346 |
| BH61_S116 | Benin | ERR7015351 |
| BFH19_S137 | Burkina Faso | ERR7015367 |
| BFH39_S158 | Burkina Faso | ERR7015387 |
| FH2_S163 | Finland | ERR7015396 |
| FH3_S164 | Finland | ERR7015397 |

## Analysis Workflow

The project uses a combination of Galaxy, Linux/WSL, and R.

### Data Processing and Taxonomic Classification

Initial sequencing-data processing and taxonomic classification were performed
using Galaxy.

The workflow included:

- Quality control of raw sequencing reads
- Read trimming
- Paired-end read processing
- Kraken2 taxonomic classification
- Combination of Kraken2 reports across samples

The resulting data were subsequently transferred to the Linux/WSL environment
for downstream analysis.

### Downstream Analysis

Downstream analysis was performed using R in the Linux/WSL environment.

Completed analyses include:

- Genus-level abundance profiling
- Alpha diversity analysis
- Bray-Curtis dissimilarity analysis
- Beta diversity analysis
- Principal Coordinates Analysis (PCoA)
- Relative abundance analysis
- Identification of the 20 most abundant genera across samples
- Top-20 genus grouped bar plot
- Top-20 genus relative-abundance heatmap

## Current Project Status

The project has currently completed:

- Public dataset selection
- Quality control
- Read trimming
- Kraken2 taxonomic classification
- Combination of taxonomic reports
- Genus-level abundance analysis
- Alpha diversity
- Bray-Curtis dissimilarity
- Beta diversity
- PCoA
- Relative abundance analysis
- Top-20 genus visualization
- Top-20 genus heatmap

The next stage of the project is antimicrobial resistance (AMR) analysis.

The README will be updated as additional analyses are completed.

## Repository Structure

```text
metagenomics-hospital-wastewater/
│
├── amr/                  # Antimicrobial resistance analysis
├── metadata/             # Sample metadata
├── qc/                   # Quality-control outputs
├── raw_fastq/            # Raw sequencing data (not tracked by Git)
├── results/              # Analysis results and figures
├── scripts/              # Reproducible analysis scripts
├── taxonomic/            # Taxonomic analysis files
├── trimmed/              # Trimmed reads (not tracked by Git)
│
├── genus_abundance.tsv
├── top20_relative_abundance.png
├── top20_relative_abundance_heatmap.png
├── .gitignore
└── README.md
Tools and Technologies
Galaxy
Kraken2
Linux / WSL
R
ggplot2
dplyr
tidyr
Data and Reproducibility

The sequencing data used in this project are publicly available datasets.
Raw and trimmed sequencing files are not included in this repository because
of their large file sizes.

Metadata, analysis results, figures, and analysis scripts are included where
appropriate to document the workflow and support reproducibility.

Project Purpose

This project serves as a practical bioinformatics learning portfolio,
demonstrating the application of metagenomic analysis tools to hospital
wastewater sequencing data.

The project documents the progression from sequencing quality control and
taxonomic classification through statistical analysis, visualization, and
subsequent metagenomic investigations.Tools and Technologies
Galaxy
Kraken2
Linux / WSL
R
ggplot2
dplyr
tidyr
Data and Reproducibility

The sequencing data used in this project are publicly available datasets.
Raw and trimmed sequencing files are not included in this repository because
of their large file sizes.

Metadata, analysis results, figures, and analysis scripts are included where
appropriate to document the workflow and support reproducibility.

Project Purpose

This project serves as a practical bioinformatics learning portfolio,
demonstrating the application of metagenomic analysis tools to hospital
wastewater sequencing data.

The project documents the progression from sequencing quality control and
taxonomic classification through statistical analysis, visualization, and
subsequent metagenomic investigations.
