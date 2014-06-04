## please modify following line for naming the end products (PDFs, ZIPs, ...)
PROJECTNAME = "thesis-name"

## -----------------------------------------
##       DO NOT EDIT BELOW THIS LINE
## -----------------------------------------

## Makefile von Karl Voit (Karl@Voit.net)

## Edited by Lukas Ender (hello@lukasender.at)

## some Makefile-hints taken from:
## http://www.ctan.org/tex-archive/help/uk-tex-faq/Makefile


MAINDOCUMENTBASENAME = main
MAINDOCUMENTFILENAME = ${MAINDOCUMENTBASENAME}.tex
OUT_DIR = pdf
## COMMANDS:
PDFLATEX_CMD = pdflatex
#BIBTEX_CMD = bibtex
BIBTEX_CMD = biber
MAKEIDX_CMD = makeindex
DATESTAMP = `/bin/date +%Y-%m-%d`
DATESTAMP_AND_PROJECT = ${DATESTAMP}_${PROJECTNAME}
#PDFVIEWER = xpdf
#PDFVIEWER = acroread
PDFVIEWER = open

#help
#helpThe main targets of this Makefile are:
#help	help	this help
.PHONY: help
help:
	@sed -n 's/^#help//p' < Makefile

#help	all	see "pdf"
.PHONY: all
all: pdf

#help	pdf	makes a file per pdflatex
.PHONY: pdf
pdf:
	${PDFLATEX_CMD} ${MAINDOCUMENTFILENAME}
	-${BIBTEX_CMD} ${MAINDOCUMENTBASENAME}
	${PDFLATEX_CMD} ${MAINDOCUMENTFILENAME}
	${PDFLATEX_CMD} ${MAINDOCUMENTFILENAME}
	-test -d ${OUT_DIR} || mkdir ${OUT_DIR}
	-mv ${MAINDOCUMENTBASENAME}.pdf ${OUT_DIR}/${DATESTAMP_AND_PROJECT}.pdf

#help	wc	counts the words from the PDF generated
wc:	pdf
	pdftops ${OUT_DIR}/${DATESTAMP_AND_PROJECT}.pdf
	ps2ascii ${OUT_DIR}/${DATESTAMP_AND_PROJECT}.ps > ${OUT_DIR}/${DATESTAMP_AND_PROJECT}.txt
	wc -w ${OUT_DIR}/${DATESTAMP_AND_PROJECT}.txt


# --------------------------------------------------------

#help	view	view the PDF-file
.PHONY: view
view: pdf
	${PDFVIEWER} ${OUT_DIR}/*_${PROJECTNAME}.pdf

# --------------------------------------------------------


#help	clean	clean up temporary files. CAUTION: backup your data before running this command!
.PHONY: clean
clean:
	-rm -r *.bcf *.run.xml _*_.* *~ *.aux *-blx.bib *.bbl ${MAINDOCUMENTBASENAME}.dvi *.ps *.blg *.idx *.ilg *.ind *.toc *.log *.log *.brf *.out *.lof *.lot *.gxg *.glx *.gxs *.glo *.gls *.tdo -f

#help	purge	cleaner than clean ;-) CAUTION: backup your data before running this command!
.PHONY: purge
purge: clean
	-rm ${OUT_DIR}/20*.pdf *.ps -f

#end

