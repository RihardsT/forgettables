docker run --rm -ti debian bash

apt-get update
# Miktex or TeXLive, texmaker
apt-get install -y vim texlive-full latexmk


# Lai latviešu burti būtu, tad kompilē ar XeLaTeX


latexmk -xelatex file.tex