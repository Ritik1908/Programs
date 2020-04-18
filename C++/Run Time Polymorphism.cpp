#include <iostream>

using namespace std;

class base
{
    int x;
public :
    virtual void input()
    {
        cout << "Enter a base class value : ";
        cin >> x;
    }
    virtual void show ()
    {
        cout << "Base class int value = " << x << endl;
    }
};

class derived1 : public base
{
    int x;
public :
    void input()
    {
        cout << "Enter a derived1 class value : ";
        cin >> x;
    }
    void show ()
    {
        cout << "Derived1 class int value = " << x << endl;
    }
};

class derived2 : public base
{
    int x;
public :
    void input()
    {
        cout << "Enter a derived2 class value : ";
        cin >> x;
    }
    void show ()
    {
        cout << "Derived2 class int value = " << x<< endl;
    }
};

int main()
{
    base ob1, *p;
    derived2 ob3;
    derived1 ob2;
    p = &ob1;
    p -> input();
    p = &ob2;
    p -> input();
    p = &ob3;
    p -> input();
    p -> show();
    p = &ob2;
    p -> show();
    p = &ob1;
    p -> show();
    return 0;
}
