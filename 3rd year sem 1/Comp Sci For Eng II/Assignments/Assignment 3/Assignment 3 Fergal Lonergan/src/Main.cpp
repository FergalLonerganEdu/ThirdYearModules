/*
    Assignment 3 Fergal Lonergan 13456938
    ************************************************************************************
    this program uses to different classes one called assignment 3 which holds our
    functions and then our main function.

    our assignment 3 class has comments that explain each of the functions individually.
    our main class creates a number set including the numbers from 1-21 inclusive.

    as there is a maxSize of 20 in our header file the number 21 will not be added.

    it then sums the numbers in the set using the function numberSetSum to add all the
    numbers in the set.

    it then attempts to remove the numbers 3,7,23 from the set using our numberSetRemove
    function. it will remove 3 and 7 but not 23 as 23 isnt in our set

    finally it adds the numberSet again but it is now 10 smaller as the 3 and ere removed
    earlier in the program.
*/
/*
including the various libraries and header files we will need to draw functions from.
our "Assingment 3.h" library is also included which includes the header given to us, to
allow us to use our numberSet functions
*/
#include<iostream>
#include<stdlib.h>
#include<math.h>
#include "Assignment 3.h"
/*
adds the std namespace to the current namespace for use when calling cout cin etc.
*/
using namespace std;

int main(){
    double real, imaginary;
    ComplexNumber one, two, multiplied, divided_1,divided_2;
    cout << "Enter your first complex number in the form 'real_part imaginary_part'";
    cin >>  real >> imaginary;
    one = constructComplex(real , imaginary);
    cout << "Enter your second complex number in the form 'real_part imaginary_part'";
    cin >>  real >> imaginary;
    one = constructComplex(real , imaginary);

    multiplied = multiplyComplex(one , two);

    divided_1 = divideComplex(multiplied , one);

    divided_2 = divideComplex(one,two);

    cout << "Your first complex number is "<<printComplex(one) ;
    cout << "Your second complex number is "<<printComplex(two) ;
    cout << "The two multiplied by each other are "<<printComplex(multiplied) ;
    cout << "Therefore our multiplied number divided by our first is equal to our second ie "<<printComplex(divided_1) ;
    cout << "our first divided by our second is "<<printComplex(divided_2) ;

	/*
	end program correctly
	*/
	return 0;
}
