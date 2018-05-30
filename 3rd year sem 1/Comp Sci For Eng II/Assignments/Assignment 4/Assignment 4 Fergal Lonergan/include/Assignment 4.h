/*
Defining two types of type double to represent our real and imaginary parts.
*/
typedef double real,imaginary;

/*
Defining a structure for our complex number made of a real and imaginary part.
We use our types real and imaginary defined above.
*/
struct ComplexNumber
{
    real realVal;
    imaginary imaginaryVal;
};

/*
The function prototypes of the functions that will be used in main.
*/
void constructComplex(ComplexNumber& number);
void printComplex(ComplexNumber& myComplex);
void multiplyComplex(ComplexNumber& first,  ComplexNumber& second, ComplexNumber& answer);
void divideComplex(ComplexNumber& first, ComplexNumber& second, ComplexNumber& answer);
