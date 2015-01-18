#ifndef MUSIC_H
#define MUSIC_H

#define FIRST_OCTAVE 2U

#define CHN1_OFFSET	0
#define CHN2_OFFSET	1
#define CHN3_OFFSET	2
#define CHN4_OFFSET	3

void mus_init();
void mus_update();
void mus_update1();
void mus_update2();
void mus_update3();
void mus_update4();

#define MUS_HAS_LENGTH 0x80U

#endif
