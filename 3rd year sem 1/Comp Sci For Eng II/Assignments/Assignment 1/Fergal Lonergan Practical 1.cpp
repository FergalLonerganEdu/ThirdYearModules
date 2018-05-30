/*                      Computer Science For Engineers II
                                Practical 1
    In this program you are asked to enter three integer values.
    The program prints a message to the screen asking for the user to enter three
    integer variables, it then reads in these values from the screen.

    There is error checking involved to ensure that the user enters three integers
    and not any other variable type. If they enter a variable type that is not an integer,
    a helpful error message is printed to the screen explaining that the values they
    entered are not all integers, and also explains what an integer is and gives some examples
    of integers.

    It will then calculate the sum and product of the integers entered which are denoted in the
    program as a, b and c.

    Finally it prints the values of the sum and product to the screen.
*/

#include <iostream>

using namespace std;

int main()
{
    int a, b, c, sum, product;

    cout << "Welcome to the sum and product Calculator." << endl;
    cout << "This will tell you the sum and product of any three integers." << endl;
    cout << "Enter the three integers as follows, a b c"<< endl;
    cin >> a >> b >> c;

    while(std::cin.fail()) {
        std::cout << "Error: some value is not an integer.\nIntegers are positive or negative whole numbers ie 1 -13 273 etc." << std::endl;
        std::cin.clear();
        std::cin.ignore(256,'\n');
        std::cin >> a >> b >> c;
    }

    sum = a+b+c;
    product = a*b*c;

    cout << "The sum is " << sum << endl;
    cout << "The product is " << product << endl;

    return 0;
}
