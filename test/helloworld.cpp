#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    //Statically

    Node n1(1);

    Node *head = &n1;

    Node n2(2);

    n1.next = &n2;
    cout << head -> data << " " << n1.data << endl;   
    cout << head -> next << " " << n1.next << endl;

}
