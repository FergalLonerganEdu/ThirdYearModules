// taken from notes and manipulating to include that car is also an Asset
#include "Vehicle.h"
#include "Asset.h"
class Car : public Vehicle, public Asset
{
private:
    int mpg;//New data field, not in Vehicle or Asset class which denotes the miles per gallon rating of a Car
public:
    Car(int car_id, int v);//The Car constructor which takes into account that the Car is both a Vehicle and an Asset.
                           //setting the car_id and the Value (v) of Car
    void set_mpg(int m);//New method not inherited used to set the miles per gallon of the car.
    void print_details();//Overriding inherited method from both Vehicle and Asset classes to print all details of Car object.
    void depreciateAsset();//Overriding inherited method from asset class to set depreciation to 20% and not 10%
};
