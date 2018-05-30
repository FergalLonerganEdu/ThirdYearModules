/*********************************************************************/
/* COMP20080, Semester 1 2015-16 -- Practical 8 -- Plane.cpp         */
/*                                                                   */
/*********************************************************************/

#include "Plane.h"

#include <iostream>
using namespace std;

Plane::Plane(int plane_id) : Vehicle(plane_id) // calling base class constructor
{
  numEngines = 2; // this value can be changed later
}

void Plane::set_numEngines(int n)
{
  numEngines = n;
}

int Plane::get_numEngines()
{
  return numEngines;
}

void Plane::print_details() // overriding this method from Vehicle class
{
  cout << "This is plane number " << get_vehicle_id() << " which has " << numEngines << " engines\n";
  if (get_v_registered())
    cout << "This plane has been registered\n";
}
