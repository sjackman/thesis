---
title: "Organellar Genomes of White Spruce (*Picea glauca*): Assembly and Annotation"
chaptermark: "Organellar Genomes of White Spruce"
author: [Shaun D Jackman, Rene Warren, Ewan Gibb, Benjamin P Vandervalk, Hamid Mohamadi, Justin Chu, Anthony Raymond, Stephen Pleasance, Robin Coope, Mark R Wildung, Carol E Ritland, Jean Bousquet, Steven JM Jones, Joerg C Bohlmann, Inanc Birol]
keywords: organelle, plastid, mitochondrion, genome, sequencing, assembly, annotation, white spruce, Picea glauca
bibliography: thesis.bib
csl: thesis.csl
rangeDelim: "&ndash;"
eqnPrefix: "Equation"
figPrefix: "Fig."
tblPrefix: ["Table", "Tables"]
fontsize: 12pt
---

The genome sequences of the plastid and mitochondrion of white spruce (*Picea glauca*) are assembled from whole genome Illumina sequencing data using ABySS. Whole genome sequencing data contains reads from both the nuclear and organellar genomes. Reads of the organellar genomes are abundant, because each cell contains hundreds of mitochondria and plastids. One lane of MiSeq data assembles the 123 kbp plastid genome, and one lane of HiSeq data assembles the 5.9 Mbp draft mitochondrial genome. The coding genes, ribosomal RNA and transfer RNA of both genomes are annotated. The transcript abundance of the mitochondrial genes is quantified in three developmental tissues and five mature tissues. C-to-U RNA editing is observed in the majority of mitochondrial genes and modifies ACG codons to create cryptic AUG start codons in four genes. As of the publication of this chapter (2015-11-28), NCBI GenBank contained a single mitochondrial genome of a gymnosperm (*Cycas taitungensis*), and this work contributed the first coniferous mitochondrial genome.

The white spruce mitochondrial genome is available from NCBI with accession LKAM01 (<https://www.ncbi.nlm.nih.gov/Traces/wgs/LKAM01>).

# Introduction

Most plant cells contain two types of organelles that harbour their own genomes, mitochondria and plastids. In the *Pinaceae*, mitochondrial genomes are inherited maternally, and plastid genomes are inherited paternally [@Whittle_2002].

Complete plastid genomes of the gymnosperms Norway spruce (*Picea abies*) [@Nystedt_2013], *Podocarpus lambertii* [@Vieira_2014_Complete], *Taxus chinensis* var. *mairei* [@Zhang_2014] and four *Juniperus* species [@Guo_2014] have recently been published in NCBI Genbank [@Benson_2014]. These projects used a variety of strategies for isolating cpDNA, using physical separation methods in the lab or computationally separating cpDNA sequences from nuclear sequences, sequencing and assembly, shown in @tbl:cpmethods.

The *Picea abies* genome used 454 GS FLX Titanium sequencing and Sanger sequencing of PCR amplicons for finishing, BLAST [@Altschul_1990] to isolate the cpDNA reads, and the software Newbler to assemble the reads. The *P. lambertii* genome assembly isolated the cpDNA using the saline Percoll gradient protocol of @Vieira_2014_Improved, Illumina MiSeq sequencing and the software Newbler to assemble the reads. The *Juniperus bermudiana* genome assembly used long-range PCR to amplify the plastid DNA, a combination of Illumina GAII and Sanger sequencing, and the software Geneious to assemble the reads using *C. japonica* as a reference genome. The other three *Juniperus* genome assemblies used Illumina MiSeq sequencing and the software Velvet [@Zerbino_2008] to assemble the reads. The *T. chinensis* genome assembly used whole-genome Illumina HiSeq 2000 sequencing, BLAT [@Kent_2002] to isolate the cpDNA reads and SOAPdenovo [@Luo_2012] to assemble the isolated cpDNA reads. All of these projects used DOGMA [@Wyman_2004] to annotate the assembly.

| Species                | cpDNA Separation        | Sequencing               | Assembler software |
|------------------------|-------------------------|--------------------------|--------------------|
| *Picea abies*          | BLAST *in silico*       | 454 GS FLX Titanium ^a^  | Newbler            |
| *Podocarpus lambertii* | Saline Percoll gradient | Illumina MiSeq           | Newbler            |
| *Juniperus bermudiana* | Longer-range PCR        | Illumina GAII ^a^        | Geneious           |
| Other *Juniperus*      | Unspecified             | Illumina MiSeq           | Velvet             |
| *Taxus chinensis*      | BLAT *in silico*        | Illumina HiSeq 2000      | SOAPdenovo         |

Table: Methods of cpDNA separation, sequencing and assembly of complete plastid genomes of gymnosperms published. ^a^ Finished with PCR and Sanger sequencing {#tbl:cpmethods}

Only one complete mitochondrial genome of a gymnosperm has been published, *Cycas taitungensis* [@Chaw_2008], while complete mitochondrial genome sequences of the angiosperms *Brassica maritima* [@Grewe_2014], *Brassica oleracea* (*ibid.*), *Capsicum annuum* [@Jo_2014], *Eruca sativa* [@Wang_2014], *Helianthus tuberosus* [@Bock_2013], *Raphanus sativus* [@Jeong_2014], *Rhazya stricta* [@Park_2014] and *Vaccinium macrocarpon* [@Fajardo_2014] have been published in NCBI Genbank. Six of these projects gave details of the sample preparation, sequencing, assembly and annotation strategy. Three projects enriched organellar DNA using varying laboratory methods [@Keren_2009; @Kim_2007; @Chen_2011], and the remainder used total genomic DNA. Three projects used Illumina HiSeq 2000 sequencing and Velvet for assembly, and three projects used Roche 454 GS-FLX sequencing and Newbler for assembly. Most projects used an aligner such as BLAST [@Altschul_1990] to isolate sequences with similarity to known mitochondrial sequence, either before or after assembly. Two projects used Mitofy [@Alverson_2010] to annotate the genome, and the remainder used a collection of tools such as BLAST, tRNAscan-SE [@Lowe_1997] and ORF Finder to annotate genes. Plant mitochondrial genomes can substantially vary in size, with some of the largest mitochondrial genomes reported for the basal angiosperm *Amborella trichopoda* [3.9 Mbp; @Rice_2013] and the two Silene species *S. noctiflora* and *S. conica* [6.7 Mbp and 11.3 Mbp, respectively; @Sloan_2012].

The SMarTForests project has recently published a set of stepwise improved assemblies of the 20 gigabase white spruce (*Picea glauca*) genome [@Birol_2013; @Warren_2015_Improved], a gymnosperm genome seven times the size of the human genome, sequenced using the Illumina HiSeq and MiSeq sequencing platforms. The whole genome sequencing data contained reads originating from both the nuclear and organellar genomes. Whereas one copy of the diploid nuclear genome is found in each cell, hundreds of organelles are present, and thus hundreds of copies of the organellar genomes. This abundance results in an overrepresentation of the organellar genomes in whole genome sequencing data.

Assembling a single lane of white spruce whole genome sequencing data using the software ABySS [@Simpson_2009] yielded an assembly composed of organellar sequences and nuclear repeat elements. The assembled sequences that originate from the organellar genomes were separated from those of nuclear origin by classifying the sequences using their length, depth of coverage and GC content. The plastid genome of white spruce is compared to that of Norway spruce (*Picea abies*) [@Nystedt_2013], and the mitochondrial genome of white spruce is compared to that of prince sago palm (*Cycas taitungensis*) [@Chaw_2008].

Analysis of cpDNA is useful in reconstructing phylogenies of plants [@Wu_2007], in determining the origin of an expanding population [@Aizawa_2012] and in determining when distinct lineages of a species resulted from multiple colonization events [@Jard_n_Barbolla_2010]. These contrasting inheritance schemes of plastids and mitochondria can be useful in the characterization of species expanding their range. In the case of two previously allopatric species now found in sympatry, the mitochondrial DNA (mtDNA) is contributed by the resident species, whereas introgression of the plastid genome into the expanding species is limited, since pollen is more readily dispersed than seeds [@Du_2011]. Differential gene flow of cpDNA and mtDNA due to different methods of inheritance and dispersion results in new assemblages of organellar genomes and an increase of genetic diversity after expansion from a refugium [@Gerardi_2010].

# Methods

## DNA, RNA and software materials

Genomic DNA was collected from the apical shoot tissues of a single interior white spruce tree, clone PG29, and sequencing libraries constructed as described in @Birol_2013. Because the original intention of this sequencing project was to assemble the nuclear genome, an organelle exclusion method was used to preferentially extract nuclear DNA. Sequencing reads from both organellar genomes were present in sufficient depth however to assemble their genomes.

RNA was extracted from eight samples, three developmental stages and five mature tissues: megagametophyte, embryo, seedling, young buds, xylem, mature needles, flushing buds and bark, described in @Warren_2015_Improved. These samples were sequenced with the Illumina HiSeq 2000 [@Warren_2015_Improved]. The RNA-seq data was used to quantify the transcript abundance of the annotated mitochondrial genes using the software Salmon [@Patro_2014].

The software used in this analysis and their versions are listed in @tbl:whitespruce-versions. All software tools were installed using Homebrew (<https://brew.sh>).

| Software      | Version |
|---------------|---------|
| ABySS         | 1.3.7   |
| ARAGORN       | 1.2.36  |
| BEDTools      | 2.24.0  |
| Biopython     | 1.65    |
| BLAST         | 2.2.30  |
| BWA           | 0.7.12  |
| Barrnap       | 0.5     |
| Exonerate     | 2.2.0   |
| GenomeTools   | 1.5.5   |
| HMMER         | 3.1b2   |
| LINKS         | 1.1     |
| MAKER         | 2.31.8  |
| MUMmer        | 3.23    |
| OGDraw        | 1.1.1   |
| Prodigal      | 2.6.2   |
| Prokka        | 1.11    |
| QUAST         | 2.3     |
| RECON         | 1.0.7   |
| RMBlast       | 2.2.28  |
| RepeatMasker  | 4.0.5   |
| RepeatModeler | 1.0.8   |
| RepeatScout   | 1.0.5   |
| RNAmmer       | 1.2     |
| Salmon        | 0.4.2   |
| SAMtools      | 1.2     |
| TRF           | 4.07b   |
| tRNAscan-SE   | 1.23    |

Table: Software versions used to assemble and annotate the organelles. {#tbl:whitespruce-versions}

## Methods used to assemble the plastid genome

A single lane of Illumina MiSeq paired-end sequencing (SRR525215) was used to assemble the plastid genome. Paired-end sequencing usually leaves a gap of unsequenced nucleotides in the middle of the DNA fragment. Because 300 bp paired-end reads were sequenced from a library of 500 bp DNA fragments, the reads are expected to overlap by 100 bp. These overlapping paired-end reads were merged using ABySS-mergepairs, a component of the software ABySS [@Simpson_2009]. These merged reads were assembled using ABySS. Contigs that are putatively derived from the plastid were separated by length and depth of coverage using thresholds chosen by inspection of a scatter plot (@fig:whitespruce-classifycp). These putative plastid contigs were assembled into scaffolds using ABySS-scaffold.

![Six plastid sequences were separated by length and depth of coverage using thresholds chosen by inspection.](whitespruce/plastid-classify.png){#fig:whitespruce-classifycp width=4in}

We ran the gap-filling application Sealer [@Paulino_2015], with options `-v -j 12 -b 30G -B 300 -F 700` with `-k` from 18 to 108 with step size 6, on the ABySS assembly of the plastid genome, closing 5 of the remaining 7 gaps, with a resulting assembly consisting of two large (\~50 and \~70 kbp) scaftigs. Given the small size of the plastid genome, we opted to manually finish the assembly using the software Consed 20.0 [@Gordon_2013]. We loaded the resulting gap-filled assembly into Consed and imported Pacific Biosciences (PacBio) sequencing data (SRR2148116 and SRR2148117), 9204 reads 500 bp and larger, into the assembly and aligned them to the plastid genome using cross\_match [@Green_1999] from within Consed. For each scaftig end, 6 PacBio reads were pulled out and assembled using the mini-assembly feature in Consed. Cross\_match alignments of the resulting contigs to the plastid assembly were used to merge the two scaftigs and confirm that the complete circular genome sequence was obtained. In a subsequent step, 7,742 Illumina HiSeq reads were imported and aligned to the assembly using Consed. These reads were selected from the library of 133 million reads used to assemble the mitochondrion on the basis of alignment to our draft plastid genome using BWA 0.7.5a [@Li_2013], focusing on regions that would benefit from read import by restricting our search to regions with ambiguity and regions covered by PacBio reads exclusively. The subset of Illumina reads were selected using samtools 0.1.18, mini-assembled with Phrap [@Green_1999] and the resulting contigs re-merged to correct bases in gaps filled only by PacBio, namely one gap and sequence at edges confirming the circular topology. The starting base was chosen using the Norway spruce plastid genome sequence [NC_021456, @Nystedt_2013]. Our assembly was further polished using the Genome Analysis Toolkit (GATK) 2.8-1-g932cd3a FastaAlternateReferenceMaker [@McKenna_2010].

The assembled plastid genome was initially annotated using DOGMA [@Wyman_2004]. Being an interactive web application, it is not convenient for automated annotation. The software MAKER [@Holt_2011] is not interactive and is designed for automated annotation, and we used it to annotate the white spruce plastid using the Norway spruce plastid genome [NC_021456, @Nystedt_2013] for both protein-coding and non-coding gene homology evidence. The inverted repeat was identified using MUMmer [@Kurtz_2004].

The assembled plastid genome was aligned to the Norway spruce plastid using BWA-MEM [@Li_2013]. The two genomes were compared using QUAST [@Gurevich_2013] to confirm the presence of the annotated genes of the Norway spruce plastid in the white spruce plastid.

## Methods used to assemble the mitochondrial genome

ABySS-Konnector [@Vandervalk_2014] was used to fill the gap between the paired-end reads of a single lane of Illumina HiSeq 2000 paired end-sequencing (SRR525196). These connected paired-end reads were assembled using ABySS. Putative mitochondrial sequences were separated from nuclear sequences by their length, depth of coverage and GC content using k-means clustering in R (@fig:whitespruce-classifymt). The putative mitochondrial contigs were then assembled into scaffolds using ABySS-scaffold with a single lane of Illumina HiSeq sequencing of a mate-pair library.

![Mitochondrial sequences were separated by length, depth of coverage, and GC content using k-means clustering in R.](whitespruce/mt-classify.png){#fig:whitespruce-classifymt width=5in}

The ABySS assembly of the white spruce mitochondrial genome resulted in 71 scaffolds. We ran the gap-filling application Sealer attempting to close the gaps between every combination of two scaffolds. This approach closed 10 gaps and yielded 61 scaffolds, which we used as input to the LINKS scaffolder 1.1 [@Warren_2015_LINKS] (options `-k 15 -t 1 -l 3 -r 0.4`, 19 iterations with `-d` from 500 to 6000 with step size 250) in conjunction with long PacBio reads, further decreasing the number of scaffolds to 58. The Konnector pseudoreads were aligned to the 58 LINKS scaffolds with BWA 0.7.5a (`bwa mem -a multimap`), and we created links between two scaffolds when reads aligned within 1000 bp of the edges of any two scaffolds. We modified LINKS to read the resulting SAM alignment file and link scaffolds satisfying this criteria (options `LINKS-sam -e 0.9 -a 0.5`), bringing the final number of scaffolds to 38. We confirmed the merges using mate-pair reads. The white spruce mate-pair libraries used for confirmation are presented in @Birol_2013 and available from SRA (SRP014489). In brief, mate-pair reads from three fragment size libraries (5, 8 and 12\ kbp) were aligned to the 38-scaffold assembly with BWA-MEM 0.7.10-r789 and the resulting alignments parsed with a PERL script. Automated gap-closing was performed with Sealer 1.0  (options `-j 12 -B 1000 -F 700 -P10 -k96 -k80`) using Bloom filters built from the entire white spruce PG29 read data set [@Warren_2015_Improved] and closed 55 of the 182 total gaps (30.2%). We polished the gap-filled assembly using GATK, as described for the plastid genome.

The assembled scaffolds were aligned to the NCBI nucleotide (nt) database using BLAST to check for hits to mitochondrial genomes and to screen for contamination.

The mitochondrial genome was annotated using MAKER [@Holt_2011] and Prokka [@Seemann_2014], and the two sets of annotations were merged using BEDTools [@Quinlan_2010] and GenomeTools [@Gremme_2013], selecting the MAKER annotation when the two tools had overlapping annotations. The proteins of all green plants (*Viridiplantae*) with complete mitochondrial genome sequences in NCBI GenBank [@Benson_2014], 142 species, were used for protein homology evidence, the most closely related of which is the prince sago palm (*Cycas taitungensis*) [NC_010303 @Chaw_2008], being the only gymnosperm with a complete mitochondrial genome. Transfer RNA (tRNA) were annotated using ARAGORN [@Laslett_2004]. Ribosomal RNA (rRNA) were annotated using RNAmmer [@Lagesen_2007]. Prokka uses Prodigal [@Hyatt_2010] to annotate open reading frames. Repeats were identified using RepeatMasker [@Smit_1996] and RepeatModeler.

The RNA-seq reads were aligned to the annotated mitochondrial genes using BWA-MEM and variants were called using samtools and bcftools requiring a minimum genotype quality of 50 to identify possible sites of C-to-U RNA editing.

# Results

## The white spruce plastid genome

The assembly and annotation metrics for the plastid and mitochondrial genomes are summarized in @tbl:metrics. The plastid genome was assembled into a single circular contig of 123,266 bp containing 114 identified genes: 74 protein coding (mRNA) genes, 36 transfer RNA (tRNA) genes and 4 ribosomal RNA (rRNA) genes, shown in @fig:cpgenes.

| Metric                          | Plastid         | Mitochondrion |
|---------------------------------|-----------------|---------------|
| Number of lanes                 | 1 MiSeq lane    | 1 HiSeq lane  |
| Number of read pairs            | 4.9 million     | 133 million   |
| Read length                     | 300 bp          | 150 bp        |
| Number of merged reads          | 3.0 million     | 1.4 million   |
| Median merged read length       | 492 bp          | 465 bp        |
| Number of assembled reads       | 21 thousand     | 377 thousand  |
| Proportion of organellar reads  | 1/140 or 0.7%   | 1/350 or 0.3% |
| Depth of coverage               | 80x             | 30x           |
| Assembled genome size           | 123,266 bp      | 5.94 Mbp      |
| Number of contigs               | 1 contig        | 130 contigs   |
| Contig N50                      | 123 kbp         | 102 kbp       |
| Number of scaffolds             | 1 scaffold      | 36 scaffolds  |
| Scaffold N50                    | 123 kbp         | 369 kbp       |
| Largest scaffold                | 123 kbp         | 1222 kbp      |
| GC content                      | 38.8%           | 44.7%         |
| Number of genes without ORFs    | 114 (108)       | 143 (74)      |
| Protein coding genes (mRNA)     | 74 (72)         | 106 (51)      |
| Ribosomal RNA genes (rRNA)      | 4 (4)           | 8 (3)         |
| Transfer RNA genes (tRNA)       | 36 (32)         | 29 (20)       |
| Open reading frames (ORF) $\geq$ 300 bp | 5       | 1065          |
| Coding genes containing introns | 8               | 5             |
| Introns in coding genes         | 9               | 7             |
| tRNA genes containing introns   | 6               | 0             |

Table: Sequencing, assembly and annotation metrics of the white spruce organellar genomes. The number of distinct genes are shown in parentheses. {#tbl:metrics}

All protein-coding genes are single copy, except *psbI* and *ycf12*, which have two copies each. All tRNA genes are single copy, except *trnH-GUG*, *trnI-CAU*, *trnS-GCU* and *trnT-GGU*, which have two copies each. All rRNA genes are single copy.

The protein-coding genes
*atpF*, *petB*, *petD*, *rpl2*, *rpl16*, *rpoC1* and *rps12*
each contain one intron, and *ycf3* contains two introns.
The tRNA genes
*trnA-UGC*, *trnG-GCC*, *trnI-GAU*, *trnK-UUU*, *trnL-UAA* and *trnV-UAC*
each contain one intron.
Of the 15 introns, 11 are determined to be group II introns by RNAweasel [@Lang_2007].

The first and smallest exons of the genes *petB*, *petD* and *rpl16* are 6, 8 and 9 bp respectively. These genes likely belong to polycistronic transcripts [@Barkan_1988] of their respective protein complexes, but the short size of their initial exons make them difficult to annotate all the same. The initial exons of these genes were added to their annotations manually.

The gene *rps12* of a plastid genome is typically trans-spliced [@Hildebrand_1988], which makes it difficult to annotate using MAKER. It is composed of three exons and one cis-spliced intron. It required manually editing the gene annotation to incorporate trans-splicing in the gene model.

Each copy of the inverted repeat (IR) is 445 bp in size, much smaller than most plants, but typical of *Pinaceae* [@Lin_2010]. Unlike most inverted repeats, which are typically identical, the two copies differ by a single base. The IR contains a single gene, the tRNA *trnI-CAU*.

All 114 genes of the Norway spruce plastid genome [@Nystedt_2013] are present in the white spruce plastid genome in perfect synteny. Alignment of the white spruce genome to the Norway spruce genome using BWA-MEM [@Li_2013] reveal no large-scale structural rearrangements. Alignments of the white spruce plastid genome cover 99.7% of the Norway spruce plastid genome, and the sequence identity in aligned regions is 99.2%.

![The complete plastid genome of white spruce, annotated using MAKER and plotted using OrganellarGenomeDRAW [@Lohse_2007].](whitespruce/plastid-annotation.png){#fig:cpgenes}

## The white spruce mitochondrial genome

The mitochondrial genome was assembled into 38 scaffolds (132 contigs) with a scaffold N50 of 369 kbp (contig N50 of 102 kbp). The largest scaffold is 1222 kbp (@tbl:metrics). The scaffolds were aligned to the NCBI nucleotide (nt) database using BLAST. Of the 38 scaffolds, 26 scaffolds align to mitochondrial genomes, 3 small scaffolds (<10 kbp) align to *Picea glauca* mRNA clones and BAC sequences, 7 small scaffolds (<10 kbp) had no significant hits, and 2 small scaffolds (<5 kbp) align to cloning vectors. These last two scaffolds were removed from the assembly.

The mitochondrial genome contains 106 protein coding (mRNA) genes, 29 transfer RNA (tRNA) genes and 8 ribosomal RNA (rRNA) genes. The 106 protein-coding genes (51 distinct genes) compose 75 kbp (1.3%) of the genome. The 29 tRNA genes are found in 20 distinct species for 15 amino acids. The relative order of the genes on the scaffolds and gene size is shown in @fig:mtgenes. The size of each gene family is shown in @fig:mtgenefamilies.

All tRNA genes are single copy, except *trnD-GUC* which has 3 copies, *trnM-CAU* which has 7 copies, and *trnY-GUA* which has 2 copies. The rRNA gene *rrn5* has 4 copies, *rrn18* has 3 copies, and *rrn26* has 1 copy.

A large number of open reading frames are identified: 6265 of at least 90 bp, composing 1.4 Mbp, and 1065 of at least 300 bp, composing 413 kbp. These open reading frames do not have sufficient sequence similarity to the genes of the *Viridiplantae* mitochondria used for protein homology evidence to be annotated by either MAKER or Prokka.

A total of 7 introns are found in 5 distinct protein-coding genes. The protein-coding genes *nad2*, *nad5*, and *nad7* each contain one intron, and *nad4* and *rps3* each contain two introns. All introns are determined to be group II introns by RNAweasel [@Lang_2007].

Repeats compose 390 kbp (6.6%) of the mitochondrial genome. Simple repeats and LTR Copia, ERV1 and Gypsy are the most common repeats, shown in @fig:mtrepeats.

All 39 protein coding genes and 3 rRNA genes of the *Cycas taitungensis* mitochondrion are seen in white spruce. Of the 22 tRNA genes of *Cycas taitungensis*, 13 are found in white spruce, and 8 tRNA genes are seen in white spruce that are not seen in *Cycas taitungensis*.

![The relative order of the genes on the scaffolds, and the size of each gene. Each box is proportional to the size of the gene including introns, except that genes smaller than 200 bp are shown as 200 bp. The space between genes is not to scale. An asterisk indicates that the gene name is truncated. Only scaffolds that have annotated genes are shown.](whitespruce/mt-gene-order.png){#fig:mtgenes}

![The gene content of the white spruce mitochondrial genome, grouped by gene family. Each box is proportional to the size of the gene including introns. The colour of each gene is unique within its gene family.](whitespruce/mt-genes.png){#fig:mtgenefamilies}

![The repetitive sequence content of the white spruce mitochondrial genome, annotated using RepeatMasker and RepeatModeler.](whitespruce/mt-repeats.png){#fig:mtrepeats}

## The transcriptome of the white spruce mitochondrial genome

The transcript abundance of the mitochondrial coding genes with known function is shown in @fig:mtheatmap. The transcript abundance of the mitochondrial coding genes including open read frames is shown in @fig:mtheatmaporf. Of the samples analyzed, the transcriptomes of megagametophyte and embryo have the highest abundance of coding mitochondrial genes and cluster together.

Of the 106 coding genes with known function, 60 are expressed in at least one of the mature tissues, 29 are expressed in one of the developing tissues but not in a mature tissue, and 17 are not found to be expressed. Of the 6265 ORFs at least 90 bp, 427 (7%) are expressed in at least one of the mature tissues, 2809 (45%) are expressed in one of the developing tissues but not in a mature tissue, and 3029 (48%) are not found to be expressed. A gene with an abundance of at least ten transcripts per million as quantified by Salmon is considered to be expressed. These results are shown in @tbl:expressed.

|    | Both| Mature only| Developing only| Neither|  Sum|
|:---|----:|-----------:|---------------:|-------:|----:|
|CDS |   60|           0|              29|      17|  106|
|ORF |  411|          16|            2809|    3029| 6265|
|Sum |  471|          16|            2838|    3046| 6371|

Table: Number of expressed protein-coding genes and open reading frames tabulated by developmental stage. {#tbl:expressed}

Possible C-to-U RNA editing, positions where the genome sequence shows C but the RNA-seq reads shows T, is observed in 68 of 106 coding genes, with the most highly edited gene, *nad3*, seeing 32 edits, or 9 edits per 100 bp. It can be difficult to distinguish RNA editing events from genomic SNV and miscalled variants caused by misaligned reads. We note however that 91% (1601 of 1751) of the variants called from the RNA-seq data are C-to-T variants (@tbl:whitespruce-mtrnasnv), which indicates that a large fraction of these variants are due to C-to-U RNA editing. C-to-U RNA editing can create new start and stop codons, but it is not able to destroy existing start and stop codons. Editing of the ACG codon to AUG to create a cryptic start codon is frequently seen in organellar genomes [@Neckermann_1994]. Four genes have cryptic ACG start codons and corroborating C-to-U RNA editing evidence in the RNA-seq data: *mttB*, *nad1*, *rps3* and *rps4*.

![A heatmap of the transcript abundance of mitochondrial protein coding genes. Each column is a tissue sample. Each row is a gene. Each cell represents the transcript abundance of one gene in one sample. The colour scale is log~10~(1 + TPM), where TPM is transcripts per million as measured by Salmon.](whitespruce/mt-cds-heatmap.png){#fig:mtheatmap}

![A heatmap of the transcript abundance of mitochondrial protein coding genes, including open reading frames. Each column is a tissue sample. Each row is a gene. Each cell represents the transcript abundance of one gene in one sample. The colour scale is log~10~(1 + TPM), where TPM is transcripts per million as measured by Salmon.](whitespruce/mt-cds-orf-heatmap.png){#fig:mtheatmaporf}

| Ref | Alt | Count |
|-----|-----|------:|
| A   | C   |   11  |
| A   | G   |   19  |
| A   | T   |    4  |
| C   | A   |    8  |
| C   | G   |    6  |
| C   | T   | 1601  |
| G   | A   |   46  |
| G   | C   |    8  |
| G   | T   |   10  |
| T   | A   |    6  |
| T   | C   |   22  |
| T   | G   |   10  |

Table: Counts of types of RNA-seq SNV in mitochondrial protein coding genes. {#tbl:whitespruce-mtrnasnv}

# Conclusions

One lane of MiSeq sequencing of whole genome DNA is sufficient to assemble the 123 kbp plastid genome, and one lane of HiSeq sequencing of whole genome DNA is sufficient to assemble the 5.9 Mbp mitochondrial genome of white spruce. Additional Illumina and PacBio sequencing is used to improved scaffold contiguity and to close scaffold gaps, after which the plastid genome is assembled in a single contig and the largest mitochondrial scaffold is 1.2 Mbp.

The white spruce plastid genome shows no structural rearrangements when compared with Norway spruce, and all genes of the Norway spruce (*Picea abies*) plastid are present in the white spruce plastid. All genes of the prince sago palm (*Cycas taitungensis*) mitochondrion are present in the white spruce mitochondrion.

The protein coding gene content of the mitochondrial genome is quite sparse, with 106 protein coding genes in 5.9 Mbp, in comparison to the plastid genome, with 74 protein coding genes in 123 kbp. Nearly 7% of the mitochondrial genome is composed of repeats, and roughly 1% is composed of coding genes. A significant portion, over 90%, of the unusually large size of the white spruce mitochondrial genome is yet unexplained.

# References
