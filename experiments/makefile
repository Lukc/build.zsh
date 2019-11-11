COLORS:= auto
ifeq  "${COLORS}" "auto"
	COLORS = $(shell test -t 2 && echo true || echo false )
endif
ifeq "${COLORS}" "true"
	BRAG = BRAG() { echo "$$2";}; BRAG
else
	BRAG = BRAG() { echo "$$1";}; BRAG
endif

all:
	@ echo ${COLORS}
	@ $(BRAG) "Luka won" "[1m[31mLuka won[0m[31m[39m"

