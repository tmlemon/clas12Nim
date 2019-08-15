#!/bin/sh

name=nima-rich

pdflatex $name.tex
pdflatex $name.tex
#dvipdf  $name $name.pdf
rm -f $name.aux
rm -f $name.dvi
rm -f $name.log
rm -f $name.spl
