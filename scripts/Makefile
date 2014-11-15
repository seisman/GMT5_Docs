all: $(addsuffix .ps, $(basename $(wildcard *.sh)))

%.ps: %.sh
	sh $<

clean:
	rm *.ps
