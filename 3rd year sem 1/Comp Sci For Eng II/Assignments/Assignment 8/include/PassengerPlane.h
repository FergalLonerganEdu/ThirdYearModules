/*********************************************************************/
/* COMP20080, Semester 1 2015-16 -- Practical 7 -- PassengerPlane.cpp*/
/*                                                                   */
/*********************************************************************/

// including the methods and fields of our Plane class
#include "Plane.h"

// New PassengerPlane class that is a subclass of our Plane class
class PassengerPlane : public Plane
{

private:
    int passengerCap; // new data field, not in the Plane class used to keep track of the Passenger Capacity of a PassengerPlane

public:
    PassengerPlane (int passenger_plane_id); // Constructor for a PassengerPlane object
    void set_passengerCap(int p); // method to set the passenger capacity of a PassengerPlane
    int get_passengerCap(); // method to return the passenger capacity of a PassengerPlane
    void set_numEngines(int n);  // overriding an inherited method from Plane class to set the number of engines for a PassengerPlane
    void print_details();  // overriding an inherited method from Plane class to Print the details of a PassengerPlane

};
