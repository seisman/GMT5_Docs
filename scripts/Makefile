all: $(addsuffix .png, $(basename $(wildcard *.sh)))

%.ps: %.sh
	sh $<

%.png: %.ps
	gmt ps2raster -A -Tg -P $<

clean:
	rm *.png
