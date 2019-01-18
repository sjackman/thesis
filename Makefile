pandoc_opt=-Fpandoc-crossref -Fpandoc-citeproc

.DELETE_ON_ERROR:
.SECONDARY:

all: chapters thesis

chapters: frontmatter.pdf introduction.pdf abyss2.pdf tigmint.pdf uniqtag.pdf orca.pdf whitespruce.pdf psitchensismt.pdf redcedar.pdf

thesis: thesis.pdf

# Aggregate the chapters into a single document.
thesis.md: frontmatter.md introduction.md abyss2.md tigmint.md uniqtag.md orca.md whitespruce.md psitchensismt.md redcedar.md backmatter.md
	gsed -E \
		-e '1,/^\\mainmatter/b' \
		-e 's/^#/##/' \
		-e 's/^title: "(.*)"/# \1/' \
		-e 's/^chaptermark: "(.*)"/\\chaptermark{\1}/' \
		-e '/^author:/,/^---/d' \
		-e '/^## References/d' \
		-e '/^---/d' $^ >$@

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
