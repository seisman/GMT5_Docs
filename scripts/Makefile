PNG = $(addsuffix .png, $(basename $(wildcard *.sh)))

all: $(PNG)

%.ps: %.sh
	sh $<

%.png: %.ps
	gmt ps2raster -A -Tg -P $<

clean:
	rm *.png
