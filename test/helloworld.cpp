#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(10,2);
    Fraction f3 = f1 + f2;

    f1.print();
    f2.print();
    f3.print();
    Fraction f4 = f1 * f2;
    f4.print();

    if(f1 == f2){
        cout << "Equal" << endl;
    }
    else{
        cout << "Not equal" << endl;
    }
}