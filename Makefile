SHELL = /bin/bash

ifndef .VERBOSE
  .SILENT:
endif

define Compile
printf "%b" "\033[0;97mCompiling $(1)..."
$(2) > $@.log;\
  RESULT=$$?;\
  if [ $$RESULT -ne 0 ]; then \
    printf "%b\n" "\033[0;31m\xE2\x9D\x8C\033[0m";\
  else \
    printf "%b\n" "\033[0;32m\xE2\x9C\x94\033[0m";\
  fi;\
  cat $@.log;\
  rm -f $@.log
endef


define Clean
if [[ -e "$(1)" ]]; then \
    printf "%b" "\033[0;97mRemoving $(1)...";\
    rm $(1);\
    printf "%b\n" "\033[0;32m\xE2\x9C\x94\033[0m";\
fi
endef

all: c.a cpp.a src/java.class csharp.exe ada.a
	printf "%b\n" "\033[0;32mCompiled all projects\033[0m"

clean:
	$(call Clean,c.a)
	$(call Clean,cpp.a)
	$(call Clean,src/java.class)
	$(call Clean,csharp.exe)
	$(call Clean,ada.a)
	$(call Clean,prime.o)
	$(call Clean,prime.ali)
	printf "%b\n" "\033[0;33mRemoved all projects\033[0m"

c.a: src/c.c
	$(call Compile,$@,clang $^ -lm -O3 -o $@)

cpp.a: src/cpp.cpp
	$(call Compile,$@,clang++ $^ -lm -O3 -o $@)

src/java.class: src/java.java
	$(call Compile,$@,javac $^)

csharp.exe: src/csharp.cs
	$(call Compile,$@,mcs $^ -out:$@)

ada.a: src/prime.adb
	$(call Compile,$@,gnatmake -o $@ $^)
