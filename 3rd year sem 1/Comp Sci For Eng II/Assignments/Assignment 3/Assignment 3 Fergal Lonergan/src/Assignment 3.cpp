#include<iostream>
#include<stdlib.h>
#include<math.h>
#include "Assignment 3.h"

  void constructComplex(double real, double imaginary)
  {
      ComplexNumber.realVal = real;
      ComplexNumber.imaginaryVal = imaginary;
  }

  void printComplex(ComplexNumber myComplex)
  {
      cout << "The complex number is " + ComplexNumber.realVal + " + " +ComplexNumber.imaginaryVal +"i" << endl;
  }

  ComplexNumber multiplyComplex(ComplexNumber first, ComplexNumber second)
  {
      ComplexNumber answer;
      answer.realVal = ((first.realVal*second.realVal)-(first.imaginaryVal*second.imaginaryVal));
      answer.imaginaryVal = ((first.realVal*second.imaginaryVal)-(first.imaginaryVal*second.realVal));
      return answer;
  }

  ComplexNumber divideComplex(ComplexNumber first, ComplexNumber second)
  {
      ComplexNumber answer;
      answer.realVal = ((first.realVal*second.realVal)+(first.imaginaryVal*second.imaginaryVal))/(second.realVal*second.realVal + second.imaginaryVal*second.imaginaryVal);
      answer.imaginaryVal = ((first.imaginaryVal*second.realVal)+(first.realVal*second.imaginaryVal))/(second.realVal*second.realVal + second.imaginaryVal*second.imaginaryVal);
      return answer;
  }
