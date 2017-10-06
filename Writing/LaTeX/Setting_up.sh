docker run --rm -ti debian bash

# Miktex or TeXLive, texmaker/texworks
apt-get update && apt-get install -y texlive-full biber latexmk make vim wget


# Lai latviešu burti būtu, tad kompilē ar XeLaTeX

# Build:
latexmk -xelatex file.tex

# With Bibliography
latexmk -xelatex file.tex
latexmk -bibtex file.bib
latexmk -xelatex file.tex
latexmk -xelatex file.tex