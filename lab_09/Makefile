BINARIES  := $(patsubst src/%.c,bin/%.o,$(wildcard src/*.c))
OUT_FILES := $(patsubst src/%.c,out/%.out,$(wildcard src/*.c))
ASM_FILES := $(patsubst src/%.c,disassembler/%.asm,$(wildcard src/*.c))

all: $(OUT_FILES) $(ASM_FILES)

apps: $(OUT_FILES)

asm: $(ASM_FILES)

disassembler/%.asm: out/%.out
	mkdir -p disassembler
	objdump -d -Mintel $< >$@

out/%.out: src/%.c
	mkdir -p out
	gcc -o $@ $^

clean:
	rm -rf disassembler/ out/
