#/bin/sh

java -jar parser/MMLGB.jar "$1" driver/song.asm

lcc -c driver/player.asm -o driver/player.o
lcc -c driver/music.asm -o driver/music.o
lcc -c driver/song.asm -o driver/song.o
lcc -c driver/freq.asm -o driver/freq.o
lcc -c driver/noisefreq.asm -o driver/noisefreq.o
lcc -c driver/vib.asm -o driver/vib.o
lcc -Wl-j driver/player.o driver/music.o driver/song.o driver/freq.o driver/noisefreq.o driver/vib.o -o rom.gb
