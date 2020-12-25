# DATA STRUCTURES

Jo bhi input diya hain woh humme somehow save krna hain.Abh ek input milta hain toh simple hain apan ek variable banake save kr dete hain and save the input.Problem bada hua ki elements mil raha hain and we want to sort and return the elements.So we will use array blah blah blah

SO whenever a problem is given,we need to save the input in some format.So that,we can work over them.Abhi tak hum data ko save krne ke two hi tarike jaante the.One is variable and another is array.Ab humm dusre dusre tarike dhundege.

### DATA STRUCTURES ARE WAY TO SAVE THE DATA AND SOLVE IT ACCORDINGLY.JAISE SAVE KREGE USSE MALUM HOGA KI PROBLEM KA SOLUTION KAISA HOGA.FAST,SLOW SABH MATTER KREGA.

### LINKED LIST

Ab humare pass mast sa array tha,toh phir linked list ki zarrorat hi kyu padi ?? Array cheezein continuously store krta hain.Yeh thik hain.But humm ne ek baar declare kiya toh khatam.AB although we can do it with the help of Dynamic arrays but normal arrays mein toh nahin hoga.

So to remove this problem,we created one more DS which is Linked List.ARRAY KA WOH PROBEM iss liye tha bcoz saare elements continuous the,toh agar aage apan ne size bada di and pehle se uss adress pe kuch rakha ho toh lagg jaayege.

Linked List say,you can add as many element as you want according to our requirement.It will be randomly allocated.AB in array since woh continuous tha , so wo aage aaram se chala jaata tha.it means ki int hain toh usko pata hain aage ka address next 4 bytes pe jaana hain.

AB bhau,baat yeh hain ki Linked list mein aisa nahin kr paayege bcoz saare elements randomly placed hain,so what we need to do is ek ek krke saare element ke address ko save krna hoga,so that we can access ek ek krke elements.

TOh yeh bhi faltu ki mehnat hain,jitne elements hain unko save kro utne hi address bhi save kro.Upar se yaha par save krne ke liye bhi array lagega.Toh phir kassu fhayda nathi,bcoz arrays hi introduce hogaya.

----------------------------------------

So humm kya krege ki humm sirf first element ko store krege phir jaise jaise aage gaye aage address krte rahege.First element se hi sabh hoga.

Humme sirf first element ka address save krna hain.Harr element ko bolna hain next wale elemnt ka address save krlo.Ab agar humme 3 rd element access krna hain ,hum first element ke pass jaayege aur usse 3rd element ka address lege aur access krege.

So har block ke pass 2cheezein rahegi,ek element and dusra aage wale ka address.

SO abhi 2 cheezein save keni hain.Hmm, humne socha but aisa koi data type toh nahin hain humare pass.Bcoz integer toh sirf int save krega address nahin daal paayege,POinter sirf address toh isme data nahin daal paayege.

So in-built toh lavde se nahin hain.TOh humme khud ka banana padega.

CLASSES .CLASSES are user-defined data types.TOh we will call our class as Node.and node ke andar 2 values hogi ek data and dusra pointer jisme next address ki value rakhi hogi.

Ab data ka datatype toh int hoga .But pointer ka kya hoga?

```C++
class Node{
    int data;
    (data-type)*next;
}
```
Integer hoga pointer ka data-type? Nahin chutiye.
Yeh jo address hain yeh next waale poore Node ka hain(block jisme 2 cheezein hain value aur aage wale ka address). So iska data-type bhi in-built nahin balki jo apne banaya class woh hoga which is Node. 

```C++
class Node{
    int data;
    Node*next;
}
```

TOh chalo ab code krte hain.Iski maa ka
Pehle apan class banayege.Abhi ke liye sabh public rakhte hain.2 properties hain.And uss class ka Constructor bhi bana dete hain.So that user ko Jabh bhi iss class ka object banana hoga,user has to pass the data.Aur jo bhi data user dega woh hum this mein daal dege .And next i.e. adress ki value ko null rakh dege
So isse humari Node class ready hogayi

```C++
class Node{
    public :
    int data;
    Node *next;

    Node(int data){
        this -> data = data;
        next = NULL;
    }
};
```

So isse humari Node class ready hogayi hain.

Ab ek aur file jisme humm,humari node class ko use krege.

ABhi humm simple krege ,2 nodes banani hain and dono ko connect krna hain bas.
So we know,jo humari LL thi usko hume nodes se represent kiya tha.We can say humari linked list mein jitne bhi elements(address and data) woh sabh nodes hoge.
OR 
we can say humari linked list mein jitne bhi elements hoge,utne hi node class ke objects hoge.
So,jabh bhi humme linked list create krni hain,humme node class ka object banayege.usme data daal dege.next mein respective addresss ko daaldege, and humari node create bann jaayegi.

Abhi hum 2 tarike se object bana skte hain,statically and Dynamically.

So abhi ke liye statically mein smjhte hain

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    //Statically

    Node n1; //(1)
    
}
```

Sirf Node n1 ikhna is not enough bcoz usse default constructor call hoga jo nahin hain bcoz apan ne banadiya hain ek constructor so default visible hi nahin hain.So object banane ke liye we are bound to pass the data value.  

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    //Statically

    Node n1(1); 
    
}
```

ABh,yeh likhte hi kya hua?
n1 naam ka ek node bann gaya jiske data = 1 hogaya and next mein NULL aagaya.Bcoz constructor ne yeh kiya hain bhai.
Theek hain,ab apan ek aur node create kr lete hain

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    //Statically

    Node n1(1); 

    Node n2(2); 
    
}
```
Ab humare pass humare 2 nodes ready hogaye hain.Pehle wale ka address maan lete hain 100 i.e. n1 ka address 100 hain uske andar value hain 1 and NULL.
Similarly, n2 ka address 780 hain uske andar value hain 2 and NULL.

Ab what we want is,humm dono nodes ko connect krna chahte hain.
Connect krne ke liye kya krna hoga??
n1 ke "next" mein i.e. pointer mein 780 daalna hoga.Aisa likhte hi,humari node connect ho jaayegi.
Toh kaise daale aata hain?
n2 ka address is &n2(anpercent n2). Agar humne n2 ke aage andpercent nahin lagaya toh uska matlab humm poore n2 ke block ki baat kr rahe hain,jo ki hum nahin krna chahte.Ab yeh address hume daalna hain n1 ke next mein,so
```C++
n1.next = &n2;
```

Yeh upar wala line likhte hi 2 nodes connect ho jaayege.

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    //Statically

    Node n1((1));

    Node n2(2);

    n1.next = &n2;
}
```

AB itna sab sahi hain ceck krna hain toh yeh le
```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    //Statically

    Node n1((1));

    Node n2(2);

    n1.next = &n2;

    cout << n1.data << " " << n2.data << endl;

}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
1 2
```

Ab,if we say apna ll is like this 
1 -> 2 -> 3 -> 4.
It represents 1 jiske pass 2 ka address hain.2 jiske pass 3 ka address hain and so on.End mein 4 jiske pass null hain.

Ab humm iss linked list ki first node ko we call as HEAD.LAst wale ko bolte hain TAIL.

REMEMBER,Jabh bhi linked list banani hain,toh humme Head node ka address apne pass save krke rakhna hoga.Agar save nahin kiya toh poori LL lost hojayegi.Bcoz apne pass head ka address hoga.Next ke pass next ka,next ke pass next ka and so on.
First node is always HEAD and last node is TAIL.

Humme,n1 ka address apne pass save krke rakhna chaiye.

Address hain toh pointer mein jaana chaiye.But address kiska hain ?node ka na so datatype node.Uss ka naam apan head rakhege.

```C++
Node *head = &n1;
```

So humne head type ka pointer variable banaya jisme first node ka address save kr dia.

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    //Statically

    Node n1(1);

    Node *head = &n1;

    Node n2(2);

    n1.next = &n2;

    cout << n1.data << " " << n2.data << endl;

}
```

Dekh dhya se,jaise first node bana ,apan ne bana dia and nayi node nahin create ki hain,only address ek variable mein daala hain.
Remember head ek normal pointer variable hain 8 bytes ka.

Ab kya,abh sabh connect hogaye.Tail ka use baadme dekhege.

[Head -> n1 -> n2]

1)Head is just normal pointer variable jiske pass n1 ka addrss hain
2)n1 node jisme constructor ke wajah se NULL aaya tha uske baadme n2 ka address de diya.
Also, "n1.data" se uski value mil jaayegi node ke andar rakhi hui bcoz n1 hain toh ek object."n1.address" se adress print ho jaayegi . Similarly with n2.

Ab head se n1 ka data lena hain toh "head -> data"
Ab n1 node  se n1 ka data lena hain toh "n1.data"

Ab head se n1 ka address lena hain toh "head -> next"
Ab n1 node  se n1 ka address lena hain toh "n1.next"

Bcoz n1 object hain.head is pointer isliye we use "->".Arrow jaha point krega woh waha se utha laayega.

```C++
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
```

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
1 1
0x7ffd1c0adda0 0x7ffd1c0adda0
```
