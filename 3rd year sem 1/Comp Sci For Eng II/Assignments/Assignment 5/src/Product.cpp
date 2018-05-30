/*
Defining a new class product which contains a constructor of the volume of product
entered by the user, a default product constructor with volume 4.5 and a method
product_vol which returns the volume of a Product object.
*/
#include "Product.h"

Product :: Product (double vol_entered)
{
    ProductVolume = vol_entered;
}
Product :: Product ()
{
    ProductVolume = 4.5;
}
double Product :: product_vol()
{
 return ProductVolume;
}
