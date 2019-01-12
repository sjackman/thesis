pandoc_opt=-Fpandoc-crossref -Fpandoc-citeproc

.DELETE_ON_ERROR:
.SECONDARY:

all: introduction.pdf redcedar.pdf

# Download the citation style language (CSL)
thesis.csl:
	curl -o $@ https://www.zotero.org/styles/bioinformatics

# Render Markdown to HTML using Pandoc
%.html: %.md
	pandoc $(pandoc_opt) -s -o $@ $<

# Render Markdown to PDF using Pandoc
%.pdf: %.md thesis.bib thesis.csl
	pandoc $(pandoc_opt) --pdf-engine=xelatex -o $@ $<

# Render Markdown to DOCX using Pandoc
%.docx: %.md thesis.bib thesis.csl
	pandoc $(pandoc_opt) -o $@ $<

# Render RMarkdown to HTML using R
%.html: %.rmd thesis.bib thesis.csl
	RScript -e 'rmarkdown::render("$<")'

# Fetch BibTex records from a list of DOI.
%.doi.bib: %.doi
	brew cite $$(<$<) | sort >$@

# Concatentate the citations with and without DOI.
%.bib: %.doi.bib %.other.bib
	sort $^ | sed 's~http://dx.doi.org~https://doi.org~' >$@
