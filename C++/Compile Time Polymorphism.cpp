#include <iostream>

using namespace std;

//Addition function to add two integer numbers
int add(int a, int b)
{
    return(a+b);
}

//Double function to add two double  numbers
double add(double a, double b)
{
    return(a+b);
}

int main()
{
    int a1, a2, sum1;//To store integer values
    double b1, b2, sum2;//To store double values
    cout << "\nEnter 1st integer value : ";
    cin >> a1;
    cout << "\nEnter 2nd integer value : ";
    cin >> a2;
    cout << "\nEnter 1st double values : ";
    cin >> b1;
    cout << "\nEnter 1st double values : ";
    cin >> b2;
    sum1 = add(a1,a2);//integer addition function is called during compile time
    sum2 = add(b1,b2);//double addit
    cout << "\nSum of two integers = " << sum1;
    cout << "\nSum of two double = " << sum2;
    return 0;
}
