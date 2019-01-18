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
codeBlockCaptions: True
documentclass: book
classoption: [oneside, openany]
fontsize: 12pt
header-includes: |
    \usepackage[section]{tocbibind}
    \usepackage[onehalfspacing]{setspace}
---

\frontmatter

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

| TBD
| University Examiner

\newpage

## Abstract

## Lay Summary

## Preface

\newpage

\tableofcontents

\newpage

\listoftables

\newpage

\listoffigures

\newpage

## Abbreviations

| **BED**: browser extensible data
| **bp**: base pair
| **Gbp**: gigbase pair
| **GIAB**: Genome in a Bottle
| **kbp**: kilobase pair
| **Mbp**: megabase pair
| **NCBI**: National Center for Biotechnology Information
| **RAM**: random access memory
| **RSS**: resident set size
| **SMS**: single-molecule sequencing
| **SRA**: Sequence Read Archive

## Acknowledgements

## Dedication

I dedicate this work to my joyful and passionate wife and partner in life, Liz, my inquisitive wee scientists, Daphne and Jake, my supportive and inspiring parents, Mike and Agnes, and my bright and cheerful siblings, Katie, Thomas, Meghan, and Ashley. I am grateful to everyone who was helped watch and raise my children, Nana, Papa, and Uncle Landon in particular. My life is full of fun and laughter thanks to you all!

\mainmatter
