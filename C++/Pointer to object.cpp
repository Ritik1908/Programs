#include <iostream>

using namespace std;

class myclass
{
    int i;
public :
    myclass(int a)
    {
        i = a;
    }
    int getval();
};
int myclass :: getval()
{
    return i;
}

int main()
{
    myclass ob(5), *ptr;
    ptr = &ob;
    cout << "Value is " << ptr -> getval();
    return 0;
}
