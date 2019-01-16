---
title: "Introduction"
author: [Shaun D. Jackman]
bibliography: thesis.bib
csl: thesis.csl
rangeDelim: "&ndash;"
eqnPrefix: "Equation"
figPrefix: "Fig."
tblPrefix: ["Table", "Tables"]
---

Genome sequence assembly is an important open problem of bioinformatics. More contiguous genome assemblies expand the biological questions that may be answered from the assembly. To annotate a gene requires that the gene be assembled into a single scaffold. Comparison of gene synteny between species requires that adjacent genes be assembled into a single scaffold. These biological questions and many others are hampered by a fragmented assembly. Whole genome short read sequencing data is a cost effective means of providing the bulk of the data for a genome sequencing project. An assembly of only short read sequencing data however is confounded by repeats. Advances in sequencing technology provide long distance information that may be used to resolve repeats, but the data produced by these revolutionary technologies are often significantly different in nature than the technologies that came before. Existing algorithms and software must be adapted to benefit from these new sources of genomic information.

Two recent advances in sequencing technology are able to provide long-range genomic information: single-molecule sequencing [@Rusk_2009] and linked reads [@Eisenstein_2015]. Each technology has its own characteristic merits and challenges.

Single-molecule sequencing technologies yield long reads, which is their primary advantage. A secondary advantage of these technologies is that they do not rely on amplification, such as PCR, to construct the sequencing library, and so provide more uniform coverage of the genome. The biggest challenge to the analysis of these reads is the poor sequencing quality inherent in sequencing one single molecule of DNA. Whereas short-read sequencing produces reads that are over 99% accurate, or fewer than one error in a hundred bases, single-molecule sequencing data produces reads that are less than 90% accurate, or one error in every ten bases. Designing algorithms that can analyse reads with such high error rates is the primary challenge posed by single-molecule sequencing.

Whereas paired-end sequencing produces two reads from each fragment of DNA, one from each end, the linked reads of 10X Genomics Chromium extends this concept to sequence multiple reads from each molecule of DNA. The primary benefit of linked reads is the large molecule size, with DNA molecules larger than 100 kbp [@Weisenfeld_2017]. A significant challenge is that each barcode contains multiple molecules of DNA, resulting in reads from disparate regions of the genome being present in a single barcode. When aligning to a reference genome, reads that align near each other can be grouped to infer which reads originate from the same molecule of DNA. When aligning to the contigs of a fragmented assembly, reads from the same barcode may be split across multiple contigs, but it is not evident whether those reads derived from the same molecule.

Assembling a genome using only single-molecule sequencing have provided genome assemblies that are more contiguous than assemblies using only short-read sequencing, as the long reads are better able to span repetitive sequences. Using only single-molecule sequencing has two limitations: the high error rate of the sequences imposes algorithmic and computational challenges, and single-molecule sequencing is currently significantly more expensive than short-read sequencing.

A number of algorithms capable of assembling genomes using only single-molecule sequencing have been developed in recent years. The assemblers HGAP [@Chin_2013], Falcon [@Pendleton_2015; @Chin_2016], Canu [@Koren_2017], Miniasm [@Li_2016], Flye [@Kolmogorov_2018], and MARVEL [@Nowoshilow_2018] are capable of assembling genomes using only single-molecule sequencing. An axolotl salamander (*Ambystoma mexicanum*) genome at 32 Gbp is the largest assembled using only PacBio sequencing [@Nowoshilow_2018], and a human genome at 3 Gbp is the largest assembled using only Nanopore sequencing [@Jain_2018].

Short-read sequencing is currently more cost effective than long read sequencing. Large genome assembly projects constrained by cost continue to rely on short-read sequencing for the bulk of the sequencing depth. To achieve the contiguity desired of an assembly, additional sequencing methods must be used to provide the long-range genomic information.

Three conifer genomes have been assembled, all 20 Gbp and larger: loblolly pine (*Pinus taeda*) [@Zimin_2014], Norway spruce (*Picea abies*) [@Nystedt_2013], and white spruce (*Picea glauca*) [@Birol_2013; @Warren_2015]. Few assemblers are capable of assembling genomes of this size. The loblolly pine genome was assembled using MaSuRCA [@Zimin_2013]. The Norway spruce genome used a hierarchical sequencing strategy and was assembled using commercial software from CLC bio (<http://clcbio.com>). The white spruce genome was assembled using ABySS [@Simpson_2009].

# References
