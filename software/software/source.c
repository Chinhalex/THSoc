#include <stdio.h>
#include "io.h"
#include "system.h"


void main ()
{
	short data, dataLed;
	int * sw_ptr = (int *) SWITCHES_0_BASE;
	*sw_ptr = 0xf;

	while(1)
	{
		data = IORD(SWITCHES_0_BASE, 0)& 0x1f;
		IOWR(PWM_WRAPPER_0_BASE, 0, data);

		dataLed = IORD(PWM_WRAPPER_0_BASE, 0)& 0x1;
		IOWR(RED_LEDS_0_BASE, 0, dataLed);

	}

}
