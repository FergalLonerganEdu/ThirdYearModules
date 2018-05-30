#include <iostream>
#include "Fraction.h"

using namespace std;

int main()
{
    Fraction x(1,2), y(3,4), z(5,6), w(1,1); //setting the fractions

    w = (x/y) + (y*(z-x)); //performing operations on them

    cout << "Numerator of w is " << w.top()<<"\n"; //calling the new numerator and priting it

    cout << "Denominator of w is " << w.bot()<<"\n";//calling the denominator and printing it

    return 0;
}
