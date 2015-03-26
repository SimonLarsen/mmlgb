;--------------------------------------------------------
; File Created by SDCC : FreeWare ANSI-C Compiler
; Version 2.3.1 Thu Mar 26 11:13:49 2015

;--------------------------------------------------------
	.module lcc111120
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
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
;	main.c 6
;	genLabel
;	genFunction
;	---------------------------------
; Function main
; ---------------------------------
___main_start:
_main:
	
;	main.c 7
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_disable_interrupts
;	main.c 9
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#_song_asm_data
	push	hl
;	genCall
	call	_mus_init
	lda	sp,2(sp)
;	main.c 11
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	hl,#_mus_update
	push	hl
;	genCall
	call	_add_TIM
	lda	sp,2(sp)
;	main.c 12
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_enable_interrupts
;	main.c 13
;	genIpush
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	ld	a,#0x05
	push	af
	inc	sp
;	genCall
	call	_set_interrupts
	lda	sp,1(sp)
;	main.c 15
;	genLabel
00102$:
;	main.c 16
;	genCall
; _saveRegsForCall: sendSetSize: 0 deInUse: 0 bcInUse: 0 deSending: 0
	call	_wait_vbl_done
;	genGoto
	jp	00102$
;	genLabel
00104$:
;	genEndFunction
	
	ret
___main_end:
	.area _CODE
