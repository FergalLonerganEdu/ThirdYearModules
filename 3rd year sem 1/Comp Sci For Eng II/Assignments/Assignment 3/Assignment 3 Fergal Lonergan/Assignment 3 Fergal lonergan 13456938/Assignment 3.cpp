#include<iostream>
#include<stdlib.h>
#include<math.h>
#include "Assignment 3.h"

/*
    this is a function that adds the number num to the next unused block of the array
    of our NumberSet as long as the NumberSet isnt full yet. if it adds a number it
    adds 1 to count also
*/
void numberSetAdd(NumberSet& set, Number num){
	if(set.count < maxSize)
		set.items[set.count++] = num;
}


/*
    this function looks through our number set to find the first occurrence of the number
    entered by the user, it then over writes the number with the number in the block after this
    element in the array and continues to do this until it reaches the last number, if it removes a
    number then it reduces the value of count by 1. if it doesn't find the element then it does nothing.
*/
void numberSetRemove(NumberSet& set, Number num){
	bool number_find = false;
	for(int i = 0; i!=set.count; i++){
		if(number_find)
			set.items[i-1] = set.items[i];
		else if(set.items[i] == num)
			number_find = true;
	}
	if(number_find)
		set.count--;
}

/*
returns the count of the numbers in our NumberSet
*/
int numberSetCount(NumberSet& set){
	return set.count;
}

/*
    sums the numbers in the NumberSet and returns the sum
*/
Number numberSetSum(NumberSet& set){
	Number sum = 0;
	for(int i = 0; i != set.count; i++){
		sum += set.items[i];
	}
	return sum;
}

/*
this creates a new number set by setting the count equal to 0
*/
NumberSet newNumberSet(){
	NumberSet set;
	set.count = 0;
	return set;
}
