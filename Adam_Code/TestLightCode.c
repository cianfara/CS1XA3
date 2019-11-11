#include <pic.h>	// include a library of procedure specific to the PIC family of microcontrollers

__CONFIG( FOSC_INTRCIO & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & 
IESO_OFF & FCMEN_OFF );

//defined constants- the compiler does a substitution 


//Global Variables 




// PREDEFINE PROCEDURES: procedure must be defined before you can use them

void init_hardware(void);
void clear_all(void);


void main(void)
{
	init_hardware();           //run procedure init_hardware()
	
	while(1)
	{
		PORTC = 0b11111111;
		_delay(1000000);
		PORTC = 0b00000000;
		_delay(1000000);
		PORTC = 0b11111111;
		int nPos=0;
		nPlay=0;
	while(1)
		{
		clear_all();
		if (nPos==0)
			{
			RC0=1;	
			}
		if (nPos==1)
			{
			RC1=1;	
			}
		if (nPos==2)
			{
			RC2=1;	
			}
		if (nPos==3)
			{
			RC3=1;	
			}
		if (nPos==4)
			{
			RC4=1;	
			}
		if (nPos==5)
			{
			RC5=1;	
			}
		if (nPos==6)
			{
			RC6=1;	
			}
		if (nPos==7)
			{
			RC7=1;	
			}
		
		//_delay(100000);
		for(int iii = 0; iii < 100000; iii++)
		{
		nPlay = get_input();
		}
		if(nPlay==0)
		{
			nPos=nPos++;
		}
		if(nPlay==1)
		{
			nPos=nPos--;
		}
	}
}

void init_hardware(void)   //set it and forget it
{
	// set analogue pins as analogue(1) or digital(0) 
	ANSEL  = 0b00000000;           // AN7 to AN0
	ANSELH = 0b00000000;	       //  n/c , n/c, n/c, n/c, AN11, AN10,AN9, AN8
	
       // set pins as Input(1) or Output(0)
	TRISA = 0b00110000;	
	TRISB = 0b00000000;
	TRISC = 0b00000000;
	
       //initalize the ports 
	PORTA = 0b00000000;
	PORTB = 0b00000000;
	PORTC = 0b00000000;	
}
void clear_all(void)
{
	PORTA = 0b00000000;
	PORTB = 0b00000000;
	PORTC = 0b00000000;	
}