pandoc_opt=-Fpandoc-crossref -Fpandoc-citeproc

.DELETE_ON_ERROR:
.SECONDARY:

all: chapters thesis

chapters: frontmatter.pdf introduction.pdf abyss2.pdf tigmint.pdf uniqtag.pdf orca.pdf whitespruce.pdf psitchensismt.pdf redcedar.pdf conclusions.pdf abyss2-appendix.pdf

thesis: thesis.tidy.pdf thesis.docx

# Aggregate the chapters into a single document.
thesis.md: frontmatter.md introduction.md abyss2.md tigmint.md uniqtag.md orca.md whitespruce.md psitchensismt.md redcedar.md conclusions.md references.md appendix.md abyss2-appendix.md backmatter.md
	gsed -E \
		-e '1,/^\\mainmatter/b' \
		-e 's/^#/##/' \
		-e 's/^title: "(.*)"/# \1/' \
		-e 's/^chaptermark: "(.*)"/\\chaptermark{\1}/' \
		-e '/^author:/,/^---$$/d' \
		-e '/^## References/d' \
		-e '/^---$$/d' $^ >$@

# Download the citation style language (CSL)
thesis.csl:
	curl -o $@ https://www.zotero.org/styles/genome-research

# Convert Markdown to LaTeX using Pandoc
%.orig.tex: %.md thesis.bib thesis.csl
	pandoc $(pandoc_opt) --wrap=none -s -o $@ $<

# Tidy up the Pandoc-generated LaTeX.
%.tidy.tex: %.orig.tex
	bin/tidy-tex <$< >$@

# Render LaTeX to PDF using XeLaTeX.
%.pdf: %.tex
	xelatex $<

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
# Preserve title case.
%.bib: %.doi.bib %.other.bib
	sort $^ \
	| sed -E \
		-e 's/title={([^}]*)},/title={{\1}},/' \
		-e 's~http://dx.doi.org~https://doi.org~' \
		>$@
