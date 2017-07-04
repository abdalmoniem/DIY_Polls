/**
 * author: mn3m
 * date: 20-Jun-2017 12:08:38 PM
 * home_automation: controls an LED via a bluetooth
 */

#define F_CPU 8000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

// function declarations
void initialize_usart(unsigned int);
void send_character(unsigned char);
void send_string(char*);

// a variable to hold received data
unsigned char received;

int main() {
	// make portb an output port
	DDRB = 0xff;

	// make portc an output port
   DDRC = 0xff;
   
   // turn off portb
   PORTB = 0x00;

   // turn off portc
   PORTC = 0x00;
   
   //initialize usart with 9600 baud rate
   initialize_usart(51);
   
   //enable global interrupts
   sei();
    
	while(1) {
		// toogle portb on and off every 0.5 seconds to indicate that the system is working
		PORTB ^= 0xff;

		// every 500 milli seconds
		_delay_ms(500);
	}

	return 0;
}

/**
 * this function initializes the usart peripheral on the microcontroller
 * @ubrr: an integer that defines the baud rate of the communication
 * refere to the data sheet for more information
 */
void initialize_usart(unsigned int ubrr) {
	// insert the ubrr value in the low byte of the UBRR register
   UBRR0L = ubrr;

   // insert the ubrr value in the high byte of the UBRR register
   UBRR0H = ubrr >> 8;

   // enable receiver, transmitter and receive interrupts
   UCSR0B = (1<<RXEN0) | (1<<TXEN0) | (1<<RXCIE0);

   // set data size to 8 bits
   UCSR0C = (3<<UCSZ00);
}

/**
 * this function sends a character over the Tx line
 * @data: the character to be sent over
 */
void send_character(unsigned char data) {
	// loop until the data register is empty
   while (!(UCSR0A & (1 << UDRE0)));

   // fill the data register with the character to be sent
   UDR0 = data;
}

/**
 * this function sends a string of characters over the Tx line
 * @string: the string to be sent over
 */
void send_string(char* string) {
	// loop until the end of the string
   while(*string != 0x00) {
   	// send the current character in the string
      send_character(*string);

      // increase pointer index to point to the next character
      *string++;
   }
}

/**
 * handle usart receive interrupts
 */
ISR(USART_RX_vect) {
	// read the received data from the data register
   received = UDR0;
    
   if (received == '1') {
      PORTC = 0xff;
      // send_character('o');
      // send_character('n');
      send_string("Device is on\n");
   } else if (received == '0') {
      PORTC = 0x00;
      // send_character('o');
      // send_character('f');
      // send_character('f');
      send_string("Device is off\n");
   } else {
      // send_character('n');
      // send_character('o');
      send_string("Unkown command\n");
   }
}