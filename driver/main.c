#include <gb/gb.h>
#include "music.h"

void main() {
	disable_interrupts();

	mus_init();

	add_TIM(mus_update);

	enable_interrupts();

	TMA_REG = 0x00U;
	TAC_REG = 0x07U;

	set_interrupts(TIM_IFLAG | VBL_IFLAG);

	while(1U) {
		wait_vbl_done();
	}
}
