#include <gb/gb.h>
#include "music.h"
#include "binconst.h"
#include "notes.h"
#include "freq.h"

#include <gb/console.h>

const UBYTE length_frames[] = {
	0U,
	64U, 32U, 24U, 16U, 14U, 12U, 10U, 8U,
	 0U,  7U,  0U,  6U,  0U,  5U,  0U, 4U,
	 0U,  0U,  0U,  0U,  0U,  0U,  0U, 3U,
	 0U,  0U,  0U,  0U,  0U,  0U,  0U, 2U
};

const UBYTE song[] = {
0U,
0U,
6U,
13U,
14U,
15U,
0U,
2U,
12U,
4U,
12U,
5U,
18U,
18U,
18U,
18U,

};

UBYTE mus_octave1, mus_octave2, mus_octave3, mus_octave4;
UBYTE mus_length1, mus_length2, mus_length3, mus_length4;
UBYTE mus_wait1, mus_wait2, mus_wait3, mus_wait4;
UBYTE *mus_song1, *mus_song2, *mus_song3, *mus_song4;
UBYTE *mus_data1, *mus_data2, *mus_data3, *mus_data4;

void mus_init() {
	NR52_REG = 0x80U; // Enable sound
	NR51_REG = 0xFFU;

	NR11_REG = B8(11000000);
	NR12_REG = B8(11110010);

	NR21_REG = B8(10000000);
	NR22_REG = B8(11110100);

	// Setup data
	mus_data1 = mus_song1 = song + song[CHN1_OFFSET];
	mus_data2 = mus_song2 = song + song[CHN2_OFFSET];
	mus_data3 = mus_song3 = song + song[CHN3_OFFSET];
	mus_data4 = mus_song4 = song + song[CHN4_OFFSET];
	mus_wait1 = mus_wait2 = mus_wait3 = mus_wait4 = 0U;
	mus_octave1 = mus_octave2 = mus_octave3 = mus_octave4 = 4U;
	mus_length1 = mus_length2 = mus_length3 = mus_length4 = 4U;
}

void mus_update() {
	mus_update1();
	mus_update2();
}

void mus_update1() {
	UBYTE note;
	UWORD frequency;

	if(mus_wait1) {
		mus_wait1--;
		if(mus_wait1) {
			return;
		}
	}

	while(1U) {
		note = *mus_data1;
		mus_data1++;

		switch(note) {
			case T_LENGTH:
				mus_length1 = *mus_data1;
				mus_data1++;
				break;
			case T_OCTAVE:
				mus_octave1 = *mus_data1;
				mus_data1++;
				break;
			case T_OCT_UP:
				mus_octave1++;
				break;
			case T_OCT_DOWN:
				mus_octave1--;
				break;
			case T_VOL:
				break;
			case T_EOF:
				mus_data1 = song + song[CHN1_OFFSET];
				return;
			default:
				if(note & MUS_HAS_LENGTH) {
					note ^= MUS_HAS_LENGTH;
					mus_wait1 = length_frames[*mus_data1];
					mus_data1++;
				}
				else {
					mus_wait1 = length_frames[mus_length1];
				}
				if(note == T_REST) {
					frequency = 0U;
				} else {
					frequency = freq[((mus_octave1-FIRST_OCTAVE) << 4) + note];
				}
				NR13_REG = (UBYTE)frequency;
				NR14_REG = 0x80U | (frequency >> 8);
				return;
		}
	}
}

void mus_update2() {
	UBYTE note;
	UWORD frequency;

	if(mus_wait2) {
		mus_wait2--;
		if(mus_wait2) {
			return;
		}
	}

	while(1U) {
		note = *mus_data2;
		mus_data2++;

		switch(note) {
			case T_LENGTH:
				mus_length2 = *mus_data2;
				mus_data2++;
				break;
			case T_OCTAVE:
				mus_octave2 = *mus_data2;
				mus_data2++;
				break;
			case T_OCT_UP:
				mus_octave2++;
				break;
			case T_OCT_DOWN:
				mus_octave2--;
				break;
			case T_VOL:
				break;
			case T_EOF:
				mus_data2 = song + song[CHN2_OFFSET];
				return;
			default:
				if(note & MUS_HAS_LENGTH) {
					note ^= MUS_HAS_LENGTH;
					mus_wait2 = length_frames[*mus_data2];
					mus_data2++;
				}
				else {
					mus_wait2 = length_frames[mus_length2];
				}
				if(note == T_REST) {
					frequency = 0U;
				} else {
					frequency = freq[((mus_octave2-FIRST_OCTAVE) << 4) + note];
				}
				NR23_REG = (UBYTE)frequency;
				NR24_REG = 0x80U | (frequency >> 8);
				return;
		}
	}
}
