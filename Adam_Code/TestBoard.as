opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F690
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 3 "C:\Users\Administrator\Desktop\Adam_Code\TestLightCode.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "C:\Users\Administrator\Desktop\Adam_Code\TestLightCode.c"
	dw 0xFFFC & 0xFFF7 & 0xFFFF & 0xFFDF & 0xFFFF & 0xFFFF & 0xFCFF & 0xFBFF & 0xF7FF ;#
	FNCALL	_main,_init_hardware
	FNCALL	_main,_clear_all
	FNROOT	_main
	global	_PORTA
psect	text88,local,class=CODE,delta=2
global __ptext88
__ptext88:
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RC6
_RC6	set	62
	global	_RC7
_RC7	set	63
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_ANSEL
_ANSEL	set	286
	global	_ANSELH
_ANSELH	set	287
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"TestBoard.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init_hardware
?_init_hardware:	; 0 bytes @ 0x0
	global	??_init_hardware
??_init_hardware:	; 0 bytes @ 0x0
	global	?_clear_all
?_clear_all:	; 0 bytes @ 0x0
	global	??_clear_all
??_clear_all:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	3
	global	main@nPos
main@nPos:	; 2 bytes @ 0x3
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       5
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0     135
;;                                              0 COMMON     5     5      0
;;                      _init_hardware
;;                          _clear_all
;; ---------------------------------------------------------------------------------
;; (1) _clear_all                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _init_hardware                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init_hardware
;;   _clear_all
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       5       1       35.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      0       0       3        0.0%
;;BITBANK1            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK1               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;BANK2               50      0       0       7        0.0%
;;ABS                  0      0       0       8        0.0%
;;BITBANK0            50      0       0       9        0.0%
;;DATA                 0      0       0      10        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 21 in file "C:\Users\Administrator\Desktop\Adam_Code\TestLightCode.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  nPos            2    3[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          3       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_init_hardware
;;		_clear_all
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Administrator\Desktop\Adam_Code\TestLightCode.c"
	line	21
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	22
	
l3010:	
;TestLightCode.c: 22: init_hardware();
	fcall	_init_hardware
	goto	l3012
	line	24
;TestLightCode.c: 24: while(1)
	
l893:	
	line	26
	
l3012:	
;TestLightCode.c: 25: {
;TestLightCode.c: 26: PORTC = 0b11111111;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	27
	
l3014:	
;TestLightCode.c: 27: _delay(1000000);
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u2307:
	decfsz	((??_main+0)+0),f
	goto	u2307
	decfsz	((??_main+0)+0+1),f
	goto	u2307
	decfsz	((??_main+0)+0+2),f
	goto	u2307
	nop2
opt asmopt_on

	line	28
	
l3016:	
;TestLightCode.c: 28: PORTC = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	29
	
l3018:	
;TestLightCode.c: 29: _delay(1000000);
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u2317:
	decfsz	((??_main+0)+0),f
	goto	u2317
	decfsz	((??_main+0)+0+1),f
	goto	u2317
	decfsz	((??_main+0)+0+2),f
	goto	u2317
	nop2
opt asmopt_on

	line	30
	
l3020:	
;TestLightCode.c: 30: PORTC = 0b11111111;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	31
	
l3022:	
;TestLightCode.c: 31: int nPos=0;
	clrf	(main@nPos)
	clrf	(main@nPos+1)
	goto	l3024
	line	32
;TestLightCode.c: 32: while(1)
	
l894:	
	line	34
	
l3024:	
;TestLightCode.c: 33: {
;TestLightCode.c: 34: clear_all();
	fcall	_clear_all
	line	35
	
l3026:	
;TestLightCode.c: 35: if (nPos==0)
	movf	((main@nPos+1)),w
	iorwf	((main@nPos)),w
	skipz
	goto	u2221
	goto	u2220
u2221:
	goto	l3030
u2220:
	line	37
	
l3028:	
;TestLightCode.c: 36: {
;TestLightCode.c: 37: RC0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	goto	l3030
	line	38
	
l895:	
	line	39
	
l3030:	
;TestLightCode.c: 38: }
;TestLightCode.c: 39: if (nPos==1)
	movlw	01h
	xorwf	(main@nPos),w
	iorwf	(main@nPos+1),w
	skipz
	goto	u2231
	goto	u2230
u2231:
	goto	l3034
u2230:
	line	41
	
l3032:	
;TestLightCode.c: 40: {
;TestLightCode.c: 41: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	goto	l3034
	line	42
	
l896:	
	line	43
	
l3034:	
;TestLightCode.c: 42: }
;TestLightCode.c: 43: if (nPos==2)
	movlw	02h
	xorwf	(main@nPos),w
	iorwf	(main@nPos+1),w
	skipz
	goto	u2241
	goto	u2240
u2241:
	goto	l3038
u2240:
	line	45
	
l3036:	
;TestLightCode.c: 44: {
;TestLightCode.c: 45: RC2=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	goto	l3038
	line	46
	
l897:	
	line	47
	
l3038:	
;TestLightCode.c: 46: }
;TestLightCode.c: 47: if (nPos==3)
	movlw	03h
	xorwf	(main@nPos),w
	iorwf	(main@nPos+1),w
	skipz
	goto	u2251
	goto	u2250
u2251:
	goto	l3042
u2250:
	line	49
	
l3040:	
;TestLightCode.c: 48: {
;TestLightCode.c: 49: RC3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	goto	l3042
	line	50
	
l898:	
	line	51
	
l3042:	
;TestLightCode.c: 50: }
;TestLightCode.c: 51: if (nPos==4)
	movlw	04h
	xorwf	(main@nPos),w
	iorwf	(main@nPos+1),w
	skipz
	goto	u2261
	goto	u2260
u2261:
	goto	l3046
u2260:
	line	53
	
l3044:	
;TestLightCode.c: 52: {
;TestLightCode.c: 53: RC4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	goto	l3046
	line	54
	
l899:	
	line	55
	
l3046:	
;TestLightCode.c: 54: }
;TestLightCode.c: 55: if (nPos==5)
	movlw	05h
	xorwf	(main@nPos),w
	iorwf	(main@nPos+1),w
	skipz
	goto	u2271
	goto	u2270
u2271:
	goto	l3050
u2270:
	line	57
	
l3048:	
;TestLightCode.c: 56: {
;TestLightCode.c: 57: RC5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	l3050
	line	58
	
l900:	
	line	59
	
l3050:	
;TestLightCode.c: 58: }
;TestLightCode.c: 59: if (nPos==6)
	movlw	06h
	xorwf	(main@nPos),w
	iorwf	(main@nPos+1),w
	skipz
	goto	u2281
	goto	u2280
u2281:
	goto	l3054
u2280:
	line	61
	
l3052:	
;TestLightCode.c: 60: {
;TestLightCode.c: 61: RC6=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	goto	l3054
	line	62
	
l901:	
	line	63
	
l3054:	
;TestLightCode.c: 62: }
;TestLightCode.c: 63: if (nPos==7)
	movlw	07h
	xorwf	(main@nPos),w
	iorwf	(main@nPos+1),w
	skipz
	goto	u2291
	goto	u2290
u2291:
	goto	l3058
u2290:
	line	65
	
l3056:	
;TestLightCode.c: 64: {
;TestLightCode.c: 65: RC7=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	goto	l3058
	line	66
	
l902:	
	line	67
	
l3058:	
;TestLightCode.c: 66: }
;TestLightCode.c: 67: _delay(1000000);
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u2327:
	decfsz	((??_main+0)+0),f
	goto	u2327
	decfsz	((??_main+0)+0+1),f
	goto	u2327
	decfsz	((??_main+0)+0+2),f
	goto	u2327
	nop2
opt asmopt_on

	line	68
	
l3060:	
;TestLightCode.c: 68: nPos=nPos+1;
	movf	(main@nPos),w
	addlw	low(01h)
	movwf	(main@nPos)
	movf	(main@nPos+1),w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(main@nPos)
	goto	l3024
	line	69
	
l903:	
	line	32
	goto	l3024
	
l904:	
	goto	l3012
	line	70
	
l905:	
	line	24
	goto	l3012
	
l906:	
	line	71
	
l907:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_clear_all
psect	text89,local,class=CODE,delta=2
global __ptext89
__ptext89:

;; *************** function _clear_all *****************
;; Defined at:
;;		line 90 in file "C:\Users\Administrator\Desktop\Adam_Code\TestLightCode.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text89
	file	"C:\Users\Administrator\Desktop\Adam_Code\TestLightCode.c"
	line	90
	global	__size_of_clear_all
	__size_of_clear_all	equ	__end_of_clear_all-_clear_all
	
_clear_all:	
	opt	stack 7
; Regs used in _clear_all: [status,2]
	line	91
	
l2150:	
;TestLightCode.c: 91: PORTA = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	92
;TestLightCode.c: 92: PORTB = 0b00000000;
	clrf	(6)	;volatile
	line	93
;TestLightCode.c: 93: PORTC = 0b00000000;
	clrf	(7)	;volatile
	line	94
	
l913:	
	return
	opt stack 0
GLOBAL	__end_of_clear_all
	__end_of_clear_all:
;; =============== function _clear_all ends ============

	signat	_clear_all,88
	global	_init_hardware
psect	text90,local,class=CODE,delta=2
global __ptext90
__ptext90:

;; *************** function _init_hardware *****************
;; Defined at:
;;		line 74 in file "C:\Users\Administrator\Desktop\Adam_Code\TestLightCode.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text90
	file	"C:\Users\Administrator\Desktop\Adam_Code\TestLightCode.c"
	line	74
	global	__size_of_init_hardware
	__size_of_init_hardware	equ	__end_of_init_hardware-_init_hardware
	
_init_hardware:	
	opt	stack 7
; Regs used in _init_hardware: [wreg+status,2]
	line	76
	
l2136:	
;TestLightCode.c: 76: ANSEL = 0b00000000;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(286)^0100h	;volatile
	line	77
;TestLightCode.c: 77: ANSELH = 0b00000000;
	clrf	(287)^0100h	;volatile
	line	80
	
l2138:	
;TestLightCode.c: 80: TRISA = 0b00110000;
	movlw	(030h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	81
	
l2140:	
;TestLightCode.c: 81: TRISB = 0b00000000;
	clrf	(134)^080h	;volatile
	line	82
	
l2142:	
;TestLightCode.c: 82: TRISC = 0b00000000;
	clrf	(135)^080h	;volatile
	line	85
	
l2144:	
;TestLightCode.c: 85: PORTA = 0b00000000;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	86
	
l2146:	
;TestLightCode.c: 86: PORTB = 0b00000000;
	clrf	(6)	;volatile
	line	87
	
l2148:	
;TestLightCode.c: 87: PORTC = 0b00000000;
	clrf	(7)	;volatile
	line	88
	
l910:	
	return
	opt stack 0
GLOBAL	__end_of_init_hardware
	__end_of_init_hardware:
;; =============== function _init_hardware ends ============

	signat	_init_hardware,88
psect	text91,local,class=CODE,delta=2
global __ptext91
__ptext91:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
