#include <iostream>

using namespace std;

class prepost
{
    int no;
public:
    prepost(int x)
    {
        no = x;
    }
    prepost operator ++ ()
    {
        ++no;
        return *this;
    }
    prepost operator ++ (int x)
    {
        no++;
        return *this;
    }
    prepost operator + (prepost ob2)
    {
        prepost ad;
        ad.no = no + ob2.no;
        return ad;
    }
    void display()
    {
        cout << "Number = " << no << endl;
    }
};

int main()
{
    prepost ob(10), ob2(10);
    ob.display();
    ++ob;
    ob.display();
    ob = ++ob;
    ob.display();
    ob++;
    ob.display();
    ob = ob + ob2;
    ob.display();
    return 0;
}
