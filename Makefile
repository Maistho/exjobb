TEX = pdflatex -shell-escape -interaction=batchmode -file-line-error -output-format=pdf
BIB = bibtex

make : exjobb.pdf

exjobb.pdf : exjobb.tex exjobb.bbl exjobb.blg
	$(TEX) exjobb.tex
	make clean

exjobb.bbl exjobb.blg : exjobb.bib exjobb.aux
	 $(BIB) exjobb

exjobb.aux : exjobb.tex
	$(TEX) exjobb.tex

exjobb.bib : exjobb.tex
	$(TEX) exjobb.tex

clean:
	rm -rf $(TARGET) *.class *.html *.log *.aux *.out
