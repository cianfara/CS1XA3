	#include <p16F690.inc>
	__config (_INTRC_OSC_NOCLKOUT&_WDT_OFF&_PWRTE_OFF&_MCLRE_OFF&_CP_OFF&_BOR_OFF&_IESO_OFF&_FCMEN_OFF)

	cblock 0x20
	Delay1	;init Var
	Delay2
	Display
	endc
	
	org 0
	BANKSEL TRISA
	movlw	0xFF
	movwf TRISA
	end