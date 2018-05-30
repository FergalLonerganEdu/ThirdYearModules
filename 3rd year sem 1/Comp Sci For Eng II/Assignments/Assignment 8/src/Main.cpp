/*********************************************************************/
/* COMP20080, Semester 1 2015-16 -- Practical 7 -- Main.cpp          */
/*                                                                   */
/*********************************************************************/

// including our PassengerPlane header
#include "PassengerPlane.h"

#include <iostream>
using namespace std;

int main()
{

// declare two Passenger Plane objects and one Plane object
  PassengerPlane myPassengerPlane_1(1);
  PassengerPlane myPassengerPlane_2(2);
  Plane myPlane(3);

// output the details of all three before they have been registered
  myPassengerPlane_1.print_details();
  myPassengerPlane_2.print_details();
  myPlane.print_details();

//register the Plane object and both Passenger Plane objects
  myPassengerPlane_1.register_vehicle();
  myPassengerPlane_2.register_vehicle();
  myPlane.register_vehicle();

/*set the number of engines for the Plane object to 3;
. set the number of engines for one Passenger Plane object to 4, and the other to 1*/
  myPlane.set_numEngines(3);
  myPassengerPlane_1.set_numEngines(4);
  myPassengerPlane_2.set_numEngines(1);

// set the capacity of one Passenger Plane object to 200, and the other to 100.
  myPassengerPlane_1.set_passengerCap(200);
  myPassengerPlane_2.set_passengerCap(100);

// then output the details of all three objects again.
  myPassengerPlane_1.print_details();
  myPassengerPlane_2.print_details();
  myPlane.print_details();    // details have changed...

  return 0;
}
