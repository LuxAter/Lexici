SHELL = /bin/bash

# DIRS = $(shell ls -d */)
DIRS = p1 p2 p3

ifndef .VERBOSE
  .SILENT:
endif

define submake
printf "%b\n" "\033[0;35mRunning $(1)...\033[0m";\
cd $(1) && $(MAKE) $(2)
endef

all:
	$(call submake,p1)
	$(call submake,p2)
	$(call submake,p3)
	$(call submake,p4)
	printf "%b\n" "\033[0;34mCompiled all problems\033[0m"

clean:
	$(call submake,p1,clean)
	$(call submake,p2,clean)
	$(call submake,p3,clean)
	$(call submake,p4,clean)
	printf "%b\n" "\033[0;34mCleaned all problems\033[0m"



