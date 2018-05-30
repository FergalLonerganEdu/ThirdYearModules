#include "Vehicle.h"

class Plane : public Vehicle{

    private:
    int engines; // new data field, not in Vehicle class

    public:
    Plane(int plane_id); // constructor
    void set_engines(int a); // new method, not in Vehicle class
    void print_details(); // overriding inherited method to print out vehicle details

};
