
OUT:=build
SDCARD:=/media/rick/B4C2-0F27/

# SRC:=mount.scad paddle_board_cup_holder.scad bottom_v1_0.scad
SRC:=strip.scad

DEPS:=$(foreach i,1 2 3 4 5,$(addprefix $(OUT)/,$(addsuffix _$i.deps,$(basename $(SRC)))))

.PHONY: all 
all: $(SRC)
	mkdir -p $(OUT)
	openscad -m make -D "DEPTH=1" -o $(OUT)/strip_1.stl $(SRC)
	openscad -m make -D "DEPTH=2" -o $(OUT)/strip_2.stl $(SRC)
	openscad -m make -D "DEPTH=3" -o $(OUT)/strip_3.stl $(SRC)
	openscad -m make -D "DEPTH=4" -o $(OUT)/strip_4.stl $(SRC)
	openscad -m make -D "DEPTH=5" -o $(OUT)/strip_5.stl $(SRC)

.PHONY: clean
clean:
	rm -rf $(OUT)
