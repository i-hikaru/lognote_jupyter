#!/bin/bash

IPYNB_DIR=`pwd`
HTML_DIR=$IPYNB_DIR/html

files="${IPYNB_DIR}/note_*.ipynb"
for fpath in $files; do
    fname_ext="${fpath##*/}"
    if [ -f $HTML_DIR/${fname_ext%.*}.html \
	 -a $HTML_DIR/${fname_ext%.*}.html -nt $fpath ]; then
	:
    else
    	jupyter nbconvert --to html $fpath && mv ${fname_ext%.*}.html html
    fi
done
