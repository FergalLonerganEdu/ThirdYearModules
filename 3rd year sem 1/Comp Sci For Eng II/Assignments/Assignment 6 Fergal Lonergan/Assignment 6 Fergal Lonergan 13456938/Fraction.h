class Fraction
{
    // the private fields which will contain our numerator and denominator of our fraction
private:
    int numerator;
    int denominator;

public:
    Fraction(int n, int d); // A constructor which takes two arguments (numerator n and denominator d) and constructs the fraction n / d
    Fraction(int n); //  A constructor which takes one argument n and constructs the fraction n / 1
    int numeratorMethod(); // A method which returns the numerator of the fraction.
    int denominatorMethod(); // A method which returns the denominator of the fraction.
    // redefining all the operators so that they react compute our fractions correctly
    Fraction operator+(Fraction input_fraction); //An operator method which returns the result of adding two fractions.
    Fraction operator-(Fraction input_fraction); //An operator method which returns the result of subtracting one fraction from another fraction.
    Fraction operator*(Fraction input_fraction); //An operator method which returns the result of multiplying two fractions
    Fraction operator/(Fraction input_fraction); //An operator method which returns the result of dividing one fraction by another fraction

};
