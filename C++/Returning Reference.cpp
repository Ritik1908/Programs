#include <iostream>

using namespace std;

char &rep (int i);
char s[20]="Good Morning";
char &rep(int i)
{
    return (s[i]);
}

int main()
{
    rep(4)='_';
    cout << "Hello world!" << endl << s;
    return 0;
}
