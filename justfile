THEME_DIR := "$(realpath ./Template/aneotheme)"
PDFLATEX_FLAGS := "-shell-escape -interaction=nonstopmode -synctex=1"

default:
  @echo "usage: just compile <tex file>"

compile tex_file:
    #!/bin/bash
    export TEXINPUTS="{{THEME_DIR}}:$TEXINPUTS"
    if which latexmk > /dev/null 2>&1; then
        echo "Using latexmk to compile the document."
        latexmk -pdf $PDFLATEX_FLAGS "$(realpath {{tex_file}})"
    else
        echo "Using pdflatex to compile the document."
        pdflatex $PDFLATEX_FLAGS "$(realpath {{tex_file}})"
    fi

clean:
   @rm -f *.aux *.log *.out *.toc *.nav *.snm *.pdf *.fdb_latexmk *.fls
