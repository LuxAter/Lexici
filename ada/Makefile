SHELL = /bin/bash

ifndef .VERBOSE
  .SILENT:
endif

EXE_FILES = $(shell find -name "*.adb" -print0 | sort -z | xargs -0)
EXE = $(EXE_FILES:%.adb=%.a)

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
    printf "%b" "\033[0;33m[ ] Removing $(1)...";\
    rm $(1);\
    printf "%b\n" "\033[1K\033[G\033[0;32m[\xE2\x9C\x94] Removing $(1)\033[0m";\
fi
endef
define run
printf "\033[0;33m[%2d/%2d] Running $(1)..." 0 $(RUN_COUNT)
total=0;\
for i in {1..$(RUN_COUNT)}; do\
  printf "\033[1K\033[G\033[0;33m[%2d/%2d] Running $(1)..." $$i $(RUN_COUNT);\
  st=$$(date +%s%N) ;\
  ./$(1) > /dev/null;\
  et=$$(date +%s%N);\
  total=$$(($$total + ($$et-$$st)));\
done;\
total=$$(echo "scale=10;$$total/$(RUN_COUNT)/1000000000" | bc);\
echo "$(2) $$total $$(stat --printf=%s $(2))" >> .res ;\
printf "\033[1K\033[G\033[0;$(RUN)m[%2d/%2d] Running %5s %s\n" $(RUN_COUNT) $(RUN_COUNT) "$(1)" "$$total"
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

run: pre-run $(EXE)
	printf "%b\n" "\033[0;$(RUN);1mRan all projects\033[0m"

ifeq ($(CMD),clean)
%.a: FORCE
	$(call clean,$@)
else ifeq ($(CMD),list)
%.a: FORCE
	printf "\033[$(LIST)m[%-10s]  %-5s\033[0m\n" "Ada" "$@"
else ifeq ($(CMD),run)
%.a: %.adb FORCE
	$(call run,$@,$<)
else
%.a: %.adb
	$(call compile,$@,gnatmake $^ -O3 -o $@)
endif

pre-run: FORCE
	if [[ -f ".res" ]]; then rm .res; fi

FORCE:
