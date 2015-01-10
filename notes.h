#ifndef NOTES_H
#define NOTES_H

#define FIRST_OCTAVE 2U

#define CHN1_OFFSET	2
#define CHN2_OFFSET	3
#define CHN3_OFFSET	4
#define CHN4_OFFSET	5

enum E_CMD {
	T_C,
	T_Cs,
	T_D,
	T_Ds,
	T_E,
	T_F,
	T_Fs,
	T_G,
	T_Gs,
	T_A2,
	T_As,
	T_B,
	T_REST,
	T_LENGTH,
	T_OCTAVE,
	T_OCT_UP,
	T_OCT_DOWN,
	T_VOL,
	T_EOF
};

#endif
