CC = g++
INCLUDE_DIR = include/
BINARIES = $(patsubst src/%.cpp,bin/%.o, $(wildcard src/*.cpp))
GTK_FLAGS = `pkg-config gtkmm-3.0 --libs --cflags`
COMPILE_FLAGS = -Wall -g -Werror

.PHONY: all test clean
all: app.exe

run: 
	./app.exe meta/example.png

app.exe: $(BINARIES)
	$(CC) $^ -o $@ -I $(INCLUDE_DIR) $(GTK_FLAGS) 

bin/%.o: src/%.cpp
	mkdir -p bin
	$(CC) -c -o $@ $(GTK_FLAGS) $(COMPILE_FLAGS) $^

clean:
	rm -rf bin/ app.exe tmp/output.png
