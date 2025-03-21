
OUT:=build
SDCARD:=/media/rick/B4C2-0F27/

# SRC:=mount.scad paddle_board_cup_holder.scad bottom_v1_0.scad
SRC:=bottom_v1_0.scad lid_v1_0.scad
STL:=$(addprefix $(OUT)/,$(SRC:.scad=.stl))
DEPS:=$(STL:.stl=.deps)
GCODE:=$(STL:.stl=.gcode)

FOLDERS:= 18mm_sensor_40mm_fan paddle_board_cup_holder zynq_box

vpath %.scad $(FOLDERS)

-include $(DEPS)

.PHONY: all copy clean gcode stl

all: gcode

gcode: $(GCODE)

stl: $(STL)

copy: $(GCODE)
	cp $^ $(SDCARD)
	umount $(SDCARD)

$(OUT)/%.gcode: $(OUT)/%.stl
	prusa-slicer -g --load ender-config.ini $< -o $@

$(OUT)/%.stl: %.scad
	mkdir -p $(@D)
	openscad -m make -o $@ -d $@.deps $<

clean:
	rm -rf $(OUT)
