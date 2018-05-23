SHELL = /bin/bash

ifndef .VERBOSE
  .SILENT:
endif

EXE_FILES = $(shell find -name "*.ml")
EXE = $(EXE_FILES:%.ml=%.a)

define compile
printf "%b" "\033[0;33m[ ] Compiling $(1)..."
$(2) > $@.log;\
  RESULT=$$?;\
  if [ $$RESULT -ne 0 ]; then \
    printf "%b\n" "\033[1k\033[G\033[0;31m[\u2716] Compiling $(1)\033[0m";\
  else \
    printf "%b\n" "\033[1K\033[G\033[0;32m[\u2714] Compiling $(1)\033[0m";\
  fi;\
  cat $@.log;\
  rm -f $@.log
endef
define clean
if [[ -e "$(1)" ]]; then \
  name=$(1);\
  printf "%b" "\033[0;33m[ ] Removing $(1)...";\
  rm $(1);\
  rm "$${name%.*}.o";\
  rm "$${name%.*}.cmi";\
  rm "$${name%.*}.cmx";\
  printf "%b\n" "\033[1K\033[G\033[0;32m[\xE2\x9C\x94] Removing $(1)\033[0m";\
fi
endef

define cleanDir
if [[ -e "$(1)" ]]; then \
    printf "%b" "\033[0;97mRemoving $(1)...";\
    rm $(1) -rf;\
    printf "%b\n" "\033[0;32m\xE2\x9C\x94\033[0m";\
fi
endef

all: build

build: $(EXE)
	printf "%b\n" "\033[0;$(BUILD);1mCompiled all projects\033[0m"

clean: $(EXE)
	printf "%b\n" "\033[0;$(CLEAN);1mRemoved all projects\033[0m"

list: $(EXE)
	printf "%b\n" "\033[0;$(LIST);1mListed all projects\033[0m"

ifeq ($(CMD),clean)
%.a: FORCE
	$(call clean,$@)
else ifeq ($(CMD),list)
%.a: FORCE
	printf "\033[$(LIST)m OCaml $@\033[0m\n"
else
%.a: %.ml
	$(call compile,$@,ocamlopt -O3 $^ -o $@)
endif

FORCE:
