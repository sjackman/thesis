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

Table: The sequencing data of western redcedar is composed of three library types, thirteen libraries, and 28 lanes of Illumina sequencing. The sequencing read length is 2 x 151 bp. Depth of coverage is calculated using raw sequencing data before trimming adapters and an estimated genome size of 12.5 Gbp. The molecule size of linked reads is estimated by ChromeQC from alignments to the assembled draft genome, and so underestimates the true molecule size. {#tbl:sequencing}

| Library type | Fragment | Lanes | Sequence  | Depth |
|--------------|---------:|------:|----------:|------:|
| Paired end   |   400 bp |     3 |   437 Gbp |  35.0 |
|              |   400 bp |     3 |   412 Gbp |  33.0 | 
|              |   400 bp |     2 |   257 Gbp |  20.6 |
|              |   400 bp |     2 |   252 Gbp |  20.2 |
| **Total**    |          |    10 | 1,358 Gbp | 108.6 |
| Mate pair    |  2.7 kbp |     2 |   239 Gbp |  19.1 |
|              |  5.4 kbp |     2 |   283 Gbp |  22.6 |
|              |  9.0 kbp |     2 |   283 Gbp |  22.6 |
|              | 10.9 kbp |     2 |   282 Gbp |  22.6 |
|              | 15.5 kbp |     2 |   259 Gbp |  20.7 |
| **Total**    |          |    10 | 1,346 Gbp | 107.7 |
| Linked reads |   35 kbp |     2 |           |       |
|              |   35 kbp |     2 |           |       |       
|              |   20 kbp |     2 |           |       |
|              |   22 kbp |     2 |           |       |
| **Total**    |          |     8 |           |       |

Illumina paired-end sequencing adapters were trimmed using Trimadap 0.1r11 (<https://github.com/lh3/trimadap>). Illumina mate-pair sequencing adapters were trimmed using NxTrim 0.4.3 [@O_Connell_2014]. 10x Genomics Chromium adapters were trimmed using Long Ranger Basic 2.1.6 (<https://github.com/10XGenomics/longranger>). Depth of *k*-mer coverage profiles were computed for multiple values of *k* using ntCard 1.0.1 [@Mohamadi_2017]. We analysed and visualized these *k*-mer coverage profiles using GenomeScope 1.0.0 [@Vurture_2017].

Assembly using a *de Bruijn* graph assembler such as ABySS requires selecting the critical parameter *k*, the size of a *k*-mer. We selected the largest value of *k* that provided a mode *k*-mer coverage of at least 15, which is *k* = 128. The Lander-Waterman equation [@Lander_1988] for a depth of coverage of 15 yields an estimated coverage of 99.99997%, or an expected one missing k-mer per 3.3 Mbp in homozygous regions. This calculation is an optimistic approximation, since the depth-of-coverage of nearby *k*-mers is naturally correlated, and this equation assumes uncorrelated uniform random sampling.

We assembled the paired-end reads using ABySS 2.1.4, and scaffolded using the mate-pair reads with ABySS-Scaffold [@Jackman_2017]. We aligned the linked reads to this draft assembly using BWA-MEM 0.7.17 [@Li_2013]. We identified and corrected misassemblies using the linked reads with Tigmint 1.1.2 [@Jackman_2018]. We scaffolded the assembly using the linked reads with ARCS 1.0.5 [@Yeo_2017] and ABySS-Scaffold. We estimated the molecule size of the linked read libraries using ChromeQC 1.0.4 (<https://bcgsc.github.io/chromeqc/>). We assessed the genome completeness using BUSCO (Benchmarking Universal Single-Copy Orthologs) 3.0.2 [@Waterhouse_2017], which determines what proportion of core single-copy genes are present in the assembly.

# References
