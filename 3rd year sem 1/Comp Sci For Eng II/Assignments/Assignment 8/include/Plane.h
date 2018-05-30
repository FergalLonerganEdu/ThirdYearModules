/*********************************************************************/
/* COMP20080, Semester 1 2015-16 -- Practical 8 -- Plane.h           */
/*                                                                   */
/*********************************************************************/

#include "Vehicle.h"

class Plane : public Vehicle {

private:
int numEngines; // new data field, not in the Vehicle class

public:
Plane(int plane_id); // constructor
void set_numEngines(int n);  // new method, not in the Vehicle class
int get_numEngines();  // new method, not in the Vehicle class
void print_details();  // overriding an inherited method...

};
