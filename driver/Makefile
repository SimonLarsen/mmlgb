.PHONY: compile
compile:
	lcc -c main.c -o main.o
	lcc -c music.c -o music.o
	lcc main.o music.o -o music.gb

.PHONY: clean
clean:
	rm *.o

.PHONY: run
run:
	gambatte -s 3 music.gb
