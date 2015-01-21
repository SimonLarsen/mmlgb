#include <gb/gb.h>
#include "music.h"

#include "song.h"

void main() {
	disable_interrupts();

	mus_init(song_h_data);

	add_TIM(mus_update);
	enable_interrupts();
	set_interrupts(TIM_IFLAG | VBL_IFLAG);

	while(1U) {
		wait_vbl_done();
	}
}
