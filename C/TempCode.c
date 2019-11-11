#include <pic.h>	// include a library of procedure specific to the PIC family of microcontrollers
#include <htc.h>
__CONFIG( FOSC_INTRCIO & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & 
IESO_OFF & FCMEN_OFF );

//defined constants- the compiler does a substitution 
#define led1 RB6
#define led2 RB5
#define led3 RB4
#define led4 RB7
#define led5 RC7
#define led6 RC5
#define led7 RC3
#define led8 RC6
#define led9 RC4
//Global Variables 




// PREDEFINE PROCEDURES: procedure must be defined before you can use them
void _delay(unsigned long cycles);
void init_hardware(void);
int GetTempRaw();
int GetRealTemp(int);
void GetDebug(int);
void DisplayTemp(int);
void ClearLed();
void main(void)
{ 
	init_hardware();           //run procedure init_hardware()
	while(1) //Main Loop
	{
	int nRaw=0;
	nRaw = GetTempRaw();
	//GetDebug(nRaw);
	int nTemp = GetRealTemp(nRaw);
	//GetDebug(nTemp);
	DisplayTemp(nTemp);
	ClearLed();
	}
}
void DisplayTemp(int nTemp)
{
	if(nTemp>35)
	{
		led9=1;
		_delay(1000000);
		return;
	}
	if(nTemp>30)
	{
		led8=1;
		if(nTemp<35)
		{
			led9=1;
		}
		_delay(1000000);
		return;
	}
	if(nTemp>25)
	{
		led7=1;
		if(nTemp<30)
		{
			led8=1;
		}
		_delay(1000000);
		return;
	}
	if(nTemp>20)
	{
		led6=1;
		if(nTemp<25)
		{
			led7=1;
		}
		_delay(1000000);
		return;
	}
	if(nTemp>15)
	{
		led5=1;
		if(nTemp<20)
		{
			led6=1;
		}
		_delay(1000000);
		return;
	}
	if(nTemp>10)
	{
		led4=1;
		if(nTemp<15)
		{
			led5=1;
		}
		_delay(1000000);
		return;
	}
	if(nTemp>5)
	{
		led3=1;
		if(nTemp<10)
		{
			led4=1;
		}
		_delay(1000000);
		return;
	}
	if(nTemp>0)
	{
		led2=1;
		if(nTemp<5)
		{
			led3=1;
		}
		_delay(1000000);
		return;
	}
	if(nTemp>-5)
	{
		led1=1;
		if(nTemp<0)
		{
			led2=1;
		}
		_delay(1000000);
		return;
	}
	if(nTemp<-5)
	{
		led1=1;
		_delay(1000000);
		return;
	}
}// End of method
int GetRealTemp(int nRaw)
{
	// ToDo Make Formula Here
	// y=(x*-0.52173) + 103
	int nTemp = ((nRaw*-0.52173) + 103);
	return nTemp; // Should be from -5 to 35
}// End of method

void GetDebug(int nData)
{
	if(nData>255) //Fall through ladder
	{
		nData = nData - 256;
		led9=1;
	}
	if(nData>127)
	{
		nData = nData - 128;
		led8=1;
	}
	if(nData>63)
	{
		nData = nData - 64;
		led7=1;
	}
	if(nData>31)
	{
		nData = nData - 32;
		led6=1;
	}
	if(nData>15)
	{
		nData = nData - 16;
		led5=1;
	}
	if(nData>7)
	{
		nData = nData - 8;
		led4=1;
	}
	if(nData>3)
	{
		nData = nData - 4;
		led3=1;
	}
	if(nData>1)
	{
		nData = nData - 2;
		led2=1;
	}
	if(nData>0)
	{
		nData = nData - 1;
		led1=1;
	}
		_delay(10000000); //Let us see data
	if(nData>0) //Something is wrong!
	{
		RC7=1;
		RB7=1;
		RC6=1;
		RC3=1;
		RC5=1;
		RB5=1;
		RB4=1;
		RB6=1;
		RC7=1;
		RC4=1;
		_delay(10000000);
	}
		RC7=0; //Clear all the test data
		RB7=0;
		RC6=0;
		RC3=0;
		RC5=0;
		RB5=0;
		RB4=0;
		RB6=0;
		RC7=0;
		RC4=0;
} // End of debug

int GetTempRaw()
{
	int nRaw=0;
	GO_DONE=1;
	while(GO_DONE==1)
	{
		nRaw=ADRESH;
	}	
	return nRaw;
} // End of method	
void ClearLed()
{
	RC7=0;
	RB7=0;
	RC6=0;
	RC3=0;
	RC5=0;
	RB5=0;
	RB4=0;
	RB6=0;
	RC7=0;
	RC4=0;
}// End of method
void init_hardware(void)   //set it and forget it
{
	// set analogue pins as analogue(1) or digital(0) 
	ANSEL  = 0b00001000;           // AN7 to AN0
	ANSELH = 0b00000000;	       //  n/c , n/c, n/c, n/c, AN11, AN10,AN9, AN8
	// 0011
       // set pins as Input(1) or Output(0)
	TRISA = 0b00010000;	
	TRISB = 0b00000000;
	TRISC = 0b00000000;
	
       //initalize the ports 
	PORTA = 0b00000000;
	PORTB = 0b00000000;
	PORTC = 0b00000000;	
	ADCON0 =0b00001101;
	RC7=0;
	RB7=0;
	RC6=0;
	RC3=0;
	RC5=0;
	RB5=0;
	RB4=0;
	RB6=0;
	RC7=0;
	RC4=0;
}