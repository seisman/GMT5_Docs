PNG = $(addsuffix .png, $(basename $(wildcard *.sh)))

all: $(PNG)

GMT_stand+_iso+.ps: GMT_iso+.ps  GMT_stand+.ps

%.ps: %.sh
	sh $<

%.png: %.ps
	gmt psconvert -A -Tg -P $<

clean:
	rm *.png *.ps
