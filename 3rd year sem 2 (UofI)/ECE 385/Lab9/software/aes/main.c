/*---------------------------------------------------------------------------
  --      hello_world.c                                                    --
  --      Christine Chen                                                   --
  --      Fall 2013														   --
  --																	   --
  --      Updated Spring 2015 											   --
  --	  Yi Liang														   --
  --																	   --
  --      For use with ECE 385 Experiment 9                                --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/

#include "aes.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define to_hw_port (volatile char*) 0x00000090 // actual address here
#define to_hw_sig (volatile char*) 0x00000080 // actual address here
#define to_sw_port (volatile char*) 0x00000070 // actual address here
#define to_sw_sig (volatile char*) 0x00000060 // actual address here


#define TEMPTEXT_0 (volatile char*) 0x00000050 // actual address here
#define TEMPTEXT_1 (volatile char*) 0x00000040 // actual address here
#define TEMPTEXT_2 (volatile char*) 0x00000030 // actual address here
#define TEMPTEXT_3 (volatile char*) 0x00000020 // actual address here


char charToHex(char c)
{
	char hex = c;

	if (hex >= '0' && hex <= '9')
		hex -= '0';
	else if (hex >= 'A' && hex <='F')
	{
		hex -= 'A';
		hex += 10;
	}
	else if (hex >= 'a' && hex <='f')
	{
		hex -= 'a';
		hex += 10;
	}
	return hex;
}

char charsToHex(char c1, char c2)
{
	char hex1 = charToHex(c1);
	char hex2 = charToHex(c2);
	return (hex1 << 4) + hex2;
}

int main()
{
	int i;
	unsigned char plaintext[33]; //should be 1 more character to account for string terminator
	unsigned char key[33];
	//unsigned char newtext[16];
	//unsigned char newkey[16];
	unsigned char message[16];
	unsigned char decoded[16];
	unsigned long keyschedule[44];
	// Start with pressing reset
	*to_hw_sig = 0;
	*to_hw_port = 0;
	printf("Press reset!\n");
	while (*to_sw_sig != 3);

	//while (1)
	//{
		*to_hw_sig = 0;
	/*	printf("\n");

		printf("\nEnter plain text:\n");
		scanf("%s",plaintext);
		printf ("\n");
		printf("\nEnter key:\n");
		scanf("%s",key);
		printf ("\n");
		printf("plaintext: %s\n",plaintext);
		printf("key: %s\n",key);

		plaintext = "ece298dcece298dcece298dcece298dc";
		key = "000102030405060708090a0b0c0d0e0f";
		printf("Plaintext is: %s",plaintext);
		printf("Key is: %s",key);

		// TODO: Key Expansion and AES encryption using week 1's AES algorithm.
		for (i = 0; i < 16; i++)
		{
			newtext[i] = charsToHex(plaintext[2*i], plaintext[2*i+1]);
			newkey[i] = charsToHex(key[2*i], key[2*i+1]);
		}
*/
		unsigned char newtext[16] = {0xec,0xe2,0x98,0xdc,0xec,0xe2,0x98,0xdc,0xec,0xe2,0x98,0xdc,0xec,0xe2,0x98,0xdc};
		unsigned char newkey[16] = {0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f};
		printf("\nText is: ");
		for (i = 0; i < 16; i++)
		{
			printf("%x", newtext[i]);
		}
		printf("\nKey is: ");
		for (i = 0; i < 16; i++)
		{
			printf("%x", newkey[i]);
		} 
		KeyExpansion(newkey,keyschedule);
		encryption(newtext, message, keyschedule);

		// TODO: display the encrypted message.
		printf("\nEncrypted message is: ");
		for (i = 0; i < 16; i++)
		{
			printf("%x", message[i]);
		}

		// Transmit encrypted message to hardware side for decryption.
		printf("\nTransmitting message...\n");

		for (i = 0; i < 16; i++)
		{
			*to_hw_sig = 1;
			*to_hw_port = message[i]; // encryptedMsg is your encrypted message
			// Consider to use charToHex() if your encrypted message is a string. 
			while (*to_sw_sig != 1);
			*to_hw_sig = 2;
			while (*to_sw_sig != 0);
		}
		*to_hw_sig=0;
		while (*to_sw_sig != 0);
		// Transmit encrypted message to hardware side for decryption. 

		//TODO: Transmit key
		printf("\nTransmitting key...\n");
		for (i = 0; i < 16; i++) {
			*to_hw_sig = 2;
			*to_hw_port = newkey[i];
			while (*to_sw_sig != 1);
			*to_hw_sig = 1;
			while (*to_sw_sig != 0);
		}


		*to_hw_sig=3;
		while (*to_sw_sig != 2);

		printf("\n\n");
		printf("\nRetrieving message...\n");
		for (i = 0; i < 16; ++i)
		{
			*to_hw_sig = 1;
			while (*to_sw_sig != 1);
			decoded[i] = *to_sw_port;
			*to_hw_sig = 2;
			while (*to_sw_sig != 0);
		}
		*to_hw_sig=0;
		while (*to_sw_sig != 0);

		printf("\n\n");
		printf("\nDecoded message: ");
		for (i = 0; i < 16; i++)
		{
			printf("%x", decoded[i]);
		}
//	}

	return 0;
}

