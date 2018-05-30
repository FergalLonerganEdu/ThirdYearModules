/*
Fraction class which creates our fraction types, methods and operators to manipulate
our fractions in the way we want.
The class contains two private fields representing the numerator and denominator of the fraction.
You should have only the following public methods in your Fraction class:

1. A constructor which takes two arguments (numerator n and denominator d) and constructs the fraction n / d

2. A constructor which takes one argument n and constructs the fraction n / 1

3. A method which returns the numerator of the fraction.

4. A method which returns the denominator of the fraction.

5. An operator method which returns the result of adding two fractions.

6. An operator method which returns the result of subtracting one fraction from another fraction.

7. An operator method which returns the result of multiplying two fractions.

8. An operator method which returns the result of dividing one fraction by another fraction.
*/


#include "Fraction.h"
Fraction::Fraction(int n, int d)
{
    numerator=n;              //set the private fields to the input
    denominator=d;
}
Fraction::Fraction(int n)
{
    numerator=n;              //set the private fields to the input
    denominator=1;
}

int Fraction::numeratorMethod()
{
    return numerator;         //returns the numerator
}
int Fraction::denominatorMethod()
{
    return denominator;         //returns the denominator
}

Fraction Fraction::operator+(Fraction input_fraction)
{

    int answer_numerator, answer_denominator;
    int num = input_fraction.numeratorMethod(), den = input_fraction.denominatorMethod(); //setting the input fractions numerator and denominator to variables for readability
    answer_numerator=(numerator*den)+(num*denominator);        //sets the new numerator as the sum of each numerator times the other denominator
    answer_denominator=den*denominator;                     //sets the new denominator as the product of each denominator

    Fraction output_fraction(answer_numerator, answer_denominator);           //define a new fraction as the new numerator and denominator and return it
    return output_fraction;
}

Fraction Fraction::operator-(Fraction input_fraction)
{
    int answer_numerator, answer_denominator;
    int num = input_fraction.numeratorMethod(), den = input_fraction.denominatorMethod();
    answer_numerator=(numerator*den)-(num*denominator);            //all the same as above, except take one away from the other
    answer_denominator=den*denominator;

    Fraction output_fraction(answer_numerator, answer_denominator);
    return output_fraction;
}

Fraction Fraction::operator*(Fraction input_fraction)
{
    int answer_numerator, answer_denominator;
    int num = input_fraction.numeratorMethod(), den = input_fraction.denominatorMethod();
    answer_numerator=num*numerator;                        //the new numerator and denominator is the product of the old ones
    answer_denominator=den*denominator;

    Fraction output_fraction(answer_numerator, answer_denominator);
    return output_fraction;
}

Fraction Fraction::operator/(Fraction input_fraction)
{
    int answer_numerator, answer_denominator;
    int num = input_fraction.numeratorMethod(), den = input_fraction.denominatorMethod();
    answer_numerator=(den)*numerator;                     //this is similar to above, except it's the numerator times the denominator and visa versa
    answer_denominator=(num)*denominator;

    Fraction output_fraction(answer_numerator, answer_denominator);
    return output_fraction;
}
