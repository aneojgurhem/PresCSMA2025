THEME_DIR := "$(realpath ./Template/aneotheme)"
FONTS_DIR := THEME_DIR + "/fonts"
PDFLATEX_FLAGS := "-shell-escape -interaction=nonstopmode -synctex=1"

default:
  @echo "usage: just compile <tex file>"

compile tex_file:
    #!/bin/bash
    export TEXINPUTS="{{THEME_DIR}}//:$TEXINPUTS"
    export OSFONTDIR="{{FONTS_DIR}}//:$OSFONTDIR"
    export TEXMFCACHE="$(realpath ./cache)"
    if which latexmk > /dev/null 2>&1; then
        echo "Using latexmk to compile the document."
        latexmk -lualatex {{PDFLATEX_FLAGS}} "$(realpath {{tex_file}})" -outdir=./build
    else
        echo "Using pdflatex to compile the document."
        lualatex {{PDFLATEX_FLAGS}} "$(realpath {{tex_file}})"
    fi

clean:
   @rm -rf ./build
