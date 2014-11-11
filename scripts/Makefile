all: $(addsuffix .ps, $(basename $(wildcard *.sh)))

%.ps: %.sh
	sh $<
