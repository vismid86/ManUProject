PROGRAM_NAME = blinky

ROOTDIR ?= $(abspath ../..)

OBJ_LIST = main.o

ifeq (sim, $(notdir $(PLATFORM)))
	OBJ_LIST+=sim.o
endif

include $(ROOTDIR)/terminal/app.mk
