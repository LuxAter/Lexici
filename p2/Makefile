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

define CleanDir
if [[ -e "$(1)" ]]; then \
    printf "%b" "\033[0;97mRemoving $(1)...";\
    rm $(1) -rf;\
    printf "%b\n" "\033[0;32m\xE2\x9C\x94\033[0m";\
fi
endef

all: c.a cpp.a ada.a csharp.exe p2.class go rust swift.a
	printf "%b\n" "\033[0;32mCompiled all projects\033[0m"

clean:
	$(call Clean,c.a)
	$(call Clean,cpp.a)
	$(call Clean,p2.class)
	$(call Clean,csharp.exe)
	$(call Clean,ada.a)
	$(call Clean,p2.o)
	$(call Clean,p2.ali)
	$(call Clean,go)
	$(call Clean,rust)
	$(call Clean,swift.a)
	$(call CleanDir,swift/.build)
	printf "%b\n" "\033[0;33mRemoved all projects\033[0m"

c.a: p2.c
	$(call Compile,$@,clang $^ -lm -O3 -o $@)

cpp.a: p2.cpp
	$(call Compile,$@,clang++ $^ -lm -O3 -o $@)

p2.class: p2.java
	$(call Compile,$@,javac $^)

csharp.exe: p2.cs
	$(call Compile,$@,mcs $^ -out:$@)

ada.a: p2.adb
	$(call Compile,$@,gnatmake -o $@ $^)
go: go.go
	$(call Compile,$@,go build $^)

rust: p2.rs
	$(call Compile,$@,rustc $^ -o $@)

swift.a: swift/Sources/swift/main.swift
	$(call Compile,$@,swift build --package-path swift)
	$(call Compile,$@,cp swift/.build/x86_64-unknown-linux/debug/swift $@)
