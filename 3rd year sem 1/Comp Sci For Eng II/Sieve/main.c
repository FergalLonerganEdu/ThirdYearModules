#include <stdio.h>
#include <stdlib.h>

int main()
{
    int num[999], primes[170];
    int i = 0;
    int j = 0,k=0, l=0;
    for (i=2;i<=1000;i++){
        i = num[i-2];
    }
    printf("primes:");

    for (j=0; j<=998; j++){
        for (k=2; k<=32; k++){
            if (num[j]%k == 0){
                primes[l] = num[j];
                l++;
                printf("%d\n",primes[l] );

        }
    }









    return 0;
}
}
