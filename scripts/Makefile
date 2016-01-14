PNG = $(addsuffix .png, $(basename $(wildcard *.sh)))
PDF = $(addsuffix .pdf, $(basename $(wildcard *.sh)))

all: $(PNG) $(PDF)

GMT_stand+_iso+.ps: GMT_iso+.ps  GMT_stand+.ps

%.ps: %.sh
	sh $<

%.png: %.ps
	gmt psconvert -A -Tg -P $<

%.pdf: %.ps
	gmt psconvert -A -Tf -P $<

install:
	mv *.png ../source/images/
	mv *.pdf ../source/images/

clean:
	rm *.png *.pdf *.ps
