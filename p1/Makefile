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

all: c.a cpp.a ada.a csharp.exe p1.class go rust
	printf "%b\n" "\033[0;32mCompiled all projects\033[0m"

clean:
	$(call Clean,c.a)
	$(call Clean,cpp.a)
	$(call Clean,p1.class)
	$(call Clean,csharp.exe)
	$(call Clean,ada.a)
	$(call Clean,p1.o)
	$(call Clean,p1.ali)
	$(call Clean,go)
	printf "%b\n" "\033[0;33mRemoved all projects\033[0m"

c.a: p1.c
	$(call Compile,$@,clang $^ -lm -O3 -o $@)

cpp.a: p1.cpp
	$(call Compile,$@,clang++ $^ -lm -O3 -o $@)

p1.class: p1.java
	$(call Compile,$@,javac $^)

csharp.exe: p1.cs
	$(call Compile,$@,mcs $^ -out:$@)

ada.a: p1.adb
	$(call Compile,$@,gnatmake -o $@ $^)
go: go.go
	$(call Compile,$@,go build $^)

rust: p1.rs
	$(call Compile,$@,rustc $^ -o $@)
