
OUT:=build

SRC:=mount.scad
OBJ:=$(addprefix $(OUT)/,$(SRC:.scad=.stl))
FOLDERS:= 18mm_sensor_40mm_fan

vpath %.scad $(FOLDERS)

-include $(OUT)/*.deps

.PHONY: all

all: $(OBJ)

$(OUT)/%.stl: %.scad
	mkdir -p $(@D)
	openscad -m make -o $@ -d $@.deps $<
