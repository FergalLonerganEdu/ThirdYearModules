#include <iostream>
#include "Car.h"
using namespace std;

int main()
{
    Car myCar(12345678, 100000);//Creating the car object. Car_id of 12345678 and a value of 250000
    myCar.print_details();//Printing the details of the car before it has been registered and depreciated.
    myCar.register_vehicle();//Registering myCar object.
    myCar.set_mpg(25);//Setting the miles per gallon of the Car object to 25 MPG.
    myCar.depreciateAsset();//Depreciating the car value by 20%. overwritten method from asset class
    myCar.print_details();//Printing the details of the car again.
    return 0;//Program ends correctly.
}
