THEME_DIR := "$(realpath ./Template/aneotheme)"
FONTS_DIR := THEME_DIR + "/fonts"
PDFLATEX_FLAGS := "-shell-escape -interaction=nonstopmode -synctex=1"

default:
  @echo "usage: just compile <tex file>"

compile:
    #!/bin/bash
    export TEXINPUTS="{{THEME_DIR}}//:$TEXINPUTS"
    export OSFONTDIR="{{FONTS_DIR}}//:$OSFONTDIR"
    if which latexmk > /dev/null 2>&1; then
        echo "Using latexmk to compile the document."
        latexmk -lualatex $PDFLATEX_FLAGS "$(realpath ./presentation.tex)"
    else
        echo "Using pdflatex to compile the document."
        lualatex $PDFLATEX_FLAGS "$(realpath ./presentation.tex)"
    fi

clean:
   @rm -f *.aux *.log *.out *.toc *.nav *.snm *.pdf *.fdb_latexmk *.fls
