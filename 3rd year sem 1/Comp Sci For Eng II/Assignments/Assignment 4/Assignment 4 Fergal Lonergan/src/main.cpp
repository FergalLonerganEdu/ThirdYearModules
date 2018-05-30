/*
    Assignment 4 Fergal Lonergan 13456938
    ************************************************************************************
    This program manipulates complex numbers, constructing, multiplying and dividing them.
    it tests all the functions explained in Assignment 4.h in detail and tests our
    functions to ensure they all work as described and as they should.
*/

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

int main(){
    /*
    Declaring our ComplexNumber variables which will be used in main
    */
    ComplexNumber one, two, multiplied, divided_1, divided_2;

    /*
    Asking the user to enter the values for the real and imaginary parts of our complex
    number one, by use of our constructComplex and the printComplex function to print the
    value of the complex number. we also have a helpful message for the user to explain
    how to enter the values.
    */
    cout << "Enter your first complex number in the form 'real_part imaginary_part'";
    constructComplex(one);
    printComplex(one);

  /*
    Asking the user to enter the values for the real and imaginary parts of our complex
    number two, by use of our constructComplex and the printComplex function to print the
    value of the complex number. we also have a helpful message for the user to explain
    how to enter the values.
    */
    cout << "Enter your second complex number in the form 'real_part imaginary_part'";
    constructComplex(two);
    printComplex(two);

/*
Calling our multiplyComplex function which will multiply our complex numbers one and
two together and changes the values at the memory address attributed to multiplied
with the answer of the multiplication.
*/
    multiplyComplex(one , two , multiplied);
/*
Calling our divideComplex function which will divide our complex numbers multiplied by
one and will hopefully return the answer for our ComplexNumber two and show our
multiply and divide functions work correctly. it then changes the values at the memory
address attributed to divided_1 with the answer of the division.
*/
    divideComplex(multiplied , one , divided_1);
/*
Same as above except we divide our complex number one by two to find that answer.
*/
    divideComplex(one , two , divided_2);

/*
printing the answers of our arithmetic operations using the cout and our printComplex
functions.
*/
    cout << "The two multiplied by each other are ";
    printComplex(multiplied);
    cout << "Therefore our multiplied number divided by our first is equal to our second ie ";
    printComplex(divided_1);
    cout << "our first divided by our second is ";
    printComplex(divided_2);

	/*
	end program correctly
	*/
	return 0;
}
