FROM ubuntu

RUN apt-get update && apt-get install texlive-full latexmk -y 
RUN apt-get update && apt-get install just vim git python-is-python3 -y
