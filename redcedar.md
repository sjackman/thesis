---
title: "Genome Assembly of Western Redcedar (Thuja plicata)"
author: [Shaun D. Jackman]
bibliography: thesis.bib
csl: thesis.csl
rangeDelim: "&ndash;"
eqnPrefix: "Equation"
figPrefix: "Fig."
tblPrefix: ["Table", "Tables"]
---

# Abstract

# Methods

The sequencing of western redcedar employed three library types of DNA sequencing: short fragment paired end, large fragment mate pair, and linked reads from large molecules using 10x Genomics Chromium, shown in @tbl:sequencing.

Table: The sequencing data of western redcedar is composed of three library types, thirteen libraries, and 28 lanes of Illumina sequencing. The molecule size of linked reads is estimated by ChromeQC from alignments to the assembled draft genome, and so underestimates the true molecule size. {#tbl:sequencing}

| Library type | Fragment | Lanes |
|--------------|---------:|------:|
| Paired end   |   400 bp |     3 |
| Paired end   |   400 bp |     3 |
| Paired end   |   400 bp |     2 |
| Paired end   |   400 bp |     2 |
| Mate pair    |  2.7 kbp |     2 |
| Mate pair    |  5.4 kbp |     2 |
| Mate pair    |  9.0 kbp |     2 |
| Mate pair    | 10.9 kbp |     2 |
| Mate pair    | 15.5 kbp |     2 |
| Linked reads |   35 kbp |     2 |
| Linked reads |   35 kbp |     2 |
| Linked reads |   20 kbp |     2 |
| Linked reads |   22 kbp |     2 |

Illumina paired-end sequencing adapters were trimmed using Trimadap (<https://github.com/lh3/trimadap>). Illumina mate-pair sequencing adapters were trimmed using NxTrim [@O_Connell_2014]. The quality of the sequencing data was analyzed, visualized, and inspected using FastQC (<https://github.com/s-andrews/FastQC>). Depth of *k*-mer coverage profiles were computed for multiple values of *k* using ntCard [@Mohamadi_2017]. We analysed and visualized these *k*-mer coverage profiles using GenomeScope [@Vurture_2017]. Assembly using a *de Bruijn* graph assembler such as ABySS requires selecting the critical parameter *k*, the size of a *k*-mer. We selected the largest value of *k* that provided a mode *k*-mer coverage of at least 15, which is *k* = 128. The Lander-Waterman equation [@Lander_1988] for a depth of coverage of 15 yields an estimated coverage of 99.99997%, or an expected one missing k-mer per 3.3 Mbp in homozygous regions. This calculation is an optimistic approximation, since the depth-of-coverage of nearby *k*-mers is naturally correlated, and this equation assumes uncorrelated uniform random sampling. We assembled the paired-end reads using ABySS 2.0, and scaffolded using the mate-pair reads with ABySS-Scaffold [@Jackman_2017]. We aligned the linked reads to this draft assembly using BWA-MEM [@Li_2013]. We identified and corrected misassemblies using the linked reads with Tigmint [@Jackman_2018]. We scaffolded the assembly using the linked reads with ARCS [@Yeo_2017] and ABySS-Scaffold. We estimated the molecule size of the linked read libraries using ChromeQC (<https://github.com/bcgsc/chromeqc>). We assessed the genome completeness using BUSCO (Benchmarking Universal Single-Copy Orthologs) [@Waterhouse_2017], which determines what proportion of core single-copy genes are present in the assembly.

# References
