// Main to check our Plane class
#include <iostream>
#include "Plane.h" // Vehicle.h not included
int main()
{
Plane myPlane(13456938);// creating a plane with registration number the same as my student number
myPlane.print_details(); // not registered yet
myPlane.set_engines(4); // setting engines to "4"
myPlane.register_vehicle(); // now it’s registered
myPlane.print_details(); // returning details of registered vehicle
}
