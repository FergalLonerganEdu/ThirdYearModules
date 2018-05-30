/*********************************************************************/
/* COMP20080, Semester 1 2015-16 -- Practical 7 -- PassengerPlane.cpp*/
/*                                                                   */
/*********************************************************************/
#include "PassengerPlane.h"

#include <iostream>
using namespace std;

//Method to declare a PassengerPlane object
PassengerPlane::PassengerPlane(int passenger_plane_id) : Plane(passenger_plane_id)// calling base class constructor
{
    passengerCap = 0;//setting the initial Capacity of the PassengerPlane to 0
}

//method to set passenger capacity of a PassengerPlane to the value input when function is called
void PassengerPlane::set_passengerCap(int p)
{
    passengerCap = p;
}

//method to return passenger capacity of a PassengerPlane
int PassengerPlane::get_passengerCap()
{
    return passengerCap;
}

//method to set the number if engines of a PassengerPlane object
//this method overwrites our set_numEngines() method in our Plane class
void PassengerPlane::set_numEngines(int n)
{
    //if the number of engines the user wishes to attribute to the PassengerPlane
    //is less than two print an error stating that this cant be else set the number
    //of engines to the number of engines input when function is called using the
    //method from our Plane class
    if(n >=2)
    {
        Plane::set_numEngines(n);
    }
    else
    {
        cout << "Error: The number of Engines can not be less than two." << endl;
    }
}

//method to print the details of our PassengerPlane object
void PassengerPlane::print_details() // overriding this method from Plane class
{
    cout << "This is passenger plane number " << get_vehicle_id() << " which has " << get_numEngines() << " engines and a max capacity of " << get_passengerCap() << " people." << endl;
    if (get_v_registered())
        cout << "This plane has been registered." << endl;
}
