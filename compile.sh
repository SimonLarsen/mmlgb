#/bin/sh

java -jar parser/MMLGB.jar "$1" driver/song.asm

lcc -c driver/main.asm -o driver/main.o
lcc -c driver/music.asm -o driver/music.o
lcc -c driver/song.asm -o driver/song.o
lcc driver/main.o driver/music.o driver/song.o -o rom.gb
