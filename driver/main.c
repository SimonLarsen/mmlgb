#include <gb/gb.h>
#include "music.h"
#include "background.h"

extern UBYTE song_data;
UBYTE joystate, oldjoystate;

#define CLICKED(x) ((joystate & x) && (joystate & x) != (oldjoystate & x))
#define RELEASED(x) (!(joystate & x) && (joystate & x) != (oldjoystate & x))
#define ISDOWN(x) (joystate & (x))

void main() {
	disable_interrupts();

	DISPLAY_OFF;

	// Install music interrupt
	mus_init(&song_data);
	add_TIM(mus_update);

	// Load background
	set_bkg_data(0U, background_data_length, background_data);
	set_bkg_tiles(0U, 0U, background_tiles_width, background_tiles_height, background_tiles);

	SHOW_BKG;
	HIDE_SPRITES;
	HIDE_WIN;
	DISPLAY_ON;

	enable_interrupts();
	set_interrupts(TIM_IFLAG | VBL_IFLAG);

	joystate = oldjoystate = 0U;

	while(1U) {
		oldjoystate = joystate;
		joystate = joypad();

		if(CLICKED(J_START)) {
			mus_togglePaused();
		}

		wait_vbl_done();
	}
}
