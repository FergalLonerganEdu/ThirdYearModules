/*********************************************************************/
/* COMP20080, Semester 1 2015-16 -- Practical 8 -- Vehicle.h         */
/*                                                                   */
/*********************************************************************/
class Vehicle{

    private:
    int vehicle_id;
    bool v_registered;
    public:
    Vehicle(int vid); // constructor
    void register_vehicle();
    void print_details(); // will need to be overridden...
    int get_vehicle_id();
    bool get_v_registered();
};


