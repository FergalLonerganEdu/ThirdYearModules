/*
defining pi as 3.1415. pi will be used in the calculation of our can volume.

also defining our constructor variables as private, our constructor for Can and
our methods as public which will be used in main and Can.cpp
*/

const double PI=3.1415;

class Can
{
private:
    double radius;
    double height;
    double CanSpace;
public:
    Can(double r, double h);
    double volume();
    void fillCan(double volumeOfProduct);
};
