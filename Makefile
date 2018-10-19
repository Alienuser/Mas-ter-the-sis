FILE=Master
DEPS=content/*

FILE_DEPS=$(FILE).tex $(DEPS)

all: $(FILE).pdf

$(FILE).pdf: $(FILE_DEPS)
	pdflatex $(FILE)
	bibtex $(FILE)
	makeindex -s $(FILE).ist -t $(FILE).alg -o $(FILE).acr $(FILE).acn
	makeindex -s $(FILE).ist -t $(FILE).glg -o $(FILE).gls $(FILE).glo
	makeindex -s $(FILE).ist -t $(FILE).slg -o $(FILE).syi $(FILE).syg
	pdflatex $(FILE)
	pdflatex $(FILE)
	-rm content/**/*.aux
	-rm content/*.aux
	-rm *.log *.aux *.out *.toc *.lof *.lot *.idx *.acr *.alg *.acn *.glg *.glo *.ind *.idx *.lol *.gls *.ilg *.ist *.syi *.syg *.slg *.blg *.bbl *.fdb_latexmk *.fls

clean:
	-rm *.pdf
	-rm content/**/*.aux
	-rm content/*.aux
	-rm *.log *.aux *.out *.toc *.lof *.lot *.idx *.acr *.alg *.acn *.glg *.glo *.ind *.idx *.lol *.gls *.ilg *.ist *.syi *.syg *.slg *.blg *.bbl *.fdb_latexmk *.fls

.PHONY: clean