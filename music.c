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

const UBYTE song[4][] = {
	{
		T_OCTAVE, 4U,
		T_LENGTH, 4U,
		T_C,
		T_C,
		T_C,
		T_D,
		T_E,
		T_E,
		T_LENGTH, 2U,
		T_E,
		T_LENGTH, 4U,
		T_D,
		T_D,
		T_D,
		T_E,
		T_LENGTH, 2U,
		T_C,
		T_C,
		T_EOF
	},
	{
		T_OCTAVE, 3U,
		T_LENGTH, 2U,
		T_C,
		T_C,
		T_C,
		T_C,
		T_G,
		T_G,
		T_G,
		T_G,
		T_EOF
	},
	{ T_EOF },
	{ T_EOF }
};

UBYTE mus_octave[4], mus_length[4], mus_wait[4];
UBYTE *mus_song[4], *mus_data[4];

void mus_init() {
	UBYTE i;

	NR52_REG = 0x80U; // Enable sound
	NR51_REG = 0xFFU;

	NR11_REG = B8(11000000);
	NR12_REG = B8(11110010);

	NR21_REG = B8(10000000);
	NR22_REG = B8(11110100);

	for(i = 0U; i != 4U; ++i) {
		mus_wait[i] = 0U;
		mus_octave[i] = 4U;
		mus_length[i] = 4U;

		mus_data[i] = mus_song[i] = &song[i][0];
	}
}

void mus_update() {
	UBYTE i, note, run;
	UWORD frequency;

	for(i = 0U; i != 1U; ++i) {
		if(mus_wait[i]) {
			mus_wait[i]--;
			if(mus_wait[i]) {
				continue;
			}
		}

		run = 1U;
		while(run) {
			note = *mus_data[i];
			mus_data[i]++;

			switch(note) {
				case T_REST:
					NR13_REG = 0U;
					NR14_REG = 0x80U;
					mus_wait[i] = length_frames[mus_length[i]];
					run = 0U;
					break;
				case T_LENGTH:
					mus_length[i] = *mus_data[i];
					mus_data[i]++;
					break;
				case T_OCTAVE:
					mus_octave[i] = *mus_data[i];
					mus_data[i]++;
					break;
				case T_OCT_UP:
					mus_octave[i]++;
					break;
				case T_OCT_DOWN:
					mus_octave[i]++;
					break;
				case T_VOL:
					break;
				case T_EOF:
					mus_data[i] = mus_song[i];
					break;
				default:
					frequency = freq[((mus_octave[i]-FIRST_OCTAVE) << 4) + note];
					NR13_REG = (UBYTE)frequency;
					NR14_REG = 0x80U | (frequency >> 8);
					mus_wait[i] = length_frames[mus_length[i]];
					run = 0U;
					break;
			}
		}
	}
}
