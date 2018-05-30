#include<iostream>
#include<stdlib.h>
#include<math.h>
using namespace std;
                                                                                //All the usual preprocessor stuff
const int N=10;                                                                 //setting the max size of the array
void get_data(double data[], int n);
double average(double data[], int n);
double variance(double data[], double mean, int n);
void print_large_deviates(double data[],double mean, double stddev, int n);     //initialising all the functions to be used later

int main(){
    int n,i;
    double mean, var, stddev, *data;
    cout << "Enter the number of values in the data set (2.." << N << "): ";
    cin >> n;                                                                   //getting the number of inputs
    if (n<2||n>N){
        cout << "ERROR: Value must be greater than 1 and less than "<<N<<"\n";  //error checking
        return 0;
    }
    data= new double[n];                                                        //setting the array size dynamically
    get_data(data, n);
    mean = average(data, n);
    var = variance(data, mean, n);                                              //getting values from our functions
    stddev = sqrt(var);                                                         //using math.h to get the square root of the variance, i.e. the standard deviation
    cout << "The mean is "<<mean<<"\n"<<"The variance is "<<var;
    cout << "\n"<<"The standard deviation is "<<stddev<<"\n";                   //outputting the results
    print_large_deviates(data, mean, stddev, n);                                //printing the deviants
    delete [] data;                                                             //deleting the array
    return 0;
}

void get_data(double data[], int n){
    int i;
    for(i=0;i<n;i++){
        cout<<"Enter value number "<<i+1<<": ";
        cin>>data[i];                                                           //obtaining all the user's inputs
    }
}

double average(double data[], int n){
    int i;
    double sum = 0;
    for(i=0;i<n;i++)                                                             //computing the average and returning
        sum+=data[i];
    return sum/n;
}

double variance(double data[], double mean, int n){
    int i;
    double var=0;
    for(i=0;i<n;i++)
        var+=(data[i] - mean)*(data[i] - mean);                                  //using the mean we obtained earlier to get the variance
    return var/n;
}

void print_large_deviates(double data[],double mean, double stddev, int n){
    int i;
    for (i=0; i<n;i++)
        if((abs(data[i]-mean)>(stddev*1.5)))                                     //using the absolute value to get the difference from the mean,
            cout<<data[i]<<" deviates significantly from the mean\n";            // and comparing it to the 1.5 times the standard deviation
}
