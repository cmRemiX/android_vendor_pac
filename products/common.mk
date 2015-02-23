cmRemiX_Version=5.0.2_R1
cmRemiX_BUILD=$(cmRemiX_Version)

ifeq ($(RELEASE),)
ifneq ($(FORCE_BUILD_DATE),)
BUILD_DATE:=.$(FORCE_BUILD_DATE)
else
BUILD_DATE:=$(shell date +".%m%d%y")
endif
cmRemiX_BUILD=$(cmRemiX_Version)$(BUILD_DATE)
endif
