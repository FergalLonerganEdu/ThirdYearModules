#include <iostream>
#include "Car.h"
using namespace std;

// The constructor for a car object. It takes into account that it is both a Vehicle and an Asset.
// sets the cars id and the value of the Car
Car::Car(int car_id, int v): Vehicle(car_id) , Asset(v, car_id) // calling base class constructors of Vehicle and Asset
{
    mpg=0;// sets original miles per gallon to 0
}

// Taken from original Car class in notes.
void Car::set_mpg(int m)
{
    mpg=m; // Sets the miles per gallon of the car (mpg) equal to the value read in, m.
}

// Over riding the print_details() method to print all the relevant information to the user. Takes into account Car
// object is a Vehicle and an Asset. As a result we inherit it from both classes.
void Car::print_details()
{
    cout << "This is car number " << get_vehicle_id() << " and asset number " << getAssetID()
         << ". It can drive " << mpg << " miles to the gallon and has a value of "
         << getValue() << endl; // outputting details of car to user
    if (get_v_registered())
        cout << "This car has been registered\n"; // if car was registered print this to user
}

// This is a an overwritten method inherited from the car class that depreciates Assets by 10%.(ie now 90% of original value)
// The depreciateAsset method in Car is used to depreciate the value of the Car by 20%. (ie now 80% of original value)
void Car::depreciateAsset()
{
    // sets the new value of the Car to be equal to 80% the value of the original method.
    // 100 - 20 = 80 ie depreciates the value by 20%
    setValue(getValue()*0.8);
}
