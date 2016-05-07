TAR_NAME:=scutthesis-1.7
NAME:=scutthesis
SM_NAME:=sample_test
all: tar

tar:
	git archive master --format=tar.gz --prefix=$(TAR_NAME)/ --verbose -o dist/$(TAR_NAME).tar.gz
zip:clean
	mkdir -p $(TAR_NAME)
	cp -r figure/ $(TAR_NAME)
	cp  scutthesis.* README.* sample_test.* thesis_cover.* $(TAR_NAME)
	zip -r $(TAR_NAME).zip $(TAR_NAME)
	rm -rf $(TAR_NAME)
sample:
	xelatex -interaction=nonstopmode $(SM_NAME).tex 
	bibtex $(SM_NAME).aux
	xelatex -interaction=nonstopmode $(SM_NAME).tex
	xelatex -interaction=nonstopmode $(SM_NAME).tex
	make clean
	evince $(SM_NAME).pdf
	
pdf:
	lyx -e xetex scutthesis.lyx 
	sed -i -e '1,20s/unicode=true/unicode=false/' $(NAME).tex 
	xelatex -interaction=nonstopmode $(NAME).tex 
	#bibtex $(NAME).aux
	#xelatex -interaction=nonstopmode $(NAME).tex
	make clean
	evince $(NAME).pdf

test_pdf:
	 xelatex -interaction=nonstopmode sample_test.tex 
clean:
	rm -rf *.aux *.idx *.log *.bbl *.blg *.out *.toc *.lot *.lof *.synctex.gz
