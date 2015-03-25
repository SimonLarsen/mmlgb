#include <gb/gb.h>
#include "music.h"

extern UBYTE song_asm_data;

void main() {
	disable_interrupts();

	mus_init(&song_asm_data);

	add_TIM(mus_update);
	enable_interrupts();
	set_interrupts(TIM_IFLAG | VBL_IFLAG);

	while(1U) {
		wait_vbl_done();
	}
}
