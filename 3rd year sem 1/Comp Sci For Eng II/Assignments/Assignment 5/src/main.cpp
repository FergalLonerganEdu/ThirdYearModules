/*
                        Fergal Lonergan 13456938 Assignment 5
In this program we were asked to extend the can code which was introduced in lectures.
I will explain the other classes and headers in their code.
In my main program I check the aspects of my program fully. we were asked to manipulate
the code given to us so that we read in the height and radius of a can to calculate the
volume of the can entered. you then enter a volume of product that you wish to enter
into the can and output to the user a message that explains if the can can hold the
volume of product.
for the purpose of my program i created two cans from the user input in order to check
both the volume entered by the user and my default product volume constructor.
*/
#include "Can.h"
#include "Product.h"
#include <iostream>
#include <stdlib.h>
#include <math.h>

using namespace std;

int main()
{
/*
Firstly read int the user input for the the height and radius of the cans.
*/
    double height, radius;
    cout << "Enter the height of the can: ";
    cin >> height;
    cout << "Enter the radius of the can: ";
    cin >> radius;
/*
Now create two cans of of radius and height entered by the user.
one will test the users input volume, the other our default product volume.
*/
    Can myCan(radius, height);
    Can defaultCan(radius,height);
    double volumeOfProduct;
/*
now read in the volume of the product from the user
*/
    cout << "Enter the volume of the product: ";
    cin >> volumeOfProduct;
/*
Create two Products to fill in our cans with. one with the volume entered
by the user, the other our default product volume of 4.5
*/
    Product myProduct(volumeOfProduct);
    Product defaultProduct;
/*
attempt to fill the cans with the product. our fill can method will output
whether the can can be filled with the specified volume of product or not.
*/
    myCan.fillCan(myProduct.product_vol());
    defaultCan.fillCan(defaultProduct.product_vol());
/*
end program correctly
*/
    return 0;
}
