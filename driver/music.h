#ifndef MUSIC_H
#define MUSIC_H

#define FIRST_OCTAVE 2U
#define WAVE_OFFSET 4U

#define CHN1_OFFSET	0U
#define CHN2_OFFSET	1U
#define CHN3_OFFSET	2U
#define CHN4_OFFSET	3U

void mus_init();
void mus_update();
void mus_update1();
void mus_update2();
void mus_update3();
void mus_update4();

#define MUS_HAS_LENGTH 0x80U

#endif
