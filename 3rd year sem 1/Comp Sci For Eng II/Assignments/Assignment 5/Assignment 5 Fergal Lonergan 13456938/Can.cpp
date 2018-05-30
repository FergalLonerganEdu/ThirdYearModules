/*
most of the can code is from the class explained in lectures, as instructed. i had
to create a new method called fill can which attempted to fill the can with a
specified volume of liquid and outputs a response message to the user stating
whether it is possible or not to fill the can with this volume of product.
i removed the gramsInCan method as it was not needed in our program.
*/

#include "Can.h"
#include <iostream>
using namespace std;

double Can::volume()
{
 return PI*radius*radius*height;
}

Can::Can(double r, double h)
{
 radius = r;
 height = h;
 CanSpace = volume();
}

/*
in our fillCan method we read in the volumeOfProduct input by the user, for our default
can we read in the default volume. we then check to see if there is enough space to
fit the volume of the product that the user wants to enter in the specified can size or
not. if it is it outputs a message to the user saying that it is, if it is not it outputs
a message saying that the volume won't fit in the can. it also reduces the space in the can
by the volume of product entered.
*/
void Can::fillCan(double volumeOfProduct){
    if(volumeOfProduct <= CanSpace)
    {
        CanSpace -= volumeOfProduct;
        cout << "This is enough space to fit this amount of product in the can.\n" ;
    }
    else
        cout << "There is not enough space to fit this amount of the product into the can.\n" ;
}
