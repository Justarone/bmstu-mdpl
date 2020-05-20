app.exe: strcopy.asm main.cpp
	nasm -f elf64 strcopy.asm
	g++ -c main.cpp
	g++ -o $@ main.o strcopy.o
clean:
	rm -f app.exe *.o
