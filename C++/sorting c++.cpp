//sorting program using class
#include <iostream>
using namespace std;

//declaring prototype of class sorting
class sorting
{
    int arr[20];//to store unsorted elements
    int size;//to store number of elements
    int i, j;//loop variables
    void swap(int *a, int *b);//function to swap two values
public :
    void input();//function to take user input in an array
    void sort();//function to sort array in ascending order
    void display();//function to display array
};

void sorting :: swap(int *a, int *b)
{
    int c = *a;//used to store value of variable
    *a = *b;
    *b = c;
}

void sorting :: sort()
{
    //implementation of bubble sort
    for (i = 0; i < size-1; i++)
    {
        for (j = 0; j < size-i-1; j++)
        {
            if(arr[j] > arr[j+1])//condition to sort in ascending order
                swap(&arr[j], &arr[j+1]);//swapping of values using swap function
        }
    }
}

void sorting :: input ()
{
    cout << "Enter number of elements : ";
    cin >> size;//storing number of elements in size variable
    cout << "Enter elements of array.\n";
    //loop to take user input
    for(i = 0; i < size; i++)
    {
        cin >> arr[i];
    }
}

void sorting :: display ()
{
    //loop to display array
    for(i = 0; i < size; i++)
    {
        cout << arr[i] << " ";
    }
    cout << "\n";//shifts ti next line
}

int main()
{
    sorting ob;//object of class sorting
    ob.input();
    cout << "Unsorted Array : ";
    ob.display();//displaying unsorted array
    ob.sort();
    cout << "Sorted Array in ascending order : ";
    ob.display();//displaying sorted array
    return 0;
}
