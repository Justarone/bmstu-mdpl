app.exe: src/strcopy.asm src/main.cpp
	mkdir -p bin
	nasm -f elf64 src/strcopy.asm -o bin/strcopy.o
	g++ -c src/main.cpp -o bin/main.o
	g++ -o $@ bin/main.o bin/strcopy.o
clean:
	rm -f app.exe 
	rm -rf bin
