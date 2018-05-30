#include <iostream>
#include "Plane.h" // Including our header. Vehicle.h not included
using namespace std;

Plane::Plane(int plane_id):Vehicle(plane_id)// calling base class constructor
{
    engines=0; // set engines equal to 0
}


void Plane::set_engines(int e)// set number of engines of this plane
{
    engines=e; // set engines equal to number of engines
}


void Plane::print_details()// overriding this method from Vehicle class
{

    cout << "This is plane number " << get_vehicle_id() << " which has "<< engines << " engines\n";
    if (get_v_registered())
        cout << "This plane has been registered\n";
}

