---
title: "Efficient Assembly of Large Genomes"
author: [Shaun D. Jackman]
date: \today{}
bibliography: thesis.bib
csl: thesis.csl
rangeDelim: "&ndash;"
eqnPrefix: "Equation"
figPrefix: "Fig."
tblPrefix: ["Table", "Tables"]
lstPrefix: ["Listing", "Listings"]
codeBlockCaptions: True
cref: true
documentclass: book
classoption: [oneside, openany]
fontsize: 12pt
header-includes: |
    \usepackage[section]{tocbibind}
    \usepackage[onehalfspacing]{setspace}
    \newcommand{\crefrangeconjunction}{--}
---

\frontmatter

\thispagestyle{empty}

\begin{center}
\Large

Efficient Assembly of Large Genomes
\vspace{1cm}

by
\\ Shaun D. Jackman
\\ B.A.Sc., Simon Fraser University, 2004
\vspace{1cm}

A dissertation submitted in partial fulfillment of
\\ the requirements for the degree of
\vspace{5mm}

Doctor of Philosophy
\vspace{5mm}

in
\vspace{5mm}

The Faculty of Graduate and Postdoctoral Studies
\\ (Bioinformatics)
\vspace{5mm}

The University of British Columbia
\\ (Vancouver)
\vspace{5mm}

May 2019

\vfill
\normalsize
Copyright 2019 Shaun Jackman
\end{center}

\newpage

The following individuals certify that they have read, and recommend to the Faculty of Graduate and Postdoctoral Studies for acceptance, the dissertation entitled:
\vspace{5mm}

Efficient Assembly of Large Genomes
\vspace{5mm}

submitted by Shaun Jackman in partial fulfillment of the requirements for

the degree of Doctor of Philosophy

in Bioinformatics
\vspace{5mm}

**Examining Committee:**
\vspace{5mm}

| Inanc Birol, Medical Genetics
| Co-supervisor
\vspace{5mm}

| J&ouml;rg Bohlmann, Michael Smith Laboratories
| Co-supervisor
\vspace{5mm}

| Steven Hallam, Microbiology & Immunology
| Supervisory Committee Member
\vspace{5mm}

| Steven Jones, Medical Genetics
| Supervisory Committee Member
\vspace{5mm}

| TBD
| University Examiner
\vspace{5mm}

| Keith Adams, Botany
| University Examiner

\newpage

## Abstract

Genome sequence assembly presents a fascinating and frequently-changing challenge. As DNA sequencing technologies evolve, the bioinformatics methods used to assemble sequencing data must evolve along with it. Sequencing technology has evolved from slab gel sequencing, to capillary sequencing, to short read sequencing by synthesis, to long-read and linked-read single-molecule sequencing. Each evolutionary jump in sequencing technology required developing new bioinformatic tools to address the unique characteristics of its sequencing data. This work reports the development of efficient methods to assemble short-read and linked-read sequencing data, named ABySS 2.0 and Tigmint. ABySS 2.0 reduces the memory requirements of short-read genome sequencing assembly by ten fold compared to ABySS 1.0. It does so by using a Bloom filter probabilistic data structure to represent a de Bruijn graph. Tigmint uses linked reads to identify large-scale errors in a genome sequence assembly. Correcting assembly errors using Tigmint before scaffolding improves both the contiguity and correctness of the assembly compared to scaffolding without correction. I applied these methods to assemble the 12 gigabase genome of western redcedar (*Thuja plicata*), which is four times the size of the human genome.

Although numerous mitochondrial genomes of angiosperm are available, few mitochondria of gymnosperms have been sequenced. I assembled the plastid and mitochondrial genomes of white spruce (*Picea glauca*) using whole genome short read sequencing. I assembled the mitochondrial genome of Sitka spruce (*Picea sitchensis*) using whole genome long read sequencing, the largest complete genome assembly of a gymnosperm mitochondrion. The mitochondrial genomes of both species include a remarkable number of trans-spliced genes.

I have developed two additional tools, UniqTag and ORCA. UniqTag assigns unique and stable gene identifiers to genes based on their sequence content. This gene labeling system addresses the inconvenience of gene identifiers changing between versions of a genome assembly. ORCA is a comprehensive bioinformatics computing environment, which includes hundreds of bioinformatics tools in a single easily-installed Docker image, and is useful for education and research.

In summary, ABySS 2.0 and Tigmint enable the efficient assembly of large genomes using both short reads and linked reads, and the genome sequence assembly of western redcedar demonstrates their practical utility.

## Lay Summary

A DNA sequencing machine reads the ACGT nucleotides that compose the chromosomes of a genome, much as a digital camera converts a landscape to a sequence of ones and zeros. An ideal DNA sequencing machine would read an entire chromosome of DNA from beginning to end, with perfect fidelity. Practical DNA sequencing machines are able to read only snippets of DNA, and they make errors while reading the microscopic DNA, yielding imperfect sequence. I have developed software tools to reconstruct the true genome sequence from this imperfect DNA sequencing data. The program ABySS 2.0 reduces the memory (RAM) needed for genome assembly by ten fold. The program Tigmint corrects genome sequence assembly errors using a sequencing strategy called linked reads. I apply these tools to assembling the genome sequence of human and three conifers, white spruce, Sitka spruce, and western redcedar, whose genomes are many times larger than human.

## Preface

All lab work, including sample preparation, library preparation, and sequencing, was conducted by collaborators.

**Chapter 2**: ABySS 2.0. A version of this material has been published as Shaun D Jackman, Benjamin P Vandervalk, Hamid Mohamadi, Justin Chu, Sarah Yeo, S Austin Hammond, Golnaz Jahesh, Hamza Khan, Lauren Coombe, Rene L Warren, Inanc Birol (2017) ABySS 2.0: Resource-efficient assembly of large genomes using a Bloom filter. *Genome Research*, 27, 768–777 (<https://doi.org/10.1101/gr.214346.116>). Ben Vandervalk and I are joint first authors and contributed equally to the software development, and writing of the paper. I conducted the data analyses. Hamid Mohamadi developed ntHash, a software component used by ABySS 2.0. Martin Krzywinski provided feedback on the data visualization of the chromosome ideogram and Circos figures. All authors provided feedback on the manuscript.

**Chapter 3**: Tigmint. A version of this material has been published as Shaun D Jackman, Lauren Coombe, Justin Chu, Rene L Warren, Benjamin P Vandervalk, Sarah Yeo, Zhuyi Xue, Hamid Mohamadi, Joerg Bohlmann, Steven JM Jones, Inanc Birol (2018) Tigmint: Correcting assembly errors using linked reads from large molecules. *BMC Bioinformatics*, 19 (<https://doi.org/10.1186/s12859-018-2425-6>). SDJ drafted the manuscript. SDJ and IB revised the manuscript. SDJ designed and executed the data analysis. SDJ, LC, and ZX performed exploratory data analysis. SDJ, LC, and JC implemented Tigmint. SDJ, LC, JC, RLW, and SY implemented ARCS. SDJ, BPV, and HM implemented ABySS 2. JC implemented JupiterPlot and created the JupiterPlot figure. JB, SJMJ, and IB supervised the project and secured funding. All authors provided critical feedback of the manuscript.

**Chapter 4**: UniqTag. A version of this material has been published as Shaun D Jackman, Joerg Bohlmann, Inanc Birol (2014). UniqTag: Content-derived unique and stable identifiers for gene annotation. *PLOS ONE*, 10(5) (<https://doi.org/10.1371/journal.pone.0128026>). I developed the software, conducted the data analyses, and wrote the paper. All authors provided feedback on the manuscript.

**Chapter 5**: ORCA. I lead the development of the software in collaboration with Tatyana Mozgacheva, Susie Chen, and Brendan O'Huiginn. Tatyana Mozgacheva and I contributed equally to writing the manuscript. All authors provided feedback on the manuscript, which has been submitted for publication.

**Chapter 6**: White spruce organelles. A version of this material has been published as Shaun D Jackman, Rene Warren, Ewan Gibb, Benjamin P Vandervalk, Hamid Mohamadi, Justin Chu, Anthony Raymond, Stephen Pleasance, Robin Coope, Mark R Wildung, Carol E Ritland, Jean Bousquet, Steven JM Jones, Joerg C Bohlmann, Inanc Birol (2015). Organellar Genomes of White Spruce (Picea glauca): Assembly and Annotation. Genome Biology and Evolution, 8(1), 29–41 (<https://doi.org/10.1093/gbe/evv244>). I conducted the data analyses and wrote the paper. Martin Krzywinski and I developed the data visualization of the gene of the white spruce mitochondrion (@fig:mtgenes). All authors provided feedback on the manuscript.

**Chapter 7**: Sitka spruce mitochondrion. I conducted the data analyses and wrote the manuscript, which I intend to submit for publication.

**Chapter 8**: Western redcedar. I conducted the data analyses and wrote this chapter.

\newpage

\tableofcontents

\newpage

\listoftables

\newpage

\listoffigures

\newpage

\markboth{}{}

## Abbreviations

| **BAM**: Binary Alignment Map
| **BED**: browser extensible data
| **bp**: base pair
| **Gbp**: gigbase pair
| **GFA**: Graphical Fragment Assembly
| **GIAB**: Genome in a Bottle
| **kbp**: kilobase pair
| **Mbp**: megabase pair
| **NCBI**: National Center for Biotechnology Information
| **RAM**: random access memory
| **RSS**: resident set size
| **SAM**: Sequence Alignment Map
| **SMS**: single-molecule sequencing
| **SRA**: Sequence Read Archive

## Acknowledgements

I thank my supervisor Inanc Birol his guidance and support through my PhD, which I have thoroughly enjoyed thanks to his kind and encouraging nature. I thank my co-supervisor Joerg Bohlmann for providing a biological context for my computational work. I thank my supervisory committee members, Steven Hallam and Seven Jones, for their feedback on this thesis. I acknowledge the contributions of my colleagues with whom I have collaborated to write the papers found in this thesis. I am thankful to have spent time with my fellow students and friends in the Birol lab. I am grateful to my collaborators and colleagues in the wet lab, without whom I would have no sequencing data to analyze. Finally, I am grateful for the financial support of the Natural Sciences and Engineering Research Council of Canada (NSERC), who funded my studies, and the agencies that funded the individual research projects, described below.

**Chapter 2**: ABySS 2.0. This work was funded by the United States National Human Genome Research Institute of the National Institutes of Health (under award number R01HG007182), with additional support provided by Intel, Genome Canada, Genome British Columbia, and the British Columbia Cancer Foundation. The content is solely the responsibility of the authors and does not necessarily represent the official views of the National Institutes of Health or other funding organizations.

**Chapter 3**: Tigmint. This work was funded by Genome Canada, Genome British Columbia, Natural Sciences and Engineering Research Council of Canada (NSERC), National Institutes of Health (NIH). The funding agencies were not involved in the design of the study and collection, analysis, interpretation of data, nor writing the manuscript.

**Chapter 4**: UniqTag. The authors thank Nathaniel Street for his enthusiastic feedback, the SMarTForests project and the organizers of the 2014 Conifer Genome Summit that made our conversation possible. This work was funded by Genome Canada and Genome British Columbia.

**Chapter 5**: ORCA. We thank Danielle Lalonde (<http://danilalo.com>) for the Linuxbrew and Brewsci logos, the developers of the software packages included with ORCA, the developers of the Homebrew and Linuxbrew package managers, and those who contributed the scripts to package these tools. This work was funded by Genome Canada and Genome British Columbia.

**Chapter 6**: White spruce organelles. This work was funded by Genome Canada, Genome British Columbia and Genome Quebec as part of the SMarTForests Project (<https://www.smartforests.ca>). We thank Carson Holt for his help with using the MAKER genome annotation software tool.

**Chapter 7**: Sitka spruce mitochondrion. This work was funded by Genome Canada and Genome British Columbia.

**Chapter 8**: Western redcedar. This work was funded by the United States Department of Energy (DOE) Joint Genome Institute (JGI).

## Dedication

I dedicate this work to my joyful and passionate wife and partner in life, Liz, my inquisitive wee scientists, Daphne and Jake, my supportive and inspiring parents, Mike and Agnes, and my bright and cheerful siblings, Katie, Thomas, Meghan, and Ashley. I am grateful to everyone who was helped watch and raise my children, Nana, Papa, and Uncle Landon in particular. My life is full of fun and laughter thanks to you all!

\mainmatter
