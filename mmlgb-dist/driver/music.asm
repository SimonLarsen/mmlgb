;--------------------------------------------------------
; File Created by SDCC : FreeWare ANSI-C Compiler
; Version 2.3.1 Thu Mar 26 19:26:55 2015

;--------------------------------------------------------
	.module lcc80990
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mus_repeats4
	.globl _mus_repeats3
	.globl _mus_repeats2
	.globl _mus_repeats1
	.globl _mus_wait4
	.globl _mus_wait3
	.globl _mus_wait2
	.globl _mus_wait1
	.globl _mus_env4
	.globl _mus_env2
	.globl _mus_env1
	.globl _mus_volume4
	.globl _mus_volume3
	.globl _mus_volume2
	.globl _mus_volume1
	.globl _mus_length4
	.globl _mus_length3
	.globl _mus_length2
	.globl _mus_length1
	.globl _mus_octave4
	.globl _mus_octave3
	.globl _mus_octave2
	.globl _mus_octave1
	.globl _mus_rep4
	.globl _mus_rep3
	.globl _mus_rep2
	.globl _mus_rep1
	.globl _mus_loop4
	.globl _mus_loop3
	.globl _mus_loop2
	.globl _mus_loop1
	.globl _mus_data4
	.globl _mus_data3
	.globl _mus_data2
	.globl _mus_data1
	.globl _mus_song
	.globl _noise_freq
	.globl _freq
	.globl _mus_init
	.globl _mus_update
	.globl _mus_update1
	.globl _mus_update2
	.globl _mus_update3
	.globl _mus_update4
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; special function bits 
;--------------------------------------------------------
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area _DATA
_mus_song::
	.ds 2
_mus_data1::
	.ds 2
_mus_data2::
	.ds 2
_mus_data3::
	.ds 2
_mus_data4::
	.ds 2
_mus_loop1::
	.ds 2
_mus_loop2::
	.ds 2
_mus_loop3::
	.ds 2
_mus_loop4::
	.ds 2
_mus_rep1::
	.ds 2
_mus_rep2::
	.ds 2
_mus_rep3::
	.ds 2
_mus_rep4::
	.ds 2
_mus_octave1::
	.ds 1
_mus_octave2::
	.ds 1
_mus_octave3::
	.ds 1
_mus_octave4::
	.ds 1
_mus_length1::
	.ds 1
_mus_length2::
	.ds 1
_mus_length3::
	.ds 1
_mus_length4::
	.ds 1
_mus_volume1::
	.ds 1
_mus_volume2::
	.ds 1
_mus_volume3::
	.ds 1
_mus_volume4::
	.ds 1
_mus_env1::
	.ds 1
_mus_env2::
	.ds 1
_mus_env4::
	.ds 1
_mus_wait1::
	.ds 1
_mus_wait2::
	.ds 1
_mus_wait3::
	.ds 1
_mus_wait4::
	.ds 1
_mus_repeats1::
	.ds 1
_mus_repeats2::
	.ds 1
_mus_repeats3::
	.ds 1
_mus_repeats4::
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area _OVERLAY
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area _ISEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area _BSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area _XSEG
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;	music.c 20
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_init
; ---------------------------------
___mus_init_start:
_mus_init:
	
;	music.c 21
;	genAssign
	ld	bc,#0xFF26
;	genAssign (pointer)
	ld	a,#0x80
	ld	(bc),a
;	music.c 22
;	genAssign
	ld	bc,#0xFF25
;	genAssign (pointer)
	ld	a,#0xFF
	ld	(bc),a
;	music.c 23
;	genAssign
	ld	bc,#0xFF24
;	genAssign (pointer)
	ld	a,#0xFF
	ld	(bc),a
;	music.c 26
;	genAssign
	ld	bc,#0xFF1A
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	music.c 27
;	genAssign
	ld	bc,#0xFF1C
;	genAssign (pointer)
	ld	a,#0x40
	ld	(bc),a
;	music.c 30
;	genAssign
	ld	bc,#0xFF07
;	genAssign (pointer)
	ld	a,#0x04
	ld	(bc),a
;	music.c 31
;	genAssign
	ld	bc,#0xFF06
;	genAssign (pointer)
	ld	a,#0xCC
	ld	(bc),a
;	music.c 34
;	genAssign
;	AOP_STK for 
;	AOP_HL for _mus_song
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_song
	ld	(hl+),a
	ld	(hl),e
;	music.c 36
;	genAssign
;	AOP_HL for _mus_song
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPointerGet
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;	genPlus
;	AOP_HL for _mus_song
;	Can't optimise plus by inc, falling back to the normal way
	dec	hl
	ld	a,(hl)
	add	a,c
	ld	c,a
	inc	hl
	ld	a,(hl)
	adc	a,b
	ld	b,a
;	genAssign
;	AOP_HL for _mus_loop1
	ld	hl,#_mus_loop1
	ld	(hl),c
	inc	hl
	ld	(hl),b
;	genAssign
;	AOP_HL for _mus_data1
	ld	hl,#_mus_data1
	ld	(hl),c
	inc	hl
	ld	(hl),b
;	music.c 37
;	genAssign
;	AOP_HL for _mus_song
	ld	hl,#_mus_song
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	genPlusIncr
	inc	bc
	inc	bc
;	genPointerGet
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;	genPlus
;	AOP_HL for _mus_song
;	Can't optimise plus by inc, falling back to the normal way
	dec	hl
	ld	a,(hl)
	add	a,c
	ld	c,a
	inc	hl
	ld	a,(hl)
	adc	a,b
	ld	b,a
;	genAssign
;	AOP_HL for _mus_loop2
	ld	hl,#_mus_loop2
	ld	(hl),c
	inc	hl
	ld	(hl),b
;	genAssign
;	AOP_HL for _mus_data2
	ld	hl,#_mus_data2
	ld	(hl),c
	inc	hl
	ld	(hl),b
;	music.c 38
;	genAssign
;	AOP_HL for _mus_song
	ld	hl,#_mus_song
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	genPlusIncr
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;	genPointerGet
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;	genPlus
;	AOP_HL for _mus_song
;	Can't optimise plus by inc, falling back to the normal way
	dec	hl
	ld	a,(hl)
	add	a,c
	ld	c,a
	inc	hl
	ld	a,(hl)
	adc	a,b
	ld	b,a
;	genAssign
;	AOP_HL for _mus_loop3
	ld	hl,#_mus_loop3
	ld	(hl),c
	inc	hl
	ld	(hl),b
;	genAssign
;	AOP_HL for _mus_data3
	ld	hl,#_mus_data3
	ld	(hl),c
	inc	hl
	ld	(hl),b
;	music.c 39
;	genAssign
;	AOP_HL for _mus_song
	ld	hl,#_mus_song
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	genPlusIncr
;	Can't optimise plus by inc, falling back to the normal way
	ld	a,c
	add	a,#0x06
	ld	c,a
	ld	a,b
	adc	a,#0x00
	ld	b,a
;	genPointerGet
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;	genPlus
;	AOP_HL for _mus_song
;	Can't optimise plus by inc, falling back to the normal way
	dec	hl
	ld	a,(hl)
	add	a,c
	ld	c,a
	inc	hl
	ld	a,(hl)
	adc	a,b
	ld	b,a
;	genAssign
;	AOP_HL for _mus_loop4
	ld	hl,#_mus_loop4
	ld	(hl),c
	inc	hl
	ld	(hl),b
;	genAssign
;	AOP_HL for _mus_data4
	ld	hl,#_mus_data4
	ld	(hl),c
	inc	hl
	ld	(hl),b
;	music.c 41
;	genAssign
;	AOP_HL for _mus_wait4
	ld	hl,#_mus_wait4
	ld	(hl),#0x00
;	genAssign
;	AOP_HL for _mus_wait3
	ld	hl,#_mus_wait3
	ld	(hl),#0x00
;	genAssign
;	AOP_HL for _mus_wait2
	ld	hl,#_mus_wait2
	ld	(hl),#0x00
;	genAssign
;	AOP_HL for _mus_wait1
	ld	hl,#_mus_wait1
	ld	(hl),#0x00
;	music.c 42
;	genAssign
;	AOP_HL for _mus_octave4
	ld	hl,#_mus_octave4
	ld	(hl),#0x04
;	genAssign
;	AOP_HL for _mus_octave3
	ld	hl,#_mus_octave3
	ld	(hl),#0x04
;	genAssign
;	AOP_HL for _mus_octave2
	ld	hl,#_mus_octave2
	ld	(hl),#0x04
;	genAssign
;	AOP_HL for _mus_octave1
	ld	hl,#_mus_octave1
	ld	(hl),#0x04
;	music.c 43
;	genAssign
;	AOP_HL for _mus_length4
	ld	hl,#_mus_length4
	ld	(hl),#0x30
;	genAssign
;	AOP_HL for _mus_length3
	ld	hl,#_mus_length3
	ld	(hl),#0x30
;	genAssign
;	AOP_HL for _mus_length2
	ld	hl,#_mus_length2
	ld	(hl),#0x30
;	genAssign
;	AOP_HL for _mus_length1
	ld	hl,#_mus_length1
	ld	(hl),#0x30
;	music.c 44
;	genAssign
;	AOP_HL for _mus_volume4
	ld	hl,#_mus_volume4
	ld	(hl),#0x0F
;	genAssign
;	AOP_HL for _mus_volume3
	ld	hl,#_mus_volume3
	ld	(hl),#0x0F
;	genAssign
;	AOP_HL for _mus_volume2
	ld	hl,#_mus_volume2
	ld	(hl),#0x0F
;	genAssign
;	AOP_HL for _mus_volume1
	ld	hl,#_mus_volume1
	ld	(hl),#0x0F
;	music.c 45
;	genAssign
;	AOP_HL for _mus_env4
	ld	hl,#_mus_env4
	ld	(hl),#0x03
;	genAssign
;	AOP_HL for _mus_env2
	ld	hl,#_mus_env2
	ld	(hl),#0x03
;	genAssign
;	AOP_HL for _mus_env1
	ld	hl,#_mus_env1
	ld	(hl),#0x03
;	music.c 46
;	genAssign
;	AOP_HL for _mus_repeats4
	ld	hl,#_mus_repeats4
	ld	(hl),#0x00
;	genAssign
;	AOP_HL for _mus_repeats3
	ld	hl,#_mus_repeats3
	ld	(hl),#0x00
;	genAssign
;	AOP_HL for _mus_repeats2
	ld	hl,#_mus_repeats2
	ld	(hl),#0x00
;	genAssign
;	AOP_HL for _mus_repeats1
	ld	hl,#_mus_repeats1
	ld	(hl),#0x00
;	genLabel
00101$:
;	genEndFunction
	
	ret
___mus_init_end:
_freq:
	.dw #0x002C
	.dw #0x009D
	.dw #0x0107
	.dw #0x016B
	.dw #0x01CA
	.dw #0x0223
	.dw #0x0277
	.dw #0x02C7
	.dw #0x0312
	.dw #0x0358
	.dw #0x039B
	.dw #0x03DA
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0416
	.dw #0x044E
	.dw #0x0483
	.dw #0x04B5
	.dw #0x04E5
	.dw #0x0511
	.dw #0x053C
	.dw #0x0563
	.dw #0x0589
	.dw #0x05AC
	.dw #0x05CE
	.dw #0x05ED
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x060B
	.dw #0x0627
	.dw #0x0642
	.dw #0x065B
	.dw #0x0672
	.dw #0x0689
	.dw #0x069E
	.dw #0x06B2
	.dw #0x06C4
	.dw #0x06D6
	.dw #0x06E7
	.dw #0x06F7
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0706
	.dw #0x0714
	.dw #0x0721
	.dw #0x072D
	.dw #0x0739
	.dw #0x0744
	.dw #0x074F
	.dw #0x0759
	.dw #0x0762
	.dw #0x076B
	.dw #0x0773
	.dw #0x077B
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0783
	.dw #0x078A
	.dw #0x0790
	.dw #0x0797
	.dw #0x079D
	.dw #0x07A2
	.dw #0x07A7
	.dw #0x07AC
	.dw #0x07B1
	.dw #0x07B6
	.dw #0x07BA
	.dw #0x07BE
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x07C1
	.dw #0x07C5
	.dw #0x07C8
	.dw #0x07CB
	.dw #0x07CE
	.dw #0x07D1
	.dw #0x07D4
	.dw #0x07D6
	.dw #0x07D9
	.dw #0x07DB
	.dw #0x07DD
	.dw #0x07DF
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x07E1
	.dw #0x07E2
	.dw #0x07E4
	.dw #0x07E6
	.dw #0x07E7
	.dw #0x07E9
	.dw #0x07EA
	.dw #0x07EB
	.dw #0x07EC
	.dw #0x07ED
	.dw #0x07EE
	.dw #0x07EF
_noise_freq:
	.db #0xF7
	.db #0xE7
	.db #0xD7
	.db #0xC7
	.db #0xB7
	.db #0xA7
	.db #0x97
	.db #0x87
	.db #0x77
	.db #0x67
	.db #0x57
	.db #0x47
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0xF6
	.db #0xE6
	.db #0xD6
	.db #0xC6
	.db #0xB6
	.db #0xA6
	.db #0x96
	.db #0x86
	.db #0x76
	.db #0x66
	.db #0x56
	.db #0x46
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0xF5
	.db #0xE5
	.db #0xD5
	.db #0xC5
	.db #0xB5
	.db #0xA5
	.db #0x95
	.db #0x85
	.db #0x75
	.db #0x65
	.db #0x55
	.db #0x45
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0xF4
	.db #0xE4
	.db #0xD4
	.db #0xC4
	.db #0xB4
	.db #0xA4
	.db #0x94
	.db #0x84
	.db #0x74
	.db #0x64
	.db #0x54
	.db #0x44
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0xF3
	.db #0xE3
	.db #0xD3
	.db #0xC3
	.db #0xB3
	.db #0xA3
	.db #0x93
	.db #0x83
	.db #0x73
	.db #0x63
	.db #0x53
	.db #0x43
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0xF2
	.db #0xE2
	.db #0xD2
	.db #0xC2
	.db #0xB2
	.db #0xA2
	.db #0x92
	.db #0x82
	.db #0x72
	.db #0x62
	.db #0x52
	.db #0x42
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0xF1
	.db #0xE1
	.db #0xD1
	.db #0xC1
	.db #0xB1
	.db #0xA1
	.db #0x91
	.db #0x81
	.db #0x71
	.db #0x61
	.db #0x51
	.db #0x41
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0xF0
	.db #0xE0
	.db #0xD0
	.db #0xC0
	.db #0xB0
	.db #0xA0
	.db #0x90
	.db #0x80
	.db #0x70
	.db #0x60
	.db #0x50
	.db #0x40
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
;	music.c 49
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_update
; ---------------------------------
___mus_update_start:
_mus_update:
	
;	music.c 50
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_mus_update1
;	music.c 51
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_mus_update2
;	music.c 52
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_mus_update3
;	music.c 53
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_mus_update4
;	genLabel
00101$:
;	genEndFunction
	
	ret
___mus_update_end:
;	music.c 56
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_update1
; ---------------------------------
___mus_update1_start:
_mus_update1:
	lda	sp,-8(sp)
;	music.c 60
;	genIfx
;	AOP_HL for _mus_wait1
	xor	a,a
	ld	hl,#_mus_wait1
	or	a,(hl)
	jp	z,00137$
;	music.c 61
;	genMinus
;	AOP_HL for _mus_wait1
	dec	(hl)
;	music.c 62
;	genIfx
;	AOP_HL for _mus_wait1
	xor	a,a
	or	a,(hl)
;	genRet
;	music.c 65
;	genLabel
	jp	nz,00139$
00137$:
;	music.c 66
;	genAssign
;	AOP_HL for _mus_data1
	ld	hl,#_mus_data1
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00164$
	inc	hl
	inc	(hl)
00164$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update1_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 67
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	ld	a,(hl)
	cp	a,#0x0E
	jp	z,00105$
00165$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0F
	jp	z,00106$
00166$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x10
	jp	z,00107$
00167$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x11
	jp	z,00108$
00168$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x12
	jp	z,00109$
00169$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x13
	jp	z,00110$
00170$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x14
	jp	z,00111$
00171$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x15
	jp	z,00112$
00172$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x16
	jp	z,00113$
00173$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x17
	jp	z,00114$
00174$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x19
	jp	z,00115$
00175$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1A
	jp	z,00116$
00176$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1B
	jp	z,00117$
00177$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1C
	jp	z,00122$
00178$:
;	genGoto
	jp	00128$
;	music.c 69
;	genLabel
00105$:
;	genAssign
;	AOP_HL for _mus_data1
	ld	hl,#_mus_data1
	ld	b,(hl)
	inc	hl
	ld	c,(hl)
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00179$
	inc	hl
	inc	(hl)
00179$:
;	genPointerGet
;	AOP_HL for _mus_length1
	ld	e,b
	ld	d,c
	ld	a,(de)
	ld	hl,#_mus_length1
	ld	(hl),a
;	music.c 70
;	genGoto
	jp	00137$
;	music.c 72
;	genLabel
00106$:
;	genAssign
;	AOP_HL for _mus_data1
	ld	hl,#_mus_data1
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00180$
	inc	hl
	inc	(hl)
00180$:
;	genPointerGet
;	AOP_HL for _mus_octave1
	ld	a,(bc)
	ld	hl,#_mus_octave1
	ld	(hl),a
;	music.c 73
;	genGoto
	jp	00137$
;	music.c 75
;	genLabel
00107$:
;	genPlus
;	AOP_HL for _mus_octave1
;	genPlusIncr
	ld	hl,#_mus_octave1
	inc	(hl)
;	music.c 76
;	genGoto
	jp	00137$
;	music.c 78
;	genLabel
00108$:
;	genMinus
;	AOP_HL for _mus_octave1
	ld	hl,#_mus_octave1
	dec	(hl)
;	music.c 79
;	genGoto
	jp	00137$
;	music.c 81
;	genLabel
00109$:
;	genAssign
;	AOP_HL for _mus_data1
	ld	hl,#_mus_data1
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00181$
	inc	hl
	inc	(hl)
00181$:
;	genPointerGet
;	AOP_HL for _mus_volume1
	ld	a,(bc)
	ld	hl,#_mus_volume1
	ld	(hl),a
;	music.c 82
;	genAssign
	ld	bc,#0xFF12
;	genLeftShift
;	AOP_HL for _mus_volume1
;	AOP_STK for _mus_update1_sloc0_1_0
	ld	a,(hl)
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
	lda	hl,4(sp)
;	genOr
;	AOP_STK for _mus_update1_sloc0_1_0
;	AOP_HL for _mus_env1
	ld      (hl),a
; Removed redundent load
	ld	hl,#_mus_env1
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 83
;	genGoto
	jp	00137$
;	music.c 85
;	genLabel
00110$:
;	genAssign
;	AOP_HL for _mus_data1
	ld	hl,#_mus_data1
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00182$
	inc	hl
	inc	(hl)
00182$:
;	genPointerGet
;	AOP_HL for _mus_env1
	ld	a,(bc)
	ld	hl,#_mus_env1
	ld	(hl),a
;	music.c 86
;	genAssign
	ld	bc,#0xFF12
;	genLeftShift
;	AOP_HL for _mus_volume1
;	AOP_STK for _mus_update1_sloc0_1_0
	ld	hl,#_mus_volume1
	ld	a,(hl)
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
	lda	hl,4(sp)
;	genOr
;	AOP_STK for _mus_update1_sloc0_1_0
;	AOP_HL for _mus_env1
	ld      (hl),a
; Removed redundent load
	ld	hl,#_mus_env1
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 87
;	genGoto
	jp	00137$
;	music.c 89
;	genLabel
00111$:
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	ld	hl,#_mus_data1
	inc	(hl)
	jr	nz,00183$
	inc	hl
	inc	(hl)
00183$:
;	music.c 90
;	genGoto
	jp	00137$
;	music.c 92
;	genLabel
00112$:
;	genAssign
	ld	bc,#0xFF06
;	genAssign
;	AOP_HL for _mus_data1
;	AOP_STK for _mus_update1_sloc1_1_0
	ld	hl,#_mus_data1
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),e
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	ld	hl,#_mus_data1
	inc	(hl)
	jr	nz,00184$
	inc	hl
	inc	(hl)
00184$:
;	genPointerGet
;	AOP_STK for _mus_update1_sloc1_1_0
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 93
;	genGoto
	jp	00137$
;	music.c 95
;	genLabel
00113$:
;	genAssign
;	AOP_HL for _mus_data1
	ld	hl,#_mus_data1
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00185$
	inc	hl
	inc	(hl)
00185$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update1_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 96
;	genAssign
	ld	bc,#0xFF11
;	genLeftShift
;	AOP_STK for _mus_update1_note_1_1
;	AOP_STK for _mus_update1_sloc1_1_0
	ld	a,(hl)
	srl	a
	rr	a
	rr	a
	and	a,#0xE0
	lda	hl,2(sp)
;	genAssign (pointer)
;	AOP_STK for _mus_update1_sloc1_1_0
	ld      (hl),a
; Removed redundent load
	ld	(bc),a
;	music.c 97
;	genGoto
	jp	00137$
;	music.c 99
;	genLabel
00114$:
;	genAssign
;	AOP_HL for _mus_data1
	ld	hl,#_mus_data1
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00186$
	inc	hl
	inc	(hl)
00186$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update1_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 100
;	genAssign
	ld	bc,#0xFF25
;	genAssign
;	AOP_STK for _mus_update1_sloc1_1_0
	lda	hl,2(sp)
	ld	(hl),#0x25
	inc	hl
	ld	(hl),#0xFF
;	genPointerGet
;	AOP_STK for _mus_update1_sloc1_1_0
;	AOP_STK for _mus_update1_sloc0_1_0
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	inc	hl
;	genAnd
;	AOP_STK for _mus_update1_sloc0_1_0
;	AOP_STK for _mus_update1_sloc1_1_0
	ld      (hl),a
; Removed redundent load
	and	a,#0xEE
	dec	hl
	dec	hl
;	genOr
;	AOP_STK for _mus_update1_sloc1_1_0
;	AOP_STK for _mus_update1_note_1_1
	ld      (hl),a
; Removed redundent load
	lda	hl,7(sp)
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 101
;	genGoto
	jp	00137$
;	music.c 103
;	genLabel
00115$:
;	genAssign
;	AOP_HL for _mus_data1
;	AOP_HL for _mus_loop1
	ld	hl,#_mus_data1
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_loop1
	ld	(hl+),a
	ld	(hl),e
;	music.c 104
;	genGoto
	jp	00137$
;	music.c 106
;	genLabel
00116$:
;	genAssign
;	AOP_HL for _mus_data1
;	AOP_HL for _mus_rep1
	ld	hl,#_mus_data1
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_rep1
	ld	(hl+),a
	ld	(hl),e
;	music.c 107
;	genGoto
	jp	00137$
;	music.c 109
;	genLabel
00117$:
;	genAssign
;	AOP_HL for _mus_data1
	ld	hl,#_mus_data1
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00187$
	inc	hl
	inc	(hl)
00187$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update1_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 110
;	genIfx
;	AOP_HL for _mus_repeats1
	xor	a,a
	ld	hl,#_mus_repeats1
	or	a,(hl)
	jp	nz,00119$
;	music.c 111
;	genAssign
;	AOP_STK for _mus_update1_note_1_1
;	AOP_HL for _mus_repeats1
	lda	hl,7(sp)
	ld	a,(hl)
	ld	hl,#_mus_repeats1
	ld	(hl),a
;	music.c 112
;	genAssign
;	AOP_HL for _mus_rep1
;	AOP_HL for _mus_data1
	ld	hl,#_mus_rep1
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data1
	ld	(hl+),a
	ld	(hl),e
;	genLabel
00119$:
;	music.c 114
;	genMinus
;	AOP_HL for _mus_repeats1
	ld	hl,#_mus_repeats1
	dec	(hl)
;	music.c 115
;	genIfx
;	AOP_HL for _mus_repeats1
	xor	a,a
	or	a,(hl)
	jp	z,00137$
;	music.c 116
;	genAssign
;	AOP_HL for _mus_rep1
;	AOP_HL for _mus_data1
	ld	hl,#_mus_rep1
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data1
	ld	(hl+),a
	ld	(hl),e
;	music.c 118
;	genGoto
	jp	00137$
;	music.c 120
;	genLabel
00122$:
;	genAssign
;	AOP_HL for _mus_loop1
;	AOP_HL for _mus_data1
	ld	hl,#_mus_loop1
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data1
	ld	(hl+),a
	ld	(hl),e
;	music.c 121
;	genAssign
;	AOP_HL for _mus_data1
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPointerGet
	ld	a,(bc)
;	genCmpEq
; genCmpEq: left 1, right 1, result 0
	ld	c,a
	cp	a,#0x1C
	jp	nz,00137$
	jr	00189$
00188$:
	jp	00137$
00189$:
;	music.c 122
;	genAssign
;	AOP_HL for _mus_wait2
	ld	hl,#_mus_wait2
	ld	(hl),#0xFF
;	music.c 123
;	genRet
	jp	00139$
;	music.c 133
;	genLabel
00128$:
;	music.c 127
;	genAnd
;	AOP_STK for _mus_update1_note_1_1
	lda	hl,7(sp)
	ld	a,(hl)
	and	a,#0x80
	jr	nz,00190$
	jp	00126$
00190$:
;	music.c 128
;	genXor
;	AOP_STK for _mus_update1_note_1_1
	ld	a,#0x80
	lda	hl,7(sp)
	xor	a,(hl)
	ld	(hl),a
;	music.c 129
;	genAssign
;	AOP_HL for _mus_data1
	ld	hl,#_mus_data1
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00191$
	inc	hl
	inc	(hl)
00191$:
;	genPointerGet
;	AOP_HL for _mus_wait1
	ld	a,(bc)
	ld	hl,#_mus_wait1
	ld	(hl),a
;	genGoto
	jp	00127$
;	genLabel
00126$:
;	music.c 132
;	genAssign
;	AOP_HL for _mus_length1
;	AOP_HL for _mus_wait1
	ld	hl,#_mus_length1
	ld	a,(hl)
	ld	hl,#_mus_wait1
	ld	(hl),a
;	genLabel
00127$:
;	music.c 134
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0D
	jp	nz,00133$
	jr	00193$
00192$:
	jp	00133$
00193$:
;	music.c 135
;	genRet
	jp	00139$
;	genLabel
00133$:
;	music.c 136
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0C
	jp	nz,00130$
	jr	00195$
00194$:
	jp	00130$
00195$:
;	music.c 137
;	genAssign
;	AOP_STK for _mus_update1_frequency_1_1
	lda	hl,5(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;	music.c 138
;	genAssign
	ld	bc,#0xFF12
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	genGoto
	jp	00134$
;	genLabel
00130$:
;	music.c 140
;	genMinus
;	AOP_HL for _mus_octave1
	ld	hl,#_mus_octave1
	ld	a,(hl)
	add	a,#0xFE
;	genLeftShift
	ld	c,a
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
;	genPlus
;	AOP_STK for _mus_update1_note_1_1
;	Can't optimise plus by inc, falling back to the normal way
	ld	c,a
	lda	hl,7(sp)
	add	a,(hl)
	ld	c,a
;	genCast
; Removed redundent load
	ld	b,#0x00
;	genLeftShift
	sla	c
	rl	b
;	genPlus
;	Can't optimise plus by inc, falling back to the normal way
	ld	hl,#_freq
	add	hl,bc
	ld	c,l
	ld	b,h
;	genPointerGet
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;	genAssign
;	AOP_STK for _mus_update1_frequency_1_1
	lda	hl,5(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;	music.c 141
;	genAssign
	ld	bc,#0xFF12
;	genLeftShift
;	AOP_HL for _mus_volume1
;	AOP_STK for _mus_update1_sloc1_1_0
	ld	hl,#_mus_volume1
	ld	a,(hl)
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
	lda	hl,2(sp)
;	genOr
;	AOP_STK for _mus_update1_sloc1_1_0
;	AOP_HL for _mus_env1
	ld      (hl),a
; Removed redundent load
	ld	hl,#_mus_env1
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	genLabel
00134$:
;	music.c 143
;	genAssign
	ld	bc,#0xFF13
;	genCast
;	AOP_STK for _mus_update1_frequency_1_1
	lda	hl,5(sp)
	ld	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 144
;	genAssign
	ld	bc,#0xFF14
;	genRightShift
;	AOP_STK for _mus_update1_frequency_1_1
;	AOP_STK for _mus_update1_sloc1_1_0
	inc	hl
	ld	a,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),#0x00
;	genOr
;	AOP_STK for _mus_update1_sloc1_1_0
;	AOP_STK for _mus_update1_sloc2_1_0
	dec	hl
	ld	a,(hl)
	or	a,#0x80
	dec	hl
	dec	hl
	ld	(hl),a
	lda	hl,3(sp)
	ld	a,(hl)
	dec	hl
	dec	hl
;	genCast
;	AOP_STK for _mus_update1_sloc2_1_0
	ld      (hl-),a
	ld	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 145
;	genRet
;	music.c 146
;	genLabel
00139$:
;	genEndFunction
	lda	sp,8(sp)
	ret
___mus_update1_end:
;	music.c 150
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_update2
; ---------------------------------
___mus_update2_start:
_mus_update2:
	lda	sp,-8(sp)
;	music.c 154
;	genIfx
;	AOP_HL for _mus_wait2
	xor	a,a
	ld	hl,#_mus_wait2
	or	a,(hl)
	jp	z,00137$
;	music.c 155
;	genMinus
;	AOP_HL for _mus_wait2
	dec	(hl)
;	music.c 156
;	genIfx
;	AOP_HL for _mus_wait2
	xor	a,a
	or	a,(hl)
;	genRet
;	music.c 159
;	genLabel
	jp	nz,00139$
00137$:
;	music.c 160
;	genAssign
;	AOP_HL for _mus_data2
	ld	hl,#_mus_data2
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00164$
	inc	hl
	inc	(hl)
00164$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update2_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 161
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	ld	a,(hl)
	cp	a,#0x0E
	jp	z,00105$
00165$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0F
	jp	z,00106$
00166$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x10
	jp	z,00107$
00167$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x11
	jp	z,00108$
00168$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x12
	jp	z,00109$
00169$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x13
	jp	z,00110$
00170$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x14
	jp	z,00111$
00171$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x15
	jp	z,00112$
00172$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x16
	jp	z,00113$
00173$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x17
	jp	z,00114$
00174$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x19
	jp	z,00115$
00175$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1A
	jp	z,00116$
00176$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1B
	jp	z,00117$
00177$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1C
	jp	z,00122$
00178$:
;	genGoto
	jp	00128$
;	music.c 163
;	genLabel
00105$:
;	genAssign
;	AOP_HL for _mus_data2
	ld	hl,#_mus_data2
	ld	b,(hl)
	inc	hl
	ld	c,(hl)
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00179$
	inc	hl
	inc	(hl)
00179$:
;	genPointerGet
;	AOP_HL for _mus_length2
	ld	e,b
	ld	d,c
	ld	a,(de)
	ld	hl,#_mus_length2
	ld	(hl),a
;	music.c 164
;	genGoto
	jp	00137$
;	music.c 166
;	genLabel
00106$:
;	genAssign
;	AOP_HL for _mus_data2
	ld	hl,#_mus_data2
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00180$
	inc	hl
	inc	(hl)
00180$:
;	genPointerGet
;	AOP_HL for _mus_octave2
	ld	a,(bc)
	ld	hl,#_mus_octave2
	ld	(hl),a
;	music.c 167
;	genGoto
	jp	00137$
;	music.c 169
;	genLabel
00107$:
;	genPlus
;	AOP_HL for _mus_octave2
;	genPlusIncr
	ld	hl,#_mus_octave2
	inc	(hl)
;	music.c 170
;	genGoto
	jp	00137$
;	music.c 172
;	genLabel
00108$:
;	genMinus
;	AOP_HL for _mus_octave2
	ld	hl,#_mus_octave2
	dec	(hl)
;	music.c 173
;	genGoto
	jp	00137$
;	music.c 175
;	genLabel
00109$:
;	genAssign
;	AOP_HL for _mus_data2
	ld	hl,#_mus_data2
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00181$
	inc	hl
	inc	(hl)
00181$:
;	genPointerGet
;	AOP_HL for _mus_volume2
	ld	a,(bc)
	ld	hl,#_mus_volume2
	ld	(hl),a
;	music.c 176
;	genAssign
	ld	bc,#0xFF17
;	genLeftShift
;	AOP_HL for _mus_volume2
;	AOP_STK for _mus_update2_sloc0_1_0
	ld	a,(hl)
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
	lda	hl,4(sp)
;	genOr
;	AOP_STK for _mus_update2_sloc0_1_0
;	AOP_HL for _mus_env2
	ld      (hl),a
; Removed redundent load
	ld	hl,#_mus_env2
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 177
;	genGoto
	jp	00137$
;	music.c 179
;	genLabel
00110$:
;	genAssign
;	AOP_HL for _mus_data2
	ld	hl,#_mus_data2
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00182$
	inc	hl
	inc	(hl)
00182$:
;	genPointerGet
;	AOP_HL for _mus_env2
	ld	a,(bc)
	ld	hl,#_mus_env2
	ld	(hl),a
;	music.c 180
;	genAssign
	ld	bc,#0xFF17
;	genLeftShift
;	AOP_HL for _mus_volume2
;	AOP_STK for _mus_update2_sloc0_1_0
	ld	hl,#_mus_volume2
	ld	a,(hl)
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
	lda	hl,4(sp)
;	genOr
;	AOP_STK for _mus_update2_sloc0_1_0
;	AOP_HL for _mus_env2
	ld      (hl),a
; Removed redundent load
	ld	hl,#_mus_env2
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 181
;	genGoto
	jp	00137$
;	music.c 183
;	genLabel
00111$:
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	ld	hl,#_mus_data2
	inc	(hl)
	jr	nz,00183$
	inc	hl
	inc	(hl)
00183$:
;	music.c 184
;	genGoto
	jp	00137$
;	music.c 186
;	genLabel
00112$:
;	genAssign
	ld	bc,#0xFF06
;	genAssign
;	AOP_HL for _mus_data2
;	AOP_STK for _mus_update2_sloc1_1_0
	ld	hl,#_mus_data2
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),e
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	ld	hl,#_mus_data2
	inc	(hl)
	jr	nz,00184$
	inc	hl
	inc	(hl)
00184$:
;	genPointerGet
;	AOP_STK for _mus_update2_sloc1_1_0
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 187
;	genGoto
	jp	00137$
;	music.c 189
;	genLabel
00113$:
;	genAssign
;	AOP_HL for _mus_data2
	ld	hl,#_mus_data2
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00185$
	inc	hl
	inc	(hl)
00185$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update2_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 190
;	genAssign
	ld	bc,#0xFF16
;	genLeftShift
;	AOP_STK for _mus_update2_note_1_1
;	AOP_STK for _mus_update2_sloc1_1_0
	ld	a,(hl)
	srl	a
	rr	a
	rr	a
	and	a,#0xE0
	lda	hl,2(sp)
;	genAssign (pointer)
;	AOP_STK for _mus_update2_sloc1_1_0
	ld      (hl),a
; Removed redundent load
	ld	(bc),a
;	music.c 191
;	genGoto
	jp	00137$
;	music.c 193
;	genLabel
00114$:
;	genAssign
;	AOP_HL for _mus_data2
	ld	hl,#_mus_data2
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00186$
	inc	hl
	inc	(hl)
00186$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update2_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 194
;	genAssign
	ld	bc,#0xFF25
;	genAssign
;	AOP_STK for _mus_update2_sloc1_1_0
	lda	hl,2(sp)
	ld	(hl),#0x25
	inc	hl
	ld	(hl),#0xFF
;	genPointerGet
;	AOP_STK for _mus_update2_sloc1_1_0
;	AOP_STK for _mus_update2_sloc0_1_0
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	inc	hl
;	genAnd
;	AOP_STK for _mus_update2_sloc0_1_0
;	AOP_STK for _mus_update2_sloc1_1_0
	ld      (hl),a
; Removed redundent load
	and	a,#0xDD
	dec	hl
	dec	hl
	ld	(hl),a
;	genLeftShift
;	AOP_STK for _mus_update2_note_1_1
;	AOP_STK for _mus_update2_sloc0_1_0
	lda	hl,7(sp)
	ld	a,(hl)
	add	a,a
	lda	hl,4(sp)
;	genOr
;	AOP_STK for _mus_update2_sloc1_1_0
;	AOP_STK for _mus_update2_sloc0_1_0
	ld      (hl-),a
	dec	hl
	ld	a,(hl+)
	inc	hl
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 195
;	genGoto
	jp	00137$
;	music.c 197
;	genLabel
00115$:
;	genAssign
;	AOP_HL for _mus_data2
;	AOP_HL for _mus_loop2
	ld	hl,#_mus_data2
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_loop2
	ld	(hl+),a
	ld	(hl),e
;	music.c 198
;	genGoto
	jp	00137$
;	music.c 200
;	genLabel
00116$:
;	genAssign
;	AOP_HL for _mus_data2
;	AOP_HL for _mus_rep2
	ld	hl,#_mus_data2
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_rep2
	ld	(hl+),a
	ld	(hl),e
;	music.c 201
;	genGoto
	jp	00137$
;	music.c 203
;	genLabel
00117$:
;	genAssign
;	AOP_HL for _mus_data2
	ld	hl,#_mus_data2
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00187$
	inc	hl
	inc	(hl)
00187$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update2_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 204
;	genIfx
;	AOP_HL for _mus_repeats2
	xor	a,a
	ld	hl,#_mus_repeats2
	or	a,(hl)
	jp	nz,00119$
;	music.c 205
;	genAssign
;	AOP_STK for _mus_update2_note_1_1
;	AOP_HL for _mus_repeats2
	lda	hl,7(sp)
	ld	a,(hl)
	ld	hl,#_mus_repeats2
	ld	(hl),a
;	music.c 206
;	genAssign
;	AOP_HL for _mus_rep2
;	AOP_HL for _mus_data2
	ld	hl,#_mus_rep2
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data2
	ld	(hl+),a
	ld	(hl),e
;	genLabel
00119$:
;	music.c 208
;	genMinus
;	AOP_HL for _mus_repeats2
	ld	hl,#_mus_repeats2
	dec	(hl)
;	music.c 209
;	genIfx
;	AOP_HL for _mus_repeats2
	xor	a,a
	or	a,(hl)
	jp	z,00137$
;	music.c 210
;	genAssign
;	AOP_HL for _mus_rep2
;	AOP_HL for _mus_data2
	ld	hl,#_mus_rep2
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data2
	ld	(hl+),a
	ld	(hl),e
;	music.c 212
;	genGoto
	jp	00137$
;	music.c 214
;	genLabel
00122$:
;	genAssign
;	AOP_HL for _mus_loop2
;	AOP_HL for _mus_data2
	ld	hl,#_mus_loop2
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data2
	ld	(hl+),a
	ld	(hl),e
;	music.c 215
;	genAssign
;	AOP_HL for _mus_data2
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPointerGet
	ld	a,(bc)
;	genCmpEq
; genCmpEq: left 1, right 1, result 0
	ld	c,a
	cp	a,#0x1C
	jp	nz,00137$
	jr	00189$
00188$:
	jp	00137$
00189$:
;	music.c 216
;	genAssign
;	AOP_HL for _mus_wait2
	ld	hl,#_mus_wait2
	ld	(hl),#0xFF
;	music.c 217
;	genRet
	jp	00139$
;	music.c 227
;	genLabel
00128$:
;	music.c 221
;	genAnd
;	AOP_STK for _mus_update2_note_1_1
	lda	hl,7(sp)
	ld	a,(hl)
	and	a,#0x80
	jr	nz,00190$
	jp	00126$
00190$:
;	music.c 222
;	genXor
;	AOP_STK for _mus_update2_note_1_1
	ld	a,#0x80
	lda	hl,7(sp)
	xor	a,(hl)
	ld	(hl),a
;	music.c 223
;	genAssign
;	AOP_HL for _mus_data2
	ld	hl,#_mus_data2
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00191$
	inc	hl
	inc	(hl)
00191$:
;	genPointerGet
;	AOP_HL for _mus_wait2
	ld	a,(bc)
	ld	hl,#_mus_wait2
	ld	(hl),a
;	genGoto
	jp	00127$
;	genLabel
00126$:
;	music.c 226
;	genAssign
;	AOP_HL for _mus_length2
;	AOP_HL for _mus_wait2
	ld	hl,#_mus_length2
	ld	a,(hl)
	ld	hl,#_mus_wait2
	ld	(hl),a
;	genLabel
00127$:
;	music.c 228
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0D
	jp	nz,00133$
	jr	00193$
00192$:
	jp	00133$
00193$:
;	music.c 229
;	genRet
	jp	00139$
;	genLabel
00133$:
;	music.c 230
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0C
	jp	nz,00130$
	jr	00195$
00194$:
	jp	00130$
00195$:
;	music.c 231
;	genAssign
;	AOP_STK for _mus_update2_frequency_1_1
	lda	hl,5(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;	music.c 232
;	genAssign
	ld	bc,#0xFF17
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	genGoto
	jp	00134$
;	genLabel
00130$:
;	music.c 234
;	genMinus
;	AOP_HL for _mus_octave2
	ld	hl,#_mus_octave2
	ld	a,(hl)
	add	a,#0xFE
;	genLeftShift
	ld	c,a
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
;	genPlus
;	AOP_STK for _mus_update2_note_1_1
;	Can't optimise plus by inc, falling back to the normal way
	ld	c,a
	lda	hl,7(sp)
	add	a,(hl)
	ld	c,a
;	genCast
; Removed redundent load
	ld	b,#0x00
;	genLeftShift
	sla	c
	rl	b
;	genPlus
;	Can't optimise plus by inc, falling back to the normal way
	ld	hl,#_freq
	add	hl,bc
	ld	c,l
	ld	b,h
;	genPointerGet
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;	genAssign
;	AOP_STK for _mus_update2_frequency_1_1
	lda	hl,5(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;	music.c 235
;	genAssign
	ld	bc,#0xFF17
;	genLeftShift
;	AOP_HL for _mus_volume2
;	AOP_STK for _mus_update2_sloc1_1_0
	ld	hl,#_mus_volume2
	ld	a,(hl)
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
	lda	hl,2(sp)
;	genOr
;	AOP_STK for _mus_update2_sloc1_1_0
;	AOP_HL for _mus_env2
	ld      (hl),a
; Removed redundent load
	ld	hl,#_mus_env2
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	genLabel
00134$:
;	music.c 237
;	genAssign
	ld	bc,#0xFF18
;	genCast
;	AOP_STK for _mus_update2_frequency_1_1
	lda	hl,5(sp)
	ld	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 238
;	genAssign
	ld	bc,#0xFF19
;	genRightShift
;	AOP_STK for _mus_update2_frequency_1_1
;	AOP_STK for _mus_update2_sloc1_1_0
	inc	hl
	ld	a,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),#0x00
;	genOr
;	AOP_STK for _mus_update2_sloc1_1_0
;	AOP_STK for _mus_update2_sloc2_1_0
	dec	hl
	ld	a,(hl)
	or	a,#0x80
	dec	hl
	dec	hl
	ld	(hl),a
	lda	hl,3(sp)
	ld	a,(hl)
	dec	hl
	dec	hl
;	genCast
;	AOP_STK for _mus_update2_sloc2_1_0
	ld      (hl-),a
	ld	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 239
;	genRet
;	music.c 240
;	genLabel
00139$:
;	genEndFunction
	lda	sp,8(sp)
	ret
___mus_update2_end:
;	music.c 244
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_update3
; ---------------------------------
___mus_update3_start:
_mus_update3:
	lda	sp,-8(sp)
;	music.c 248
;	genIfx
;	AOP_HL for _mus_wait3
	xor	a,a
	ld	hl,#_mus_wait3
	or	a,(hl)
	jp	z,00137$
;	music.c 249
;	genMinus
;	AOP_HL for _mus_wait3
	dec	(hl)
;	music.c 250
;	genIfx
;	AOP_HL for _mus_wait3
	xor	a,a
	or	a,(hl)
;	genRet
;	music.c 253
;	genLabel
	jp	nz,00139$
00137$:
;	music.c 254
;	genAssign
;	AOP_HL for _mus_data3
	ld	hl,#_mus_data3
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00164$
	inc	hl
	inc	(hl)
00164$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update3_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 255
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	ld	a,(hl)
	cp	a,#0x0E
	jp	z,00105$
00165$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0F
	jp	z,00106$
00166$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x10
	jp	z,00107$
00167$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x11
	jp	z,00108$
00168$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x12
	jp	z,00109$
00169$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x13
	jp	z,00110$
00170$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x14
	jp	z,00111$
00171$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x15
	jp	z,00112$
00172$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x16
	jp	z,00113$
00173$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x17
	jp	z,00114$
00174$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x19
	jp	z,00115$
00175$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1A
	jp	z,00116$
00176$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1B
	jp	z,00117$
00177$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1C
	jp	z,00122$
00178$:
;	genGoto
	jp	00128$
;	music.c 257
;	genLabel
00105$:
;	genAssign
;	AOP_HL for _mus_data3
	ld	hl,#_mus_data3
	ld	b,(hl)
	inc	hl
	ld	c,(hl)
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00179$
	inc	hl
	inc	(hl)
00179$:
;	genPointerGet
;	AOP_HL for _mus_length3
	ld	e,b
	ld	d,c
	ld	a,(de)
	ld	hl,#_mus_length3
	ld	(hl),a
;	music.c 258
;	genGoto
	jp	00137$
;	music.c 260
;	genLabel
00106$:
;	genAssign
;	AOP_HL for _mus_data3
	ld	hl,#_mus_data3
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00180$
	inc	hl
	inc	(hl)
00180$:
;	genPointerGet
;	AOP_HL for _mus_octave3
	ld	a,(bc)
	ld	hl,#_mus_octave3
	ld	(hl),a
;	music.c 261
;	genGoto
	jp	00137$
;	music.c 263
;	genLabel
00107$:
;	genPlus
;	AOP_HL for _mus_octave3
;	genPlusIncr
	ld	hl,#_mus_octave3
	inc	(hl)
;	music.c 264
;	genGoto
	jp	00137$
;	music.c 266
;	genLabel
00108$:
;	genMinus
;	AOP_HL for _mus_octave3
	ld	hl,#_mus_octave3
	dec	(hl)
;	music.c 267
;	genGoto
	jp	00137$
;	music.c 269
;	genLabel
00109$:
;	genAssign
;	AOP_HL for _mus_data3
	ld	hl,#_mus_data3
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00181$
	inc	hl
	inc	(hl)
00181$:
;	genPointerGet
;	AOP_HL for _mus_volume3
	ld	a,(bc)
	ld	hl,#_mus_volume3
	ld	(hl),a
;	music.c 270
;	genAssign
	ld	bc,#0xFF1C
;	genLeftShift
;	AOP_HL for _mus_volume3
;	AOP_STK for _mus_update3_sloc0_1_0
	ld	a,(hl)
	srl	a
	rr	a
	rr	a
	and	a,#0xE0
	lda	hl,4(sp)
;	genAssign (pointer)
;	AOP_STK for _mus_update3_sloc0_1_0
	ld      (hl),a
; Removed redundent load
	ld	(bc),a
;	music.c 271
;	genGoto
	jp	00137$
;	music.c 273
;	genLabel
00110$:
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	ld	hl,#_mus_data3
	inc	(hl)
	jr	nz,00182$
	inc	hl
	inc	(hl)
00182$:
;	music.c 274
;	genGoto
	jp	00137$
;	music.c 276
;	genLabel
00111$:
;	genAssign
;	AOP_HL for _mus_data3
	ld	hl,#_mus_data3
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00183$
	inc	hl
	inc	(hl)
00183$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update3_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 277
;	genAssign
	ld	bc,#0xFF1A
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	music.c 278
;	genPlus
;	AOP_HL for _mus_song
;	genPlusIncr
;	Can't optimise plus by inc, falling back to the normal way
	ld	hl,#_mus_song
	ld	a,(hl)
	add	a,#0x08
	ld	c,a
	inc	hl
	ld	a,(hl)
	adc	a,#0x00
	ld	b,a
;	genLeftShift
;	AOP_STK for _mus_update3_note_1_1
;	AOP_STK for _mus_update3_sloc0_1_0
	lda	hl,7(sp)
	ld	a,(hl)
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
	lda	hl,4(sp)
;	genPlus
;	AOP_STK for _mus_update3_sloc0_1_0
;	Can't optimise plus by inc, falling back to the normal way
	ld      (hl),a
	ld      l,a
	ld	h,#0x00
	add	hl,bc
	ld	c,l
	ld	b,h
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#0x0010
	push	hl
;	genIpush
	push	bc
;	genIpush
	ld	hl,#0xFF30
	push	hl
;	genCall
	call	_memcpy
	lda	sp,6(sp)
;	music.c 279
;	genAssign
	ld	bc,#0xFF1A
;	genAssign (pointer)
	ld	a,#0x80
	ld	(bc),a
;	music.c 280
;	genGoto
	jp	00137$
;	music.c 282
;	genLabel
00112$:
;	genAssign
	ld	bc,#0xFF06
;	genAssign
;	AOP_HL for _mus_data3
;	AOP_STK for _mus_update3_sloc1_1_0
	ld	hl,#_mus_data3
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),e
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	ld	hl,#_mus_data3
	inc	(hl)
	jr	nz,00184$
	inc	hl
	inc	(hl)
00184$:
;	genPointerGet
;	AOP_STK for _mus_update3_sloc1_1_0
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 283
;	genGoto
	jp	00137$
;	music.c 285
;	genLabel
00113$:
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	ld	hl,#_mus_data3
	inc	(hl)
	jr	nz,00185$
	inc	hl
	inc	(hl)
00185$:
;	music.c 286
;	genGoto
	jp	00137$
;	music.c 288
;	genLabel
00114$:
;	genAssign
;	AOP_HL for _mus_data3
	ld	hl,#_mus_data3
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00186$
	inc	hl
	inc	(hl)
00186$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update3_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 289
;	genAssign
	ld	bc,#0xFF25
;	genAssign
;	AOP_STK for _mus_update3_sloc1_1_0
	lda	hl,2(sp)
	ld	(hl),#0x25
	inc	hl
	ld	(hl),#0xFF
;	genPointerGet
;	AOP_STK for _mus_update3_sloc1_1_0
;	AOP_STK for _mus_update3_sloc0_1_0
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	inc	hl
;	genAnd
;	AOP_STK for _mus_update3_sloc0_1_0
;	AOP_STK for _mus_update3_sloc1_1_0
	ld      (hl),a
; Removed redundent load
	and	a,#0xBB
	dec	hl
	dec	hl
	ld	(hl),a
;	genLeftShift
;	AOP_STK for _mus_update3_note_1_1
;	AOP_STK for _mus_update3_sloc0_1_0
	lda	hl,7(sp)
	ld	a,(hl)
	add	a,a
	add	a,a
	lda	hl,4(sp)
;	genOr
;	AOP_STK for _mus_update3_sloc1_1_0
;	AOP_STK for _mus_update3_sloc0_1_0
	ld      (hl-),a
	dec	hl
	ld	a,(hl+)
	inc	hl
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 290
;	genGoto
	jp	00137$
;	music.c 292
;	genLabel
00115$:
;	genAssign
;	AOP_HL for _mus_data3
;	AOP_HL for _mus_loop3
	ld	hl,#_mus_data3
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_loop3
	ld	(hl+),a
	ld	(hl),e
;	music.c 293
;	genGoto
	jp	00137$
;	music.c 295
;	genLabel
00116$:
;	genAssign
;	AOP_HL for _mus_data3
;	AOP_HL for _mus_rep3
	ld	hl,#_mus_data3
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_rep3
	ld	(hl+),a
	ld	(hl),e
;	music.c 296
;	genGoto
	jp	00137$
;	music.c 298
;	genLabel
00117$:
;	genAssign
;	AOP_HL for _mus_data3
	ld	hl,#_mus_data3
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00187$
	inc	hl
	inc	(hl)
00187$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update3_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 299
;	genIfx
;	AOP_HL for _mus_repeats3
	xor	a,a
	ld	hl,#_mus_repeats3
	or	a,(hl)
	jp	nz,00119$
;	music.c 300
;	genAssign
;	AOP_STK for _mus_update3_note_1_1
;	AOP_HL for _mus_repeats3
	lda	hl,7(sp)
	ld	a,(hl)
	ld	hl,#_mus_repeats3
	ld	(hl),a
;	music.c 301
;	genAssign
;	AOP_HL for _mus_rep3
;	AOP_HL for _mus_data3
	ld	hl,#_mus_rep3
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data3
	ld	(hl+),a
	ld	(hl),e
;	genLabel
00119$:
;	music.c 303
;	genMinus
;	AOP_HL for _mus_repeats3
	ld	hl,#_mus_repeats3
	dec	(hl)
;	music.c 304
;	genIfx
;	AOP_HL for _mus_repeats3
	xor	a,a
	or	a,(hl)
	jp	z,00137$
;	music.c 305
;	genAssign
;	AOP_HL for _mus_rep3
;	AOP_HL for _mus_data3
	ld	hl,#_mus_rep3
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data3
	ld	(hl+),a
	ld	(hl),e
;	music.c 307
;	genGoto
	jp	00137$
;	music.c 309
;	genLabel
00122$:
;	genAssign
;	AOP_HL for _mus_loop3
;	AOP_HL for _mus_data3
	ld	hl,#_mus_loop3
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data3
	ld	(hl+),a
	ld	(hl),e
;	music.c 310
;	genAssign
;	AOP_HL for _mus_data3
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPointerGet
	ld	a,(bc)
;	genCmpEq
; genCmpEq: left 1, right 1, result 0
	ld	c,a
	cp	a,#0x1C
	jp	nz,00137$
	jr	00189$
00188$:
	jp	00137$
00189$:
;	music.c 311
;	genAssign
;	AOP_HL for _mus_wait3
	ld	hl,#_mus_wait3
	ld	(hl),#0xFF
;	music.c 312
;	genRet
	jp	00139$
;	music.c 321
;	genLabel
00128$:
;	music.c 316
;	genAnd
;	AOP_STK for _mus_update3_note_1_1
	lda	hl,7(sp)
	ld	a,(hl)
	and	a,#0x80
	jr	nz,00190$
	jp	00126$
00190$:
;	music.c 317
;	genXor
;	AOP_STK for _mus_update3_note_1_1
	ld	a,#0x80
	lda	hl,7(sp)
	xor	a,(hl)
	ld	(hl),a
;	music.c 318
;	genAssign
;	AOP_HL for _mus_data3
	ld	hl,#_mus_data3
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00191$
	inc	hl
	inc	(hl)
00191$:
;	genPointerGet
;	AOP_HL for _mus_wait3
	ld	a,(bc)
	ld	hl,#_mus_wait3
	ld	(hl),a
;	genGoto
	jp	00127$
;	genLabel
00126$:
;	music.c 320
;	genAssign
;	AOP_HL for _mus_length3
;	AOP_HL for _mus_wait3
	ld	hl,#_mus_length3
	ld	a,(hl)
	ld	hl,#_mus_wait3
	ld	(hl),a
;	genLabel
00127$:
;	music.c 322
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0D
	jp	nz,00133$
	jr	00193$
00192$:
	jp	00133$
00193$:
;	music.c 323
;	genRet
	jp	00139$
;	genLabel
00133$:
;	music.c 324
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0C
	jp	nz,00130$
	jr	00195$
00194$:
	jp	00130$
00195$:
;	music.c 325
;	genAssign
;	AOP_STK for _mus_update3_frequency_1_1
	lda	hl,5(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;	music.c 326
;	genAssign
	ld	bc,#0xFF1C
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	genGoto
	jp	00134$
;	genLabel
00130$:
;	music.c 328
;	genMinus
;	AOP_HL for _mus_octave3
	ld	hl,#_mus_octave3
	ld	a,(hl)
	add	a,#0xFE
;	genLeftShift
	ld	c,a
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
;	genPlus
;	AOP_STK for _mus_update3_note_1_1
;	Can't optimise plus by inc, falling back to the normal way
	ld	c,a
	lda	hl,7(sp)
	add	a,(hl)
	ld	c,a
;	genCast
; Removed redundent load
	ld	b,#0x00
;	genLeftShift
	sla	c
	rl	b
;	genPlus
;	Can't optimise plus by inc, falling back to the normal way
	ld	hl,#_freq
	add	hl,bc
	ld	c,l
	ld	b,h
;	genPointerGet
	ld	e,c
	ld	d,b
	ld	a,(de)
	ld	c,a
	inc	de
	ld	a,(de)
	ld	b,a
;	genAssign
;	AOP_STK for _mus_update3_frequency_1_1
	lda	hl,5(sp)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;	music.c 329
;	genAssign
	ld	bc,#0xFF1C
;	genLeftShift
;	AOP_HL for _mus_volume3
;	AOP_STK for _mus_update3_sloc1_1_0
	ld	hl,#_mus_volume3
	ld	a,(hl)
	srl	a
	rr	a
	rr	a
	and	a,#0xE0
	lda	hl,2(sp)
;	genAssign (pointer)
;	AOP_STK for _mus_update3_sloc1_1_0
	ld      (hl),a
; Removed redundent load
	ld	(bc),a
;	genLabel
00134$:
;	music.c 331
;	genAssign
	ld	bc,#0xFF1A
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	music.c 332
;	genAssign
	ld	bc,#0xFF1A
;	genAssign (pointer)
	ld	a,#0x80
	ld	(bc),a
;	music.c 333
;	genAssign
	ld	bc,#0xFF1D
;	genCast
;	AOP_STK for _mus_update3_frequency_1_1
	lda	hl,5(sp)
	ld	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 334
;	genAssign
	ld	bc,#0xFF1E
;	genRightShift
;	AOP_STK for _mus_update3_frequency_1_1
;	AOP_STK for _mus_update3_sloc1_1_0
	inc	hl
	ld	a,(hl)
	lda	hl,2(sp)
	ld	(hl+),a
	ld	(hl),#0x00
;	genOr
;	AOP_STK for _mus_update3_sloc1_1_0
;	AOP_STK for _mus_update3_sloc2_1_0
	dec	hl
	ld	a,(hl)
	or	a,#0x80
	dec	hl
	dec	hl
	ld	(hl),a
	lda	hl,3(sp)
	ld	a,(hl)
	dec	hl
	dec	hl
;	genCast
;	AOP_STK for _mus_update3_sloc2_1_0
	ld      (hl-),a
	ld	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 335
;	genRet
;	music.c 336
;	genLabel
00139$:
;	genEndFunction
	lda	sp,8(sp)
	ret
___mus_update3_end:
;	music.c 340
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_update4
; ---------------------------------
___mus_update4_start:
_mus_update4:
	lda	sp,-5(sp)
;	music.c 343
;	genIfx
;	AOP_HL for _mus_wait4
	xor	a,a
	ld	hl,#_mus_wait4
	or	a,(hl)
	jp	z,00135$
;	music.c 344
;	genMinus
;	AOP_HL for _mus_wait4
	dec	(hl)
;	music.c 345
;	genIfx
;	AOP_HL for _mus_wait4
	xor	a,a
	or	a,(hl)
;	genRet
;	music.c 348
;	genLabel
	jp	nz,00137$
00135$:
;	music.c 349
;	genAssign
;	AOP_HL for _mus_data4
	ld	hl,#_mus_data4
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data4
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00160$
	inc	hl
	inc	(hl)
00160$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update4_note_1_1
	lda	hl,4(sp)
	ld	(hl),c
;	music.c 350
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	ld	a,(hl)
	cp	a,#0x0E
	jp	z,00105$
00161$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x0F
	jp	z,00106$
00162$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x10
	jp	z,00107$
00163$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x11
	jp	z,00108$
00164$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x12
	jp	z,00109$
00165$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x13
	jp	z,00110$
00166$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x15
	jp	z,00111$
00167$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x17
	jp	z,00112$
00168$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x19
	jp	z,00113$
00169$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x1A
	jp	z,00114$
00170$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x1B
	jp	z,00115$
00171$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x1C
	jp	z,00120$
00172$:
;	genGoto
	jp	00126$
;	music.c 352
;	genLabel
00105$:
;	genAssign
;	AOP_HL for _mus_data4
	ld	hl,#_mus_data4
	ld	b,(hl)
	inc	hl
	ld	c,(hl)
;	genPlus
;	AOP_HL for _mus_data4
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00173$
	inc	hl
	inc	(hl)
00173$:
;	genPointerGet
;	AOP_HL for _mus_length4
	ld	e,b
	ld	d,c
	ld	a,(de)
	ld	hl,#_mus_length4
	ld	(hl),a
;	music.c 353
;	genGoto
	jp	00135$
;	music.c 355
;	genLabel
00106$:
;	genAssign
;	AOP_HL for _mus_data4
	ld	hl,#_mus_data4
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data4
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00174$
	inc	hl
	inc	(hl)
00174$:
;	genPointerGet
;	AOP_HL for _mus_octave4
	ld	a,(bc)
	ld	hl,#_mus_octave4
	ld	(hl),a
;	music.c 356
;	genGoto
	jp	00135$
;	music.c 358
;	genLabel
00107$:
;	genPlus
;	AOP_HL for _mus_octave4
;	genPlusIncr
	ld	hl,#_mus_octave4
	inc	(hl)
;	music.c 359
;	genGoto
	jp	00135$
;	music.c 361
;	genLabel
00108$:
;	genMinus
;	AOP_HL for _mus_octave4
	ld	hl,#_mus_octave4
	dec	(hl)
;	music.c 362
;	genGoto
	jp	00135$
;	music.c 364
;	genLabel
00109$:
;	genAssign
;	AOP_HL for _mus_data4
	ld	hl,#_mus_data4
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data4
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00175$
	inc	hl
	inc	(hl)
00175$:
;	genPointerGet
;	AOP_HL for _mus_volume4
	ld	a,(bc)
	ld	hl,#_mus_volume4
	ld	(hl),a
;	music.c 365
;	genAssign
	ld	bc,#0xFF21
;	genLeftShift
;	AOP_HL for _mus_volume4
;	AOP_STK for _mus_update4_sloc0_1_0
	ld	a,(hl)
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
	lda	hl,2(sp)
;	genOr
;	AOP_STK for _mus_update4_sloc0_1_0
;	AOP_HL for _mus_env4
	ld      (hl),a
; Removed redundent load
	ld	hl,#_mus_env4
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 366
;	genGoto
	jp	00135$
;	music.c 368
;	genLabel
00110$:
;	genAssign
;	AOP_HL for _mus_data4
	ld	hl,#_mus_data4
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data4
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00176$
	inc	hl
	inc	(hl)
00176$:
;	genPointerGet
;	AOP_HL for _mus_env4
	ld	a,(bc)
	ld	hl,#_mus_env4
	ld	(hl),a
;	music.c 369
;	genAssign
	ld	bc,#0xFF21
;	genLeftShift
;	AOP_HL for _mus_volume4
;	AOP_STK for _mus_update4_sloc0_1_0
	ld	hl,#_mus_volume4
	ld	a,(hl)
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
	lda	hl,2(sp)
;	genOr
;	AOP_STK for _mus_update4_sloc0_1_0
;	AOP_HL for _mus_env4
	ld      (hl),a
; Removed redundent load
	ld	hl,#_mus_env4
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 370
;	genGoto
	jp	00135$
;	music.c 372
;	genLabel
00111$:
;	genAssign
	ld	bc,#0xFF06
;	genAssign
;	AOP_HL for _mus_data4
;	AOP_STK for _mus_update4_sloc1_1_0
	ld	hl,#_mus_data4
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
;	genPlus
;	AOP_HL for _mus_data4
;	genPlusIncr
	ld	hl,#_mus_data4
	inc	(hl)
	jr	nz,00177$
	inc	hl
	inc	(hl)
00177$:
;	genPointerGet
;	AOP_STK for _mus_update4_sloc1_1_0
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 373
;	genGoto
	jp	00135$
;	music.c 375
;	genLabel
00112$:
;	genAssign
;	AOP_HL for _mus_data4
	ld	hl,#_mus_data4
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data4
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00178$
	inc	hl
	inc	(hl)
00178$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update4_note_1_1
	lda	hl,4(sp)
	ld	(hl),c
;	music.c 376
;	genAssign
	ld	bc,#0xFF25
;	genAssign
;	AOP_STK for _mus_update4_sloc1_1_0
	lda	hl,0(sp)
	ld	(hl),#0x25
	inc	hl
	ld	(hl),#0xFF
;	genPointerGet
;	AOP_STK for _mus_update4_sloc1_1_0
;	AOP_STK for _mus_update4_sloc0_1_0
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	inc	hl
;	genAnd
;	AOP_STK for _mus_update4_sloc0_1_0
;	AOP_STK for _mus_update4_sloc1_1_0
	ld      (hl),a
; Removed redundent load
	and	a,#0x77
	dec	hl
	dec	hl
	ld	(hl),a
;	genLeftShift
;	AOP_STK for _mus_update4_note_1_1
;	AOP_STK for _mus_update4_sloc0_1_0
	lda	hl,4(sp)
	ld	a,(hl)
	sla	a
	rl	a
	rl	a
	and	a,#0xF8
	dec	hl
	dec	hl
;	genOr
;	AOP_STK for _mus_update4_sloc1_1_0
;	AOP_STK for _mus_update4_sloc0_1_0
	ld      (hl-),a
	dec	hl
	ld	a,(hl+)
	inc	hl
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 377
;	genGoto
	jp	00135$
;	music.c 379
;	genLabel
00113$:
;	genAssign
;	AOP_HL for _mus_data4
;	AOP_HL for _mus_loop4
	ld	hl,#_mus_data4
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_loop4
	ld	(hl+),a
	ld	(hl),e
;	music.c 380
;	genGoto
	jp	00135$
;	music.c 382
;	genLabel
00114$:
;	genAssign
;	AOP_HL for _mus_data4
;	AOP_HL for _mus_rep4
	ld	hl,#_mus_data4
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_rep4
	ld	(hl+),a
	ld	(hl),e
;	music.c 383
;	genGoto
	jp	00135$
;	music.c 385
;	genLabel
00115$:
;	genAssign
;	AOP_HL for _mus_data4
	ld	hl,#_mus_data4
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data4
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00179$
	inc	hl
	inc	(hl)
00179$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update4_note_1_1
	lda	hl,4(sp)
	ld	(hl),c
;	music.c 386
;	genIfx
;	AOP_HL for _mus_repeats4
	xor	a,a
	ld	hl,#_mus_repeats4
	or	a,(hl)
	jp	nz,00117$
;	music.c 387
;	genAssign
;	AOP_STK for _mus_update4_note_1_1
;	AOP_HL for _mus_repeats4
	lda	hl,4(sp)
	ld	a,(hl)
	ld	hl,#_mus_repeats4
	ld	(hl),a
;	music.c 388
;	genAssign
;	AOP_HL for _mus_rep4
;	AOP_HL for _mus_data4
	ld	hl,#_mus_rep4
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data4
	ld	(hl+),a
	ld	(hl),e
;	genLabel
00117$:
;	music.c 390
;	genMinus
;	AOP_HL for _mus_repeats4
	ld	hl,#_mus_repeats4
	dec	(hl)
;	music.c 391
;	genIfx
;	AOP_HL for _mus_repeats4
	xor	a,a
	or	a,(hl)
	jp	z,00135$
;	music.c 392
;	genAssign
;	AOP_HL for _mus_rep4
;	AOP_HL for _mus_data4
	ld	hl,#_mus_rep4
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data4
	ld	(hl+),a
	ld	(hl),e
;	music.c 394
;	genGoto
	jp	00135$
;	music.c 396
;	genLabel
00120$:
;	genAssign
;	AOP_HL for _mus_loop4
;	AOP_HL for _mus_data4
	ld	hl,#_mus_loop4
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data4
	ld	(hl+),a
	ld	(hl),e
;	music.c 397
;	genAssign
;	AOP_HL for _mus_data4
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPointerGet
	ld	a,(bc)
;	genCmpEq
; genCmpEq: left 1, right 1, result 0
	ld	c,a
	cp	a,#0x1C
	jp	nz,00135$
	jr	00181$
00180$:
	jp	00135$
00181$:
;	music.c 398
;	genAssign
;	AOP_HL for _mus_wait4
	ld	hl,#_mus_wait4
	ld	(hl),#0xFF
;	music.c 399
;	genRet
	jp	00137$
;	music.c 408
;	genLabel
00126$:
;	music.c 403
;	genAnd
;	AOP_STK for _mus_update4_note_1_1
	lda	hl,4(sp)
	ld	a,(hl)
	and	a,#0x80
	jr	nz,00182$
	jp	00124$
00182$:
;	music.c 404
;	genXor
;	AOP_STK for _mus_update4_note_1_1
	ld	a,#0x80
	lda	hl,4(sp)
	xor	a,(hl)
	ld	(hl),a
;	music.c 405
;	genAssign
;	AOP_HL for _mus_data4
	ld	hl,#_mus_data4
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
;	genPlus
;	AOP_HL for _mus_data4
;	genPlusIncr
	dec	hl
	inc	(hl)
	jr	nz,00183$
	inc	hl
	inc	(hl)
00183$:
;	genPointerGet
;	AOP_HL for _mus_wait4
	ld	a,(bc)
	ld	hl,#_mus_wait4
	ld	(hl),a
;	genGoto
	jp	00125$
;	genLabel
00124$:
;	music.c 407
;	genAssign
;	AOP_HL for _mus_length4
;	AOP_HL for _mus_wait4
	ld	hl,#_mus_length4
	ld	a,(hl)
	ld	hl,#_mus_wait4
	ld	(hl),a
;	genLabel
00125$:
;	music.c 409
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x0D
	jp	nz,00131$
	jr	00185$
00184$:
	jp	00131$
00185$:
;	music.c 410
;	genRet
	jp	00137$
;	genLabel
00131$:
;	music.c 411
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x0C
	jp	nz,00128$
	jr	00187$
00186$:
	jp	00128$
00187$:
;	music.c 412
;	genAssign
;	AOP_STK for _mus_update4_frequency_1_1
	lda	hl,3(sp)
	ld	(hl),#0x00
;	music.c 413
;	genAssign
	ld	b,#0x21
	ld	c,#0xFF
;	genAssign (pointer)
	ld	e,b
	ld	d,c
	ld	a,#0x00
	ld	(de),a
;	genGoto
	jp	00132$
;	genLabel
00128$:
;	music.c 415
;	genMinus
;	AOP_HL for _mus_octave4
	ld	hl,#_mus_octave4
	ld	a,(hl)
	add	a,#0xFF
;	genLeftShift
	ld	c,a
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
;	genPlus
;	AOP_STK for _mus_update4_note_1_1
;	Can't optimise plus by inc, falling back to the normal way
	ld	c,a
	lda	hl,4(sp)
	add	a,(hl)
	ld	c,a
;	genPlus
;	Can't optimise plus by inc, falling back to the normal way
	ld	a,#<_noise_freq
	add	a,c
	ld	c,a
	ld	a,#>_noise_freq
	adc	a,#0x00
	ld	b,a
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update4_frequency_1_1
	dec	hl
	ld	(hl),c
;	music.c 416
;	genAssign
	ld	bc,#0xFF21
;	genLeftShift
;	AOP_HL for _mus_volume4
;	AOP_STK for _mus_update4_sloc1_1_0
	ld	hl,#_mus_volume4
	ld	a,(hl)
	sla	a
	rl	a
	rl	a
	rl	a
	and	a,#0xF0
	lda	hl,0(sp)
;	genOr
;	AOP_STK for _mus_update4_sloc1_1_0
;	AOP_HL for _mus_env4
	ld      (hl),a
; Removed redundent load
	ld	hl,#_mus_env4
	or	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	genLabel
00132$:
;	music.c 418
;	genAssign
	ld	bc,#0xFF22
;	genAssign (pointer)
;	AOP_STK for _mus_update4_frequency_1_1
	lda	hl,3(sp)
	ld	a,(hl)
	ld	(bc),a
;	music.c 419
;	genAssign
	ld	bc,#0xFF23
;	genAssign (pointer)
	ld	a,#0x80
	ld	(bc),a
;	music.c 420
;	genRet
;	music.c 421
;	genLabel
00137$:
;	genEndFunction
	lda	sp,5(sp)
	ret
___mus_update4_end:
	.area _CODE
