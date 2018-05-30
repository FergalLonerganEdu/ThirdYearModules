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
	/*
	Declare our new numberSet called workingSet and initialise it
	*/
	NumberSet workingSet = newNumberSet();

	/*
	try add the numbers from 1-21 to the set. 1-20 will be added but 21 won't
	as this will exceed our maxSize constant in our header file
	*/
	for(int i = 1; i <= 21; i++){
		numberSetAdd(workingSet, i);
	}
	/*
	this prints the sum of the numbers in our numberSet using our numberSetSum function to find the
	sum of the values in our numberSet. the endl just prints a new line
	*/
	cout << "Value of the sum of the numbers added to our number set is: " << numberSetSum(workingSet) << endl;

	/*
	now we try to remove the numbers 3,7and 23 from workingSet. 3 and 7 will be removed but 23 will not
	as it isn't in workingSet. to do this we call our numberSetRemove function defined in Assignment 3.h
	*/
	numberSetRemove(workingSet,3);
	numberSetRemove(workingSet,7);
	numberSetRemove(workingSet,23);

	/*
	we now print out the recalculated value of our numberSet which should be 10 lower as 3 and
	7 were removed.
	*/
	cout << "Value of the sum of the numbers added in our number set after attempting to remove 3, 7 and 23 is:" << numberSetSum(workingSet) << endl;

	/*
	end program correctly
	*/
	return 0;
}
