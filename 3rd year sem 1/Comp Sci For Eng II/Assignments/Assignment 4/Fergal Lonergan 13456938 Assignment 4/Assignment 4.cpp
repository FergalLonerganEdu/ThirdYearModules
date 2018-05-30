/*
Here we include the libraries of functions including our header file
function definitions fro Assignment 4.h.
*/
#include<iostream>
#include<stdlib.h>
#include<math.h>
#include "Assignment 4.h"

/*
adds the std namespace to the current namespace for use when calling cout cin etc.
*/
using namespace std;

/*
This function takes in the real and imaginary parts of the number and constructs
a ComplexNumber number which has the values entered by the user. it does this by
accessing the address of the ComplexNumber entered in the function and changing
the value of the variables at this address.
*/
void constructComplex(ComplexNumber& number)
{
    cin >> number.realVal;
    cin >> number.imaginaryVal;
}


/*
This function prints the complex number entered in the function by the user. it has
an if condition which will print a plus sign if the imaginary value is positive but
as the minus sign will be entered automatically if the imaginary value is minus a
minus sign will be printed automatically.
*/
void printComplex(ComplexNumber& myComplex)
{
    if (myComplex.imaginaryVal>=0)
        cout << "The complex number is " << myComplex.realVal << " + " <<myComplex.imaginaryVal << "i" << endl;
    else
        cout << "The complex number is " << myComplex.realVal << myComplex.imaginaryVal << "i" << endl;
}

/*
This function multiplies the two complex numbers denoted first and second together and
attributes the value to the answer ComplexNumber memory addresses. We use the function
provided to us on Moodle for multiplying complex numbers.
*/
void multiplyComplex(ComplexNumber& first, ComplexNumber& second, ComplexNumber& answer)
{
    answer.realVal = ((first.realVal*second.realVal)-(first.imaginaryVal*second.imaginaryVal));
    answer.imaginaryVal = ((first.realVal*second.imaginaryVal)+(first.imaginaryVal*second.realVal));
}

/*
This function divides the ComplexNumber denoted first by the ComplexNumber second and
attributes the value to the answer ComplexNumber memory addresses. We use the function
provided to us on Moodle for dividing complex numbers.
*/
void divideComplex(ComplexNumber& first, ComplexNumber& second, ComplexNumber& answer)
{
    answer.realVal = ((first.realVal*second.realVal)+(first.imaginaryVal*second.imaginaryVal))/(second.realVal*second.realVal + second.imaginaryVal*second.imaginaryVal);
    answer.imaginaryVal = ((first.imaginaryVal*second.realVal)-(first.realVal*second.imaginaryVal))/(second.realVal*second.realVal + second.imaginaryVal*second.imaginaryVal);
}
