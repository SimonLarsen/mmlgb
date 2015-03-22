#include <gb/gb.h>
#include <string.h>
#include "music.h"
#include "binconst.h"
#include "notes.h"
#include "freq.h"
#include "noisefreq.h"

UBYTE *song;
UBYTE mus_octave1, mus_octave2, mus_octave3, mus_octave4;
UBYTE mus_length1, mus_length2, mus_length3, mus_length4;
UBYTE mus_volume1, mus_volume2, mus_volume3, mus_volume4;
UBYTE mus_env1, mus_env2, mus_env4;
UBYTE mus_wait1, mus_wait2, mus_wait3, mus_wait4;
UBYTE *mus_data1, *mus_data2, *mus_data3, *mus_data4;

void mus_init(UBYTE *song_data) {
	NR52_REG = 0x80U; // Enable sound
	NR51_REG = 0xFFU;

	// Channel 3
	NR30_REG = 0xFFU;

	// Setup timer
	TAC_REG = 0x04U; // TAC clock = 4096 Hz
	TMA_REG = 255U - 51U; // Default to ~150 bpm

	// Setup data
	song = song_data;
	
	mus_data1 = song + ((UWORD*)song)[CHN1_OFFSET];
	mus_data2 = song + ((UWORD*)song)[CHN2_OFFSET];
	mus_data3 = song + ((UWORD*)song)[CHN3_OFFSET];
	mus_data4 = song + ((UWORD*)song)[CHN4_OFFSET];

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
			case T_WAVEDUTY:
				note = *mus_data1++;
				NR11_REG = (note << 5);
				break;
			case T_PAN:
				note = *mus_data1++;
				NR51_REG = (NR51_REG & B8(11101110)) | note;
				break;
			case T_EOF:
				mus_data1 = song + ((UWORD*)song)[CHN1_OFFSET];
				return;
			default:
				if(note & MUS_HAS_LENGTH) {
					note ^= MUS_HAS_LENGTH;
					mus_wait1 = *mus_data1++;
				}
				else {
					mus_wait1 = mus_length1;
				}
				if(note == T_REST) {
					frequency = 0U;
					NR12_REG = 0U;
				} else {
					frequency = freq[((mus_octave1-MUS_FIRST_OCTAVE) << 4) + note];
					NR12_REG = (mus_volume1 << 4) | mus_env1;
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
		if(mus_wait2) return;
	}

	while(1U) {
		note = *mus_data2++;
		switch(note) {
			case T_LENGTH:
				mus_length2 = *mus_data2++;
				break;
			case T_OCTAVE:
				mus_octave2 = *mus_data2++;
				break;
			case T_OCT_UP:
				mus_octave2++;
				break;
			case T_OCT_DOWN:
				mus_octave2--;
				break;
			case T_VOL:
				mus_volume2 = *mus_data2++;
				NR22_REG = (mus_volume2 << 4) | mus_env2;
				break;
			case T_ENV:
				mus_env2 = *mus_data2++;
				NR22_REG = (mus_volume2 << 4) | mus_env2;
				break;
			case T_WAVE:
				mus_data2++;
				break;
			case T_TEMPO:
				TMA_REG = *mus_data2++;
				break;
			case T_WAVEDUTY:
				note = *mus_data2++;
				NR21_REG = note << 5;
				break;
			case T_PAN:
				note = *mus_data2++;
				NR51_REG = (NR51_REG & B8(11011101)) | (note << 1);
				break;
			case T_EOF:
				mus_data2 = song + ((UWORD*)song)[CHN2_OFFSET];
				return;
			default:
				if(note & MUS_HAS_LENGTH) {
					note ^= MUS_HAS_LENGTH;
					mus_wait2 = *mus_data2++;
				}
				else {
					mus_wait2 = mus_length2;
				}
				if(note == T_REST) {
					frequency = 0U;
					NR22_REG = 0U;
				} else {
					frequency = freq[((mus_octave2-MUS_FIRST_OCTAVE) << 4) + note];
					NR22_REG = (mus_volume2 << 4) | mus_env2;
				}
				NR23_REG = (UBYTE)frequency;
				NR24_REG = 0x80U | (frequency >> 8);
				return;
		}
	}
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
			case T_WAVEDUTY:
				mus_data3++;
				break;
			case T_PAN:
				note = *mus_data3++;
				NR51_REG = (NR51_REG & B8(10111011)) | (note << 2);
				break;
			case T_EOF:
				mus_data3 = song + ((UWORD*)song)[CHN3_OFFSET];
				return;
			default:
				if(note & MUS_HAS_LENGTH) {
					note ^= MUS_HAS_LENGTH;
					mus_wait3 = *mus_data3++;
				} else {
					mus_wait3 = mus_length3;
				}
				if(note == T_REST) {
					frequency = 0U;
					NR32_REG = 0U;
				} else {
					frequency = freq[((mus_octave3-MUS_FIRST_OCTAVE) << 4) + note];
					NR32_REG = mus_volume3 << 5;
				}
				NR33_REG = (UBYTE)frequency;
				NR34_REG = 0x80U | (frequency >> 8);
				return;
		}
	}
}

void mus_update4() {
	UBYTE note, frequency;

	if(mus_wait4) {
		mus_wait4--;
		if(mus_wait4) return;
	}

	while(1U) {
		note = *mus_data4++;
		switch(note) {
			case T_LENGTH:
				mus_length4 = *mus_data4++;
				break;
			case T_OCTAVE:
				mus_octave4 = *mus_data4++;
				break;
			case T_OCT_UP:
				mus_octave4++;
				break;
			case T_OCT_DOWN:
				mus_octave4--;
				break;
			case T_VOL:
				mus_volume4 = *mus_data4++;
				NR42_REG = (mus_volume4 << 4) | mus_env4;
				break;
			case T_ENV:
				mus_env4 = *mus_data4++;
				NR42_REG = (mus_volume4 << 4) | mus_env4;
				break;
			case T_TEMPO:
				TMA_REG = *mus_data4++;
				break;
			case T_PAN:
				note = *mus_data4++;
				NR51_REG = (NR51_REG & B8(01110111)) | (note << 3);
				break;
			case T_EOF:
				mus_data4 = song + ((UWORD*)song)[CHN4_OFFSET];
				return;
			default:
				if(note & MUS_HAS_LENGTH) {
					note ^= MUS_HAS_LENGTH;
					mus_wait4 = *mus_data4++;
				} else {
					mus_wait4 = mus_length4;
				}
				if(note == T_REST) {
					frequency = 0U;
					NR42_REG = 0U;
				} else {
					frequency = noise_freq[((mus_octave4-MUS_NOISE_FIRST_OCTAVE) << 4) + note];
					NR42_REG = (mus_volume4 << 4) | mus_env4;
				}
				NR43_REG = frequency;
				NR44_REG = 0x80U;
				return;
		}
	}
}
