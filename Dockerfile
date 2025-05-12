FROM ubuntu

RUN apt-get update && apt-get install texlive-full latexmk just vim git -y
