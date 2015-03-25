;--------------------------------------------------------
; File Created by SDCC : FreeWare ANSI-C Compiler
; Version 2.3.1 Wed Mar 25 21:17:34 2015

;--------------------------------------------------------
	.module lcc6500
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mus_data4
	.globl _mus_data3
	.globl _mus_data2
	.globl _mus_data1
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
	.globl _mus_loop4
	.globl _mus_loop3
	.globl _mus_loop2
	.globl _mus_loop1
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
_mus_loop1::
	.ds 2
_mus_loop2::
	.ds 2
_mus_loop3::
	.ds 2
_mus_loop4::
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
_mus_data1::
	.ds 2
_mus_data2::
	.ds 2
_mus_data3::
	.ds 2
_mus_data4::
	.ds 2
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
;	music.c 17
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_init
; ---------------------------------
___mus_init_start:
_mus_init:
	
;	music.c 18
;	genAssign
	ld	bc,#0xFF26
;	genAssign (pointer)
	ld	a,#0x80
	ld	(bc),a
;	music.c 19
;	genAssign
	ld	bc,#0xFF25
;	genAssign (pointer)
	ld	a,#0xFF
	ld	(bc),a
;	music.c 20
;	genAssign
	ld	bc,#0xFF24
;	genAssign (pointer)
	ld	a,#0xFF
	ld	(bc),a
;	music.c 23
;	genAssign
	ld	bc,#0xFF1A
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	music.c 24
;	genAssign
	ld	bc,#0xFF1C
;	genAssign (pointer)
	ld	a,#0x40
	ld	(bc),a
;	music.c 27
;	genAssign
	ld	bc,#0xFF07
;	genAssign (pointer)
	ld	a,#0x04
	ld	(bc),a
;	music.c 28
;	genAssign
	ld	bc,#0xFF06
;	genAssign (pointer)
	ld	a,#0xCC
	ld	(bc),a
;	music.c 31
;	genAssign
;	AOP_STK for 
;	AOP_HL for _mus_song
	lda	hl,2(sp)
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_song
	ld	(hl+),a
	ld	(hl),e
;	music.c 33
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
;	music.c 34
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
;	music.c 35
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
;	music.c 36
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
;	music.c 38
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
;	music.c 39
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
;	music.c 40
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
;	music.c 41
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
;	music.c 42
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
	.db #0x97
	.db #0x87
	.db #0x77
	.db #0x67
	.db #0x57
	.db #0x47
	.db #0x37
	.db #0x27
	.db #0x17
	.db #0x07
	.db #0x96
	.db #0x86
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x76
	.db #0x66
	.db #0x56
	.db #0x46
	.db #0x36
	.db #0x26
	.db #0x16
	.db #0x06
	.db #0xA5
	.db #0x95
	.db #0x85
	.db #0x75
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x65
	.db #0x55
	.db #0x45
	.db #0x35
	.db #0x25
	.db #0x15
	.db #0x05
	.db #0xA4
	.db #0x94
	.db #0x84
	.db #0x74
	.db #0x64
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x54
	.db #0x44
	.db #0x34
	.db #0x24
	.db #0x14
	.db #0x04
	.db #0xA3
	.db #0x93
	.db #0x83
	.db #0x73
	.db #0x63
	.db #0x53
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x43
	.db #0x33
	.db #0x23
	.db #0x13
	.db #0x03
	.db #0xB2
	.db #0xA2
	.db #0x92
	.db #0x82
	.db #0x72
	.db #0x62
	.db #0x52
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x42
	.db #0x32
	.db #0x22
	.db #0x12
	.db #0x02
	.db #0xC1
	.db #0xB1
	.db #0xA1
	.db #0x91
	.db #0x81
	.db #0x71
	.db #0x61
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x51
	.db #0x41
	.db #0x31
	.db #0x21
	.db #0x11
	.db #0x01
	.db #0xD0
	.db #0xC0
	.db #0xB0
	.db #0xA0
	.db #0x90
	.db #0x80
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x00
	.db #0x70
	.db #0x60
	.db #0x50
	.db #0x40
	.db #0x30
	.db #0x20
	.db #0x10
	.db #0x00
;	music.c 45
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_update
; ---------------------------------
___mus_update_start:
_mus_update:
	
;	music.c 46
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_mus_update1
;	music.c 47
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_mus_update2
;	music.c 48
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_mus_update3
;	music.c 49
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_mus_update4
;	genLabel
00101$:
;	genEndFunction
	
	ret
___mus_update_end:
;	music.c 52
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_update1
; ---------------------------------
___mus_update1_start:
_mus_update1:
	lda	sp,-8(sp)
;	music.c 56
;	genIfx
;	AOP_HL for _mus_wait1
	xor	a,a
	ld	hl,#_mus_wait1
	or	a,(hl)
	jp	z,00131$
;	music.c 57
;	genMinus
;	AOP_HL for _mus_wait1
	dec	(hl)
;	music.c 58
;	genIfx
;	AOP_HL for _mus_wait1
	xor	a,a
	or	a,(hl)
;	genRet
;	music.c 61
;	genLabel
	jp	nz,00133$
00131$:
;	music.c 62
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
	jr	nz,00154$
	inc	hl
	inc	(hl)
00154$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update1_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 63
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	ld	a,(hl)
	cp	a,#0x0E
	jp	z,00105$
00155$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0F
	jp	z,00106$
00156$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x10
	jp	z,00107$
00157$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x11
	jp	z,00108$
00158$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x12
	jp	z,00109$
00159$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x13
	jp	z,00110$
00160$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x14
	jp	z,00111$
00161$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x15
	jp	z,00112$
00162$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x16
	jp	z,00113$
00163$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x17
	jp	z,00114$
00164$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x19
	jp	z,00115$
00165$:
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1A
	jp	z,00116$
00166$:
;	genGoto
	jp	00122$
;	music.c 65
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
	jr	nz,00167$
	inc	hl
	inc	(hl)
00167$:
;	genPointerGet
;	AOP_HL for _mus_length1
	ld	e,b
	ld	d,c
	ld	a,(de)
	ld	hl,#_mus_length1
	ld	(hl),a
;	music.c 66
;	genGoto
	jp	00131$
;	music.c 68
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
	jr	nz,00168$
	inc	hl
	inc	(hl)
00168$:
;	genPointerGet
;	AOP_HL for _mus_octave1
	ld	a,(bc)
	ld	hl,#_mus_octave1
	ld	(hl),a
;	music.c 69
;	genGoto
	jp	00131$
;	music.c 71
;	genLabel
00107$:
;	genPlus
;	AOP_HL for _mus_octave1
;	genPlusIncr
	ld	hl,#_mus_octave1
	inc	(hl)
;	music.c 72
;	genGoto
	jp	00131$
;	music.c 74
;	genLabel
00108$:
;	genMinus
;	AOP_HL for _mus_octave1
	ld	hl,#_mus_octave1
	dec	(hl)
;	music.c 75
;	genGoto
	jp	00131$
;	music.c 77
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
	jr	nz,00169$
	inc	hl
	inc	(hl)
00169$:
;	genPointerGet
;	AOP_HL for _mus_volume1
	ld	a,(bc)
	ld	hl,#_mus_volume1
	ld	(hl),a
;	music.c 78
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
;	music.c 79
;	genGoto
	jp	00131$
;	music.c 81
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
	jr	nz,00170$
	inc	hl
	inc	(hl)
00170$:
;	genPointerGet
;	AOP_HL for _mus_env1
	ld	a,(bc)
	ld	hl,#_mus_env1
	ld	(hl),a
;	music.c 82
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
;	music.c 83
;	genGoto
	jp	00131$
;	music.c 85
;	genLabel
00111$:
;	genPlus
;	AOP_HL for _mus_data1
;	genPlusIncr
	ld	hl,#_mus_data1
	inc	(hl)
	jr	nz,00171$
	inc	hl
	inc	(hl)
00171$:
;	music.c 86
;	genGoto
	jp	00131$
;	music.c 88
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
	jr	nz,00172$
	inc	hl
	inc	(hl)
00172$:
;	genPointerGet
;	AOP_STK for _mus_update1_sloc1_1_0
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 89
;	genGoto
	jp	00131$
;	music.c 91
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
	jr	nz,00173$
	inc	hl
	inc	(hl)
00173$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update1_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 92
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
;	music.c 93
;	genGoto
	jp	00131$
;	music.c 95
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
	jr	nz,00174$
	inc	hl
	inc	(hl)
00174$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update1_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 96
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
;	music.c 97
;	genGoto
	jp	00131$
;	music.c 99
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
;	music.c 100
;	genGoto
	jp	00131$
;	music.c 102
;	genLabel
00116$:
;	genAssign
;	AOP_HL for _mus_loop1
;	AOP_HL for _mus_data1
	ld	hl,#_mus_loop1
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data1
	ld	(hl+),a
	ld	(hl),e
;	music.c 103
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
	cp	a,#0x1A
	jp	nz,00131$
	jr	00176$
00175$:
	jp	00131$
00176$:
;	music.c 104
;	genAssign
;	AOP_HL for _mus_wait2
	ld	hl,#_mus_wait2
	ld	(hl),#0xFF
;	music.c 105
;	genRet
	jp	00133$
;	music.c 115
;	genLabel
00122$:
;	music.c 109
;	genAnd
;	AOP_STK for _mus_update1_note_1_1
	lda	hl,7(sp)
	ld	a,(hl)
	and	a,#0x80
	jr	nz,00177$
	jp	00120$
00177$:
;	music.c 110
;	genXor
;	AOP_STK for _mus_update1_note_1_1
	ld	a,#0x80
	lda	hl,7(sp)
	xor	a,(hl)
	ld	(hl),a
;	music.c 111
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
	jr	nz,00178$
	inc	hl
	inc	(hl)
00178$:
;	genPointerGet
;	AOP_HL for _mus_wait1
	ld	a,(bc)
	ld	hl,#_mus_wait1
	ld	(hl),a
;	genGoto
	jp	00121$
;	genLabel
00120$:
;	music.c 114
;	genAssign
;	AOP_HL for _mus_length1
;	AOP_HL for _mus_wait1
	ld	hl,#_mus_length1
	ld	a,(hl)
	ld	hl,#_mus_wait1
	ld	(hl),a
;	genLabel
00121$:
;	music.c 116
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0D
	jp	nz,00127$
	jr	00180$
00179$:
	jp	00127$
00180$:
;	music.c 117
;	genRet
	jp	00133$
;	genLabel
00127$:
;	music.c 118
;	genCmpEq
;	AOP_STK for _mus_update1_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0C
	jp	nz,00124$
	jr	00182$
00181$:
	jp	00124$
00182$:
;	music.c 119
;	genAssign
;	AOP_STK for _mus_update1_frequency_1_1
	lda	hl,5(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;	music.c 120
;	genAssign
	ld	bc,#0xFF12
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	genGoto
	jp	00128$
;	genLabel
00124$:
;	music.c 122
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
;	music.c 123
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
00128$:
;	music.c 125
;	genAssign
	ld	bc,#0xFF13
;	genCast
;	AOP_STK for _mus_update1_frequency_1_1
	lda	hl,5(sp)
	ld	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 126
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
;	music.c 127
;	genRet
;	music.c 128
;	genLabel
00133$:
;	genEndFunction
	lda	sp,8(sp)
	ret
___mus_update1_end:
;	music.c 132
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_update2
; ---------------------------------
___mus_update2_start:
_mus_update2:
	lda	sp,-8(sp)
;	music.c 136
;	genIfx
;	AOP_HL for _mus_wait2
	xor	a,a
	ld	hl,#_mus_wait2
	or	a,(hl)
	jp	z,00131$
;	music.c 137
;	genMinus
;	AOP_HL for _mus_wait2
	dec	(hl)
;	music.c 138
;	genIfx
;	AOP_HL for _mus_wait2
	xor	a,a
	or	a,(hl)
;	genRet
;	music.c 141
;	genLabel
	jp	nz,00133$
00131$:
;	music.c 142
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
	jr	nz,00154$
	inc	hl
	inc	(hl)
00154$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update2_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 143
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	ld	a,(hl)
	cp	a,#0x0E
	jp	z,00105$
00155$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0F
	jp	z,00106$
00156$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x10
	jp	z,00107$
00157$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x11
	jp	z,00108$
00158$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x12
	jp	z,00109$
00159$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x13
	jp	z,00110$
00160$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x14
	jp	z,00111$
00161$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x15
	jp	z,00112$
00162$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x16
	jp	z,00113$
00163$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x17
	jp	z,00114$
00164$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x19
	jp	z,00115$
00165$:
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1A
	jp	z,00116$
00166$:
;	genGoto
	jp	00122$
;	music.c 145
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
	jr	nz,00167$
	inc	hl
	inc	(hl)
00167$:
;	genPointerGet
;	AOP_HL for _mus_length2
	ld	e,b
	ld	d,c
	ld	a,(de)
	ld	hl,#_mus_length2
	ld	(hl),a
;	music.c 146
;	genGoto
	jp	00131$
;	music.c 148
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
	jr	nz,00168$
	inc	hl
	inc	(hl)
00168$:
;	genPointerGet
;	AOP_HL for _mus_octave2
	ld	a,(bc)
	ld	hl,#_mus_octave2
	ld	(hl),a
;	music.c 149
;	genGoto
	jp	00131$
;	music.c 151
;	genLabel
00107$:
;	genPlus
;	AOP_HL for _mus_octave2
;	genPlusIncr
	ld	hl,#_mus_octave2
	inc	(hl)
;	music.c 152
;	genGoto
	jp	00131$
;	music.c 154
;	genLabel
00108$:
;	genMinus
;	AOP_HL for _mus_octave2
	ld	hl,#_mus_octave2
	dec	(hl)
;	music.c 155
;	genGoto
	jp	00131$
;	music.c 157
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
	jr	nz,00169$
	inc	hl
	inc	(hl)
00169$:
;	genPointerGet
;	AOP_HL for _mus_volume2
	ld	a,(bc)
	ld	hl,#_mus_volume2
	ld	(hl),a
;	music.c 158
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
;	music.c 159
;	genGoto
	jp	00131$
;	music.c 161
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
	jr	nz,00170$
	inc	hl
	inc	(hl)
00170$:
;	genPointerGet
;	AOP_HL for _mus_env2
	ld	a,(bc)
	ld	hl,#_mus_env2
	ld	(hl),a
;	music.c 162
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
;	music.c 163
;	genGoto
	jp	00131$
;	music.c 165
;	genLabel
00111$:
;	genPlus
;	AOP_HL for _mus_data2
;	genPlusIncr
	ld	hl,#_mus_data2
	inc	(hl)
	jr	nz,00171$
	inc	hl
	inc	(hl)
00171$:
;	music.c 166
;	genGoto
	jp	00131$
;	music.c 168
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
	jr	nz,00172$
	inc	hl
	inc	(hl)
00172$:
;	genPointerGet
;	AOP_STK for _mus_update2_sloc1_1_0
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 169
;	genGoto
	jp	00131$
;	music.c 171
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
	jr	nz,00173$
	inc	hl
	inc	(hl)
00173$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update2_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 172
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
;	music.c 173
;	genGoto
	jp	00131$
;	music.c 175
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
	jr	nz,00174$
	inc	hl
	inc	(hl)
00174$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update2_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 176
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
;	music.c 177
;	genGoto
	jp	00131$
;	music.c 179
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
;	music.c 180
;	genGoto
	jp	00131$
;	music.c 182
;	genLabel
00116$:
;	genAssign
;	AOP_HL for _mus_loop2
;	AOP_HL for _mus_data2
	ld	hl,#_mus_loop2
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data2
	ld	(hl+),a
	ld	(hl),e
;	music.c 183
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
	cp	a,#0x1A
	jp	nz,00131$
	jr	00176$
00175$:
	jp	00131$
00176$:
;	music.c 184
;	genAssign
;	AOP_HL for _mus_wait2
	ld	hl,#_mus_wait2
	ld	(hl),#0xFF
;	music.c 185
;	genRet
	jp	00133$
;	music.c 195
;	genLabel
00122$:
;	music.c 189
;	genAnd
;	AOP_STK for _mus_update2_note_1_1
	lda	hl,7(sp)
	ld	a,(hl)
	and	a,#0x80
	jr	nz,00177$
	jp	00120$
00177$:
;	music.c 190
;	genXor
;	AOP_STK for _mus_update2_note_1_1
	ld	a,#0x80
	lda	hl,7(sp)
	xor	a,(hl)
	ld	(hl),a
;	music.c 191
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
	jr	nz,00178$
	inc	hl
	inc	(hl)
00178$:
;	genPointerGet
;	AOP_HL for _mus_wait2
	ld	a,(bc)
	ld	hl,#_mus_wait2
	ld	(hl),a
;	genGoto
	jp	00121$
;	genLabel
00120$:
;	music.c 194
;	genAssign
;	AOP_HL for _mus_length2
;	AOP_HL for _mus_wait2
	ld	hl,#_mus_length2
	ld	a,(hl)
	ld	hl,#_mus_wait2
	ld	(hl),a
;	genLabel
00121$:
;	music.c 196
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0D
	jp	nz,00127$
	jr	00180$
00179$:
	jp	00127$
00180$:
;	music.c 197
;	genRet
	jp	00133$
;	genLabel
00127$:
;	music.c 198
;	genCmpEq
;	AOP_STK for _mus_update2_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0C
	jp	nz,00124$
	jr	00182$
00181$:
	jp	00124$
00182$:
;	music.c 199
;	genAssign
;	AOP_STK for _mus_update2_frequency_1_1
	lda	hl,5(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;	music.c 200
;	genAssign
	ld	bc,#0xFF17
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	genGoto
	jp	00128$
;	genLabel
00124$:
;	music.c 202
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
;	music.c 203
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
00128$:
;	music.c 205
;	genAssign
	ld	bc,#0xFF18
;	genCast
;	AOP_STK for _mus_update2_frequency_1_1
	lda	hl,5(sp)
	ld	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 206
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
;	music.c 207
;	genRet
;	music.c 208
;	genLabel
00133$:
;	genEndFunction
	lda	sp,8(sp)
	ret
___mus_update2_end:
;	music.c 212
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_update3
; ---------------------------------
___mus_update3_start:
_mus_update3:
	lda	sp,-8(sp)
;	music.c 216
;	genIfx
;	AOP_HL for _mus_wait3
	xor	a,a
	ld	hl,#_mus_wait3
	or	a,(hl)
	jp	z,00131$
;	music.c 217
;	genMinus
;	AOP_HL for _mus_wait3
	dec	(hl)
;	music.c 218
;	genIfx
;	AOP_HL for _mus_wait3
	xor	a,a
	or	a,(hl)
;	genRet
;	music.c 221
;	genLabel
	jp	nz,00133$
00131$:
;	music.c 222
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
	jr	nz,00154$
	inc	hl
	inc	(hl)
00154$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update3_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 223
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	ld	a,(hl)
	cp	a,#0x0E
	jp	z,00105$
00155$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0F
	jp	z,00106$
00156$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x10
	jp	z,00107$
00157$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x11
	jp	z,00108$
00158$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x12
	jp	z,00109$
00159$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x13
	jp	z,00110$
00160$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x14
	jp	z,00111$
00161$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x15
	jp	z,00112$
00162$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x16
	jp	z,00113$
00163$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x17
	jp	z,00114$
00164$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x19
	jp	z,00115$
00165$:
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x1A
	jp	z,00116$
00166$:
;	genGoto
	jp	00122$
;	music.c 225
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
	jr	nz,00167$
	inc	hl
	inc	(hl)
00167$:
;	genPointerGet
;	AOP_HL for _mus_length3
	ld	e,b
	ld	d,c
	ld	a,(de)
	ld	hl,#_mus_length3
	ld	(hl),a
;	music.c 226
;	genGoto
	jp	00131$
;	music.c 228
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
	jr	nz,00168$
	inc	hl
	inc	(hl)
00168$:
;	genPointerGet
;	AOP_HL for _mus_octave3
	ld	a,(bc)
	ld	hl,#_mus_octave3
	ld	(hl),a
;	music.c 229
;	genGoto
	jp	00131$
;	music.c 231
;	genLabel
00107$:
;	genPlus
;	AOP_HL for _mus_octave3
;	genPlusIncr
	ld	hl,#_mus_octave3
	inc	(hl)
;	music.c 232
;	genGoto
	jp	00131$
;	music.c 234
;	genLabel
00108$:
;	genMinus
;	AOP_HL for _mus_octave3
	ld	hl,#_mus_octave3
	dec	(hl)
;	music.c 235
;	genGoto
	jp	00131$
;	music.c 237
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
	jr	nz,00169$
	inc	hl
	inc	(hl)
00169$:
;	genPointerGet
;	AOP_HL for _mus_volume3
	ld	a,(bc)
	ld	hl,#_mus_volume3
	ld	(hl),a
;	music.c 238
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
;	music.c 239
;	genGoto
	jp	00131$
;	music.c 241
;	genLabel
00110$:
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	ld	hl,#_mus_data3
	inc	(hl)
	jr	nz,00170$
	inc	hl
	inc	(hl)
00170$:
;	music.c 242
;	genGoto
	jp	00131$
;	music.c 244
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
	jr	nz,00171$
	inc	hl
	inc	(hl)
00171$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update3_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 245
;	genAssign
	ld	bc,#0xFF1A
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	music.c 246
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
;	music.c 247
;	genAssign
	ld	bc,#0xFF1A
;	genAssign (pointer)
	ld	a,#0x80
	ld	(bc),a
;	music.c 248
;	genGoto
	jp	00131$
;	music.c 250
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
	jr	nz,00172$
	inc	hl
	inc	(hl)
00172$:
;	genPointerGet
;	AOP_STK for _mus_update3_sloc1_1_0
	lda	hl,2(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 251
;	genGoto
	jp	00131$
;	music.c 253
;	genLabel
00113$:
;	genPlus
;	AOP_HL for _mus_data3
;	genPlusIncr
	ld	hl,#_mus_data3
	inc	(hl)
	jr	nz,00173$
	inc	hl
	inc	(hl)
00173$:
;	music.c 254
;	genGoto
	jp	00131$
;	music.c 256
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
	jr	nz,00174$
	inc	hl
	inc	(hl)
00174$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update3_note_1_1
	lda	hl,7(sp)
	ld	(hl),c
;	music.c 257
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
;	music.c 258
;	genGoto
	jp	00131$
;	music.c 260
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
;	music.c 261
;	genGoto
	jp	00131$
;	music.c 263
;	genLabel
00116$:
;	genAssign
;	AOP_HL for _mus_loop3
;	AOP_HL for _mus_data3
	ld	hl,#_mus_loop3
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data3
	ld	(hl+),a
	ld	(hl),e
;	music.c 264
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
	cp	a,#0x1A
	jp	nz,00131$
	jr	00176$
00175$:
	jp	00131$
00176$:
;	music.c 265
;	genAssign
;	AOP_HL for _mus_wait3
	ld	hl,#_mus_wait3
	ld	(hl),#0xFF
;	music.c 266
;	genRet
	jp	00133$
;	music.c 275
;	genLabel
00122$:
;	music.c 270
;	genAnd
;	AOP_STK for _mus_update3_note_1_1
	lda	hl,7(sp)
	ld	a,(hl)
	and	a,#0x80
	jr	nz,00177$
	jp	00120$
00177$:
;	music.c 271
;	genXor
;	AOP_STK for _mus_update3_note_1_1
	ld	a,#0x80
	lda	hl,7(sp)
	xor	a,(hl)
	ld	(hl),a
;	music.c 272
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
	jr	nz,00178$
	inc	hl
	inc	(hl)
00178$:
;	genPointerGet
;	AOP_HL for _mus_wait3
	ld	a,(bc)
	ld	hl,#_mus_wait3
	ld	(hl),a
;	genGoto
	jp	00121$
;	genLabel
00120$:
;	music.c 274
;	genAssign
;	AOP_HL for _mus_length3
;	AOP_HL for _mus_wait3
	ld	hl,#_mus_length3
	ld	a,(hl)
	ld	hl,#_mus_wait3
	ld	(hl),a
;	genLabel
00121$:
;	music.c 276
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0D
	jp	nz,00127$
	jr	00180$
00179$:
	jp	00127$
00180$:
;	music.c 277
;	genRet
	jp	00133$
;	genLabel
00127$:
;	music.c 278
;	genCmpEq
;	AOP_STK for _mus_update3_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,7(sp)
	ld	a,(hl)
	cp	a,#0x0C
	jp	nz,00124$
	jr	00182$
00181$:
	jp	00124$
00182$:
;	music.c 279
;	genAssign
;	AOP_STK for _mus_update3_frequency_1_1
	lda	hl,5(sp)
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x00
;	music.c 280
;	genAssign
	ld	bc,#0xFF1C
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	genGoto
	jp	00128$
;	genLabel
00124$:
;	music.c 282
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
;	music.c 283
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
00128$:
;	music.c 285
;	genAssign
	ld	bc,#0xFF1A
;	genAssign (pointer)
	ld	a,#0x00
	ld	(bc),a
;	music.c 286
;	genAssign
	ld	bc,#0xFF1A
;	genAssign (pointer)
	ld	a,#0x80
	ld	(bc),a
;	music.c 287
;	genAssign
	ld	bc,#0xFF1D
;	genCast
;	AOP_STK for _mus_update3_frequency_1_1
	lda	hl,5(sp)
	ld	a,(hl)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 288
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
;	music.c 289
;	genRet
;	music.c 290
;	genLabel
00133$:
;	genEndFunction
	lda	sp,8(sp)
	ret
___mus_update3_end:
;	music.c 294
;	genLabel
;	genFunction
;	---------------------------------
; Function mus_update4
; ---------------------------------
___mus_update4_start:
_mus_update4:
	lda	sp,-5(sp)
;	music.c 297
;	genIfx
;	AOP_HL for _mus_wait4
	xor	a,a
	ld	hl,#_mus_wait4
	or	a,(hl)
	jp	z,00129$
;	music.c 298
;	genMinus
;	AOP_HL for _mus_wait4
	dec	(hl)
;	music.c 299
;	genIfx
;	AOP_HL for _mus_wait4
	xor	a,a
	or	a,(hl)
;	genRet
;	music.c 302
;	genLabel
	jp	nz,00131$
00129$:
;	music.c 303
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
	jr	nz,00150$
	inc	hl
	inc	(hl)
00150$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update4_note_1_1
	lda	hl,4(sp)
	ld	(hl),c
;	music.c 304
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	ld	a,(hl)
	cp	a,#0x0E
	jp	z,00105$
00151$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x0F
	jp	z,00106$
00152$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x10
	jp	z,00107$
00153$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x11
	jp	z,00108$
00154$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x12
	jp	z,00109$
00155$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x13
	jp	z,00110$
00156$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x15
	jp	z,00111$
00157$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x17
	jp	z,00112$
00158$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x19
	jp	z,00113$
00159$:
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x1A
	jp	z,00114$
00160$:
;	genGoto
	jp	00120$
;	music.c 306
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
	jr	nz,00161$
	inc	hl
	inc	(hl)
00161$:
;	genPointerGet
;	AOP_HL for _mus_length4
	ld	e,b
	ld	d,c
	ld	a,(de)
	ld	hl,#_mus_length4
	ld	(hl),a
;	music.c 307
;	genGoto
	jp	00129$
;	music.c 309
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
	jr	nz,00162$
	inc	hl
	inc	(hl)
00162$:
;	genPointerGet
;	AOP_HL for _mus_octave4
	ld	a,(bc)
	ld	hl,#_mus_octave4
	ld	(hl),a
;	music.c 310
;	genGoto
	jp	00129$
;	music.c 312
;	genLabel
00107$:
;	genPlus
;	AOP_HL for _mus_octave4
;	genPlusIncr
	ld	hl,#_mus_octave4
	inc	(hl)
;	music.c 313
;	genGoto
	jp	00129$
;	music.c 315
;	genLabel
00108$:
;	genMinus
;	AOP_HL for _mus_octave4
	ld	hl,#_mus_octave4
	dec	(hl)
;	music.c 316
;	genGoto
	jp	00129$
;	music.c 318
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
	jr	nz,00163$
	inc	hl
	inc	(hl)
00163$:
;	genPointerGet
;	AOP_HL for _mus_volume4
	ld	a,(bc)
	ld	hl,#_mus_volume4
	ld	(hl),a
;	music.c 319
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
;	music.c 320
;	genGoto
	jp	00129$
;	music.c 322
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
	jr	nz,00164$
	inc	hl
	inc	(hl)
00164$:
;	genPointerGet
;	AOP_HL for _mus_env4
	ld	a,(bc)
	ld	hl,#_mus_env4
	ld	(hl),a
;	music.c 323
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
;	music.c 324
;	genGoto
	jp	00129$
;	music.c 326
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
	jr	nz,00165$
	inc	hl
	inc	(hl)
00165$:
;	genPointerGet
;	AOP_STK for _mus_update4_sloc1_1_0
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
;	genAssign (pointer)
	ld	(bc),a
;	music.c 327
;	genGoto
	jp	00129$
;	music.c 329
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
	jr	nz,00166$
	inc	hl
	inc	(hl)
00166$:
;	genPointerGet
	ld	a,(bc)
	ld	c,a
;	genAssign
;	AOP_STK for _mus_update4_note_1_1
	lda	hl,4(sp)
	ld	(hl),c
;	music.c 330
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
;	music.c 331
;	genGoto
	jp	00129$
;	music.c 333
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
;	music.c 334
;	genGoto
	jp	00129$
;	music.c 336
;	genLabel
00114$:
;	genAssign
;	AOP_HL for _mus_loop4
;	AOP_HL for _mus_data4
	ld	hl,#_mus_loop4
	ld	a,(hl+)
	ld	e,(hl)
	ld	hl,#_mus_data4
	ld	(hl+),a
	ld	(hl),e
;	music.c 337
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
	cp	a,#0x1A
	jp	nz,00129$
	jr	00168$
00167$:
	jp	00129$
00168$:
;	music.c 338
;	genAssign
;	AOP_HL for _mus_wait4
	ld	hl,#_mus_wait4
	ld	(hl),#0xFF
;	music.c 339
;	genRet
	jp	00131$
;	music.c 348
;	genLabel
00120$:
;	music.c 343
;	genAnd
;	AOP_STK for _mus_update4_note_1_1
	lda	hl,4(sp)
	ld	a,(hl)
	and	a,#0x80
	jr	nz,00169$
	jp	00118$
00169$:
;	music.c 344
;	genXor
;	AOP_STK for _mus_update4_note_1_1
	ld	a,#0x80
	lda	hl,4(sp)
	xor	a,(hl)
	ld	(hl),a
;	music.c 345
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
	jr	nz,00170$
	inc	hl
	inc	(hl)
00170$:
;	genPointerGet
;	AOP_HL for _mus_wait4
	ld	a,(bc)
	ld	hl,#_mus_wait4
	ld	(hl),a
;	genGoto
	jp	00119$
;	genLabel
00118$:
;	music.c 347
;	genAssign
;	AOP_HL for _mus_length4
;	AOP_HL for _mus_wait4
	ld	hl,#_mus_length4
	ld	a,(hl)
	ld	hl,#_mus_wait4
	ld	(hl),a
;	genLabel
00119$:
;	music.c 349
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x0D
	jp	nz,00125$
	jr	00172$
00171$:
	jp	00125$
00172$:
;	music.c 350
;	genRet
	jp	00131$
;	genLabel
00125$:
;	music.c 351
;	genCmpEq
;	AOP_STK for _mus_update4_note_1_1
; genCmpEq: left 1, right 1, result 0
	lda	hl,4(sp)
	ld	a,(hl)
	cp	a,#0x0C
	jp	nz,00122$
	jr	00174$
00173$:
	jp	00122$
00174$:
;	music.c 352
;	genAssign
;	AOP_STK for _mus_update4_frequency_1_1
	lda	hl,3(sp)
	ld	(hl),#0x00
;	music.c 353
;	genAssign
	ld	b,#0x21
	ld	c,#0xFF
;	genAssign (pointer)
	ld	e,b
	ld	d,c
	ld	a,#0x00
	ld	(de),a
;	genGoto
	jp	00126$
;	genLabel
00122$:
;	music.c 355
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
;	music.c 356
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
00126$:
;	music.c 358
;	genAssign
	ld	bc,#0xFF22
;	genAssign (pointer)
;	AOP_STK for _mus_update4_frequency_1_1
	lda	hl,3(sp)
	ld	a,(hl)
	ld	(bc),a
;	music.c 359
;	genAssign
	ld	bc,#0xFF23
;	genAssign (pointer)
	ld	a,#0x80
	ld	(bc),a
;	music.c 360
;	genRet
;	music.c 361
;	genLabel
00131$:
;	genEndFunction
	lda	sp,5(sp)
	ret
___mus_update4_end:
	.area _CODE
