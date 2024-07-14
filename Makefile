
OUT:=build

SRC:=mount.scad
STL:=$(addprefix $(OUT)/,$(SRC:.scad=.stl))
DEPS:=$(STL:.stl=.deps))
GCODE:=$(STL:.stl=.gcode))

FOLDERS:= 18mm_sensor_40mm_fan

vpath %.scad $(FOLDERS)

-include $(DEPS)

.PHONY: all

all: $(OBJ)

%.gcode: %.stl
	prusa-slicer -g --load ender-config.ini %<

$(OUT)/%.stl: %.scad
	mkdir -p $(@D)
	openscad -m make -o $@ -d $@.deps $<
