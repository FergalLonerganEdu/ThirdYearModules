#ifndef AES_H_
#define AES_H_

void encryption(unsigned char state[16], unsigned char message[16], unsigned long schedule[44]);
void AddRoundKey(unsigned char state[16], unsigned long roundkey[4]);
void SubBytes(unsigned char state[16]);
void MixColumns(unsigned char state[16]);
void ShiftRows(unsigned char state[16]);
unsigned char xtime(unsigned char x);
unsigned long SubWord(unsigned long word);
unsigned long RotWord(unsigned long word);
void KeyExpansion(unsigned char key[16], unsigned long schedule[44]);

#endif /* AES_H_ */
