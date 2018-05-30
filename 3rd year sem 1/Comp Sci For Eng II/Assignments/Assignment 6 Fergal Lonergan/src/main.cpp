#include <iostream>
#include "Fraction.h"

using namespace std;

int main()
{
    // declartion of the variables we will read in from user to construct our Fractions
    int n1,n2,n3,d1,d2;
    //Reading in the numerator and denominator of the first fraction
    cout << "Please enter your first fraction in the form \"numerator denominator\":";
    cin >> n1 >> d1;

    cout << "Please enter your second fraction in the form \"numerator denominator\":";
    cin >> n2 >> d2;

    cout << "Please enter your 3rd fractions numerator. (Denominator assumed to be 1)";
    cin >> n3;

//constructing our fractions, z and w only need one parameter as we use the method that already sets the denominator to 1
    Fraction x(n1,d1), y(n2,d2), z(n3), w(1);

    w = (x/y) - (y*(z+x)); //testing all of our operations using the formula provided

//using our numeratorMethod to get the numerator of the answer and print it to the user
    cout << "Numerator of w is " << w.numeratorMethod()<<"\n";
//using our denominatorMethod to get the numerator of the answer and print it to the user
    cout << "Denominator of w is " << w.denominatorMethod()<<"\n";

    return 0;
}
