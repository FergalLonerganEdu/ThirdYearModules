#include <stdio.h>

#define LIMIT 999 /*size of integers array*/
#define PRIMES 168 /*size of primes array*/

int main(){
    int i,j,numbers[LIMIT];
    int primes[PRIMES];

    /*fill the array with natural numbers*/
    for (i=0;i<LIMIT;i++){
        numbers[i]=i+2;
    }
    /*sieve the non-primes*/
    for (i=0;i<LIMIT;i++){
        for (j=2; j<=31;j++){
            if (numbers[i]%j == 0 && j != i+2){
                numbers[i] = -1;
            }
        }
    }
    // just to check is it printing the numbers correctly
for (i=0;i<LIMIT;i++)
        printf("%d\n",numbers[i]);

    //transfer the primes to their own array
    j = 0;
    for (i=0;i<LIMIT&&j<PRIMES;i++)
        if (numbers[i]!=-1)
            primes[j++] = numbers[i];

    //print
    for (i=0;i<PRIMES;i++)
        printf("%d\n",primes[i]);
return 0;
}
