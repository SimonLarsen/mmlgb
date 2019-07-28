#CC=lcc
CC=/home/simon/share/sdcc-3.8.0/bin/sdcc -mgbz80 --no-std-crt0 -I /home/simon/gbdk-n/include -I /home/simon/gbdk-n/include/asm

default: ASMFILES

ASMFILES: freq.asm music.asm noisefreq.asm player.asm vib.asm

%.asm: %.c
	$(CC) -S $<; python fixcode.py $@ $@
