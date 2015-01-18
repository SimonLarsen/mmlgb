#include <gb/gb.h>
#include <string.h>
#include "music.h"
#include "binconst.h"
#include "notes.h"
#include "freq.h"

#include <gb/console.h>

const UBYTE length_frames[] = {
	0U,
 	128, 64U, 48U, 32U, 28U, 24U, 20U, 16U,
	 0U, 14U,  0U, 12U,  0U, 10U,  0U,  8U,
	 0U,  0U,  0U,  0U,  0U,  0U,  0U,  6U,
	 0U,  0U,  0U,  0U,  0U,  0U,  0U,  4U
};

const UBYTE song[] = {
20U,
21U,
22U,
35U,
120U,
154U,
188U,
222U,
255U,
237U,
203U,
169U,
135U,
101U,
67U,
33U,
1U,
35U,
69U,
103U,
21U,
21U,
19U,
0U,
14U,
4U,
0U,
2U,
4U,
5U,
7U,
5U,
4U,
2U,
21U,
21U,
};

UBYTE mus_octave1, mus_octave2, mus_octave3, mus_octave4;
UBYTE mus_length1, mus_length2, mus_length3, mus_length4;
UBYTE mus_volume1, mus_volume2, mus_volume3, mus_volume4;
UBYTE mus_env1, mus_env2, mus_env4;
UBYTE mus_wait1, mus_wait2, mus_wait3, mus_wait4;
UBYTE *mus_data1, *mus_data2, *mus_data3, *mus_data4;

void mus_init() {
	NR52_REG = 0x80U; // Enable sound
	NR51_REG = 0xFFU;

	// Channel 1
	NR11_REG = B8(11000000);
	NR12_REG = B8(11110010);
	// Channel 2
	NR21_REG = B8(10000000);
	NR22_REG = B8(11110100);
	// Channel 3
	NR30_REG = 0xFFU;
	// Channel 4

	// Setup timer
	TAC_REG = 0x04U; // TAC clock = 4096 Hz
	TMA_REG = 255U - 51U; // Default to ~150 bpm

	// Setup data
	mus_data1 = song + song[CHN1_OFFSET];
	mus_data2 = song + song[CHN2_OFFSET];
	mus_data3 = song + song[CHN3_OFFSET];
	mus_data4 = song + song[CHN4_OFFSET];

	mus_wait1 = mus_wait2 = mus_wait3 = mus_wait4 = 0U;
	mus_octave1 = mus_octave2 = mus_octave3 = mus_octave4 = 4U;
	mus_length1 = mus_length2 = mus_length3 = mus_length4 = 4U;
	mus_volume1 = mus_volume2 = mus_volume3 = mus_volume4 = 15U;
	mus_env1 = mus_env2 = mus_env4 = 3U;
}

void mus_update() {
	mus_update1();
	mus_update2();
	mus_update3();
	mus_update4();
}

void mus_update1() {
	UBYTE note;
	UWORD frequency;

	if(mus_wait1) {
		mus_wait1--;
		if(mus_wait1) return;
	}

	while(1U) {
		note = *mus_data1++;
		switch(note) {
			case T_LENGTH:
				mus_length1 = *mus_data1++;
				break;
			case T_OCTAVE:
				mus_octave1 = *mus_data1++;
				break;
			case T_OCT_UP:
				mus_octave1++;
				break;
			case T_OCT_DOWN:
				mus_octave1--;
				break;
			case T_VOL:
				mus_volume1 = *mus_data1++;
				NR12_REG = (mus_volume1 << 4) | mus_env1;
				break;
			case T_ENV:
				mus_env1 = *mus_data1++;
				NR12_REG = (mus_volume1 << 4) | mus_env1;
				break;
			case T_WAVE:
				mus_data1++;
				break;
			case T_TEMPO:
				TMA_REG = *mus_data1++;
				break;
			case T_EOF:
				mus_data1 = song + song[CHN1_OFFSET];
				return;
			default:
				if(note & MUS_HAS_LENGTH) {
					note ^= MUS_HAS_LENGTH;
					mus_wait1 = length_frames[*mus_data1++];
				}
				else {
					mus_wait1 = length_frames[mus_length1];
				}
				if(note == T_REST) {
					frequency = 0U;
					NR12_REG = 0U;
				} else {
					frequency = freq[((mus_octave1-FIRST_OCTAVE) << 4) + note];
					NR12_REG = (mus_volume1 << 4) | mus_env1;
				}
				NR13_REG = (UBYTE)frequency;
				NR14_REG = 0x80U | (frequency >> 8);
				return;
		}
	}
}

void mus_update2() {

}

void mus_update3() {
	UBYTE note;
	UWORD frequency;

	if(mus_wait3) {
		mus_wait3--;
		if(mus_wait3) return;
	}

	while(1U) {
		note = *mus_data3++;
		switch(note) {
			case T_LENGTH:
				mus_length3 = *mus_data3++;
				break;
			case T_OCTAVE:
				mus_octave3 = *mus_data3++;
				break;
			case T_OCT_UP:
				mus_octave3++;
				break;
			case T_OCT_DOWN:
				mus_octave3--;
				break;
			case T_VOL:
				mus_volume3 = *mus_data3++;
				NR32_REG = mus_volume3 << 5;
				break;
			case T_ENV:
				mus_data3++;
				break;
			case T_WAVE:
				note = *mus_data3++;
				NR30_REG = 0x0U;
				memcpy(0xFF30, song + WAVE_OFFSET + (note << 4), 16U);
				NR30_REG = 0xFFU;
				break;
			case T_TEMPO:
				TMA_REG = *mus_data3++;
				break;
			case T_EOF:
				mus_data3 = song + song[CHN3_OFFSET];
				return;
			default:
				if(note & MUS_HAS_LENGTH) {
					note ^= MUS_HAS_LENGTH;
					mus_wait3 = length_frames[*mus_data3++];
				}
				else {
					mus_wait3 = length_frames[mus_length3];
				}
				if(note == T_REST) {
					frequency = 0U;
					NR32_REG = 0U;
				} else {
					frequency = freq[((mus_octave3-FIRST_OCTAVE) << 4) + note];
					NR32_REG = mus_volume3 << 5;
				}
				NR33_REG = (UBYTE)frequency;
				NR34_REG = 0x80U | (frequency >> 8);
				return;
		}
	}
}

void mus_update4() {

}
