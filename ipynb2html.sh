#!/bin/bash

CURRENT_DIR=$HOME/ipython_notebook/lognote_jupyter
IPYNB_DIR=$CURRENT_DIR/ipynb
HTML_DIR=$CURRENT_DIR/html

files="${IPYNB_DIR}/note_*.ipynb"
for fpath in $files; do
    fname_ext="${fpath##*/}"
    if [ -f $HTML_DIR/${fname_ext%.*}.html \
	 -a $HTML_DIR/${fname_ext%.*}.html -nt $fpath ]; then
	:
    else
	cd $CURRENT_DIR && \
    	    jupyter nbconvert --to html $fpath && \
	    mv ${fname_ext%.*}.html html
    fi
done
