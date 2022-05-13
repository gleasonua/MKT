ALL_FIGURE_NAMES=$(shell cat ballegg1.figlist)
ALL_FIGURES=$(ALL_FIGURE_NAMES:%=%.pdf)

allimages: $(ALL_FIGURES)
	@echo All images exist now. Use make -B to re-generate them.

FORCEREMAKE:

-include $(ALL_FIGURE_NAMES:%=%.dep)

%.dep:
	mkdir -p "$(dir $@)"
	touch "$@" # will be filled later.

ballegg1-figure0.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "ballegg1-figure0" "\def\tikzexternalrealjob{ballegg1}\input{ballegg1}"; convert -density 300 -transparent white "ballegg1-figure0.pdf" "ballegg1-figure0.png"

ballegg1-figure0.pdf: ballegg1-figure0.md5
