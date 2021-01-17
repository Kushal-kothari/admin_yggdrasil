# DYNAMIC ALLOCATION

### ADDRESS TYPECASTING

In strings typecasting aasan thi.This is known as **Implicit TypeCasting**

int i = 65;
char c = i;
cout << c <<endl;

-----------------------

Ab pointer ke case mein aisa direct krna gaye toh nahin hoga error throw krega ,so we do **Explicit Typecasting**

int *p = &i;
char * pc = (char*)p;  //Explicitly batana padha compiler ko.

-------------------------------------------------------------

## REFERENCE AND PASS BY REFERENCE

### REFERENCE VARIABLES


 Explaination:

```C++
int i = 10;
int j = i;
j++;
cout << i << endl;
```
OUTPUT : 10 koi farak nahin pada. j mein changes se i ko koi farak nahin pada.Ab hum aisa bana sakte the jisse farak pade.
kyu?bcoz dono ki alag memory hain.


* Toh agar changes reflect krwane hain toh humme reference variable declare krna padega " **&**"(ampercent)

Use kaise kre ?
```C++
#include <iostream>
using namespace std;

int main(){
int i = 10;
int &j = i;
j++;
cout << i << endl;
}
```

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
11
```

So basically instead of writing
int i =10;
int j = i;

---------------
we will write

int i = 10;
int &j = i;     //(1)

### This means j is a reference variable. j  is just a reference to existing memory, j is not creating a new memory. j ke liye nayi memory allocate nahin hogi.j ke liye humm purani memory hi use kr rahe hain.(1) bata rha hain kaunsi memory use krni hain.

So here i and j dono same memory pe pohochne ke alag alag raaste hain.Nothing else.Kahin se bhi aake pohoch skte hain dono mein changes reflect hoge.

AB BAAT KRTE HAIN ISKI ZAROORAT KYU HAIN ?? 
W mean pehle se hi ek variable hain .abhi woh hi variable ka dusra naam . What is zaroorat ?

JAb hum function mein increment krte the toh main memory mein reflect nahin hote the.But through this reflect hoge.

```C++
#include <iostream>
using namespace std;

void increment1(int & n)
{
    n++;
}

void increment2(int n)
{
    n++;
}

int main(){
    int i = 10;
    increment1(i);
    cout <<"Refernce so increment from 10 to 11 :"<< i << endl;
    increment2(i);
    cout <<"NoRefernce so no increment: "<< i << endl;    
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
Refernce so increment from 10 to 11 :11
NoRefernce so no increment: 11
```
# THIS IS KNOWN AS PASS BY REFERENCE.PEHLE HUM HAR JAGAH PAR PASS BY VALUE KRTE THE .BUT ABHI WE DID PASS BY REFERENCE.EK HI VARIABLE KE DO NAAM HAIN.DUSRA NAAM I.E REFERENCE VARIABLE SIRF POINT KRTA HAIN USS ADDRESS KO.so SAMJH JA LAVDE ABHI 

-----------------------------------------

## DYNAMIC MEMORY ALLOCATION

AB DUE TO DYNAMIC MEMORY LOCATION HUM ARRAY KI SABSE BADI PROBLEM SOLVE KR PAYEGE.KYA?

Whenever we were giving an array we were suppose to declare it fixed.Eg: 

int arr[20];

We wre not able to make variable sized array .We were mking fixed size array.

LISTEN:
int n;
cin >> n;
int a[n];

YEH TO POORA GALAT HAIN BCOZ APAN RUNTIME PE BOL RAHE HAIN KI HUMEIN KYA SIZE KA ARRAY CHAIYE.

------------------------------

WHAT WE WANT IS COMPILE TIME PE ARRAY KA SIZE AND NOT AT RUNTIME.

----------------------------

There is something known as Stack and Heap.Stack chota hota hain and heap bada.Program run krne se pehle stack mein sabh initialize hota hain .Choti si memory hoti hai .Ab agar humne runtime pe array de diya woh bhi stack mein jaayega aur usme memory nahin hui toh problem hain bro.

### Abtak apan ne jitni bhi programming ki usme apan ne heap ka istemaal nahin kiya
int i = 10; // yeh stack mein jaayega

## So heap mein daalne ke liye we use keyword **new** .

new int ; Yeh heap mein humare liye integer banayega

Ab humein issme value 10 daalna hain but kaise daale ?
Koi tarika hi nahin hain bcoz 
int i = 10; yaha par toh naam hain integer

Ab jo heap mein memory hoti hain uska naam nahin hota .Toh usse access krege?
Answer -> new int humme address lake dega jo allocate hua hain.
SO "new int" MEMORY KA ADDRESS LAAKE DETA HAIN AND MEMORY KA ADDRESS STORE KREGE POINTER MEIN
SO,
    int * p = new int;

Yeh kya karega ? -> It will going to create 4 bytes in heap and apna pointer uska address store kr raha hain.  Toh abhi koi changes krna hain toh krdo
    * p = 10;
Isne kr diya dereference.

```C++
#include <iostream>
using namespace std;

int main()
{
    int *p = new int;
    *p = 10;
    cout << *p << endl;
}
```

Ab iska array mein bohot important hain bcoz pehle array jab hum banate the let's say size 50 ka phir user sirf 5 hi use krta tha baaki memory waste ho jaati thi. 

So hum dynamically allocate krege new keyword use krke.

Eg:
```C++
int n;
cin >> n;
int* arr = new int[n];
//Abhi iske baa jaise pehle array use krte the same waise hi
arr[0] = 10;
```

Example of Dynamic Allocation in an array:

Remove maximum in an array.

```C++
#include <iostream>
using namespace std;

int main()
{
    int n;
    cin >> n;
    int * arr = new int[n];    //(1)
    for(int i = 0 ;i<n;i++)
    {
        cin >> arr[i];
    }
    int max = -1;
    for(int i=0;i<n;i++)
    {
        if(max<arr[i])
        {
            max = arr[i];
        }
    }
    cout << max;
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
5
1 2 3 4 5
```

Explaination: assume n = 50,kitne memory store ho rahi hain uss line pe ?
50*4 = 200 bytes in heap and 8 bytes ka pointer in stack.

-----------------------------------------------

NOW ONe MORE IMPORTANT THING between STATIC AND DYNAMIC ALLOCATION IS SCOPE of variable

```C++
int main{
    if(){
        int i = 10;
    }
}
```

i ka scope iss if block ke andar hi khatam ho jata hain.uski memory GAYAB.
But in dynamic allocation aisa nahin hoga.

```C++
while(true){
    int *p = new int;
}
```
Yeh loop jab tak true hain tab tak (int *p i.e stack) pe toh scope khatam hoga naya banta rahega but not in dynamic wala part.Usme scope ka logic hi nahin chalta
Pehli baat toh yeh uska naam hi nahin hain.Naam nahin toh scope nahin 
So pehli iteration mein dynamic ki jo 4 byte bani hain woh wait krti rahegi ki kab zarorat padegi.
Agli baar loop mein aaye 4 byte aue bann jayegi and so on and so forth and it will keep increase our memory and finally wo crash ho jaayega.

------------------------------------

So humne yeh samjha ki static mein scope or naam se memory release ho jaati hain

IN DYNAMIC HUMME MANUALLY RELEASE KRNI PADTI HAIN MEMORY KO.BUT HOW?

#### use keyword "delete (address)"

Eg:
```C++
int * p = new int;
delete p;
```
Yeh krte hi 4 bytes heap pe saaf hogi.Stack delete nahin hua woh scope khatam hoga tabh khatam hojayegi.

---------------------------------------------------

## DYNAMIC ALLOCATION OF 2D ARRAYS

Hum heap mei integer bhi store kr skte hain.Integer ka array bhi store kr skte hai.Now we are going to talk about 2D Arrays.
Sadly  = new int[10][10] aisa koi syntax nahin hain. 

Maan lo humein 10 by 20 ka array banana hain i.e 10 rows and 20 columns banana hain 
So effectively there are 10 arrays each of size 20.TOh apne ko 10 array banana hain

Jab pehla array banayege toh int * banega
Jab dusra array banayege toh int * banega
Jab tesra array banayege toh int * banega

Ab yeh sabh apan stack pe nahin heap pe banana hain bro.

So idea yeh hain ki apan pehle array banayege integer pointer ka i.e. int* ka
Phir woh array baaki saare array banayega.

Toh ab question hain ki integer array kaise store karein?

Answer:
### int** p = new int* [10];
### p[0] = new int[20];
### p[1] = new int[20];
### p[2] = new int[20];
### p[3] = new int[20];

Ofcourse aisa nahin krege for loop lagayege

Ab element ko access kaise krege?
p[4] matlab 4 th row mein pohoch gaye
p[4][5] matlab 4th row mein 5th column pe pohoch gaye

```C++ Eg of 10 rows and 20 column
#include <iostream>
using namespace std;

int main()
{
    int** p = new int*[10]; //2d array ke 10 row bane
    for(int i = 0;i < 10;i++)
    {
        p[i] = new int[20]; //2d array ke 20 column bane
        
    }
}
```

Ab lets say user se m row and n columns lene hain.
```C++
#include <iostream>
using namespace std;

int main()
{
    int m,n;
    cin >> m >> n;
    int** p = new int*[m]; //2d array ke 10 row bane
    for(int i = 0;i < m;i++)
    {
        p[i] = new int[n]; //2d array ke 20 column bane
        for(int j = 0;j<n;j++)
        {
            cin >> p[i][j];
        }
    }
}
```
 _
| |  --> [________]
| |  --> [________]
| |  --> [________]
| |  --> [________]
|_|  --> [________]


--------------------------------------------
Now we can even make 2D arrays which are variables means ragged jagged kisime ek column kisime 5 etc 

--------------
Abhi yeh sabh toh apan ne heap mein allocate kiya hain isse deallocate bhi toh krna hain toh kaise karein?

delete[] p;
yeh kiya toh sirf row hi delete hoge so
```C++
for(int i = 0; i< n;i++)
{
    delete [] p[i];
}
delete []p;


Example:
```C++
#include <iostream>
using namespace std;

int main()
{
    int m,n;
    cin >> m >> n;
    int** p = new int*[m]; //2d array ke 10 row bane
    for(int i = 0;i < m;i++)
    {
        p[i] = new int[n]; //2d array ke 20 column bane
        for(int j = 0;j<n;j++)
        {
            cin >> p[i][j];
        }
    }
    for(int i = 0; i< n;i++)
    {
        delete [] p[i];
    }
    delete []p;
}
```



---------------------------------------------------------

## MACROS AND GLOBAL VARIABLES

We used this to help us wite better code.For better Optimization.

pi ki jagah 3.14 likhneka .

```C++
#define 
```
```C++
#include <iostream>
using namespace std;
#define PI 3.14

int main()
{
    int r;
    cin >> r;
    cout << PI *r*r << endl;
}
```
## NOW LET's DISCUSS ABOUT GLOBAL VARIABLES.sabse upar likh do.but dont use it bcoz koi bhi function ne change kr dia baaki sabh change ho jaata hain.

-----------------------------------------------

# INLINE FUNCTIONS

Jab if-else krna hota hain tabh apan krte hain

if(a>b){
    c = .....
}else{
    c = ....
}

But instead of that we can and should always use **TERTIARY OPERATOR** 

```C++
int c = (a > b)? a: b ;
```

Example:
```C++
#include <iostream>
using namespace std;

int main(){
    int a,b = 10,20;

    int c = (a > b) ? a : b ;
    cout << c;

    int x,y;
    x = 12;
    y = 34;

    int z = (x > y) ? x : y;
    cout << z;
}
```

Ab baat yeh hain ki is ek line ko likhne ke liye bhi ek sec ke liye sochna padh raha hain.And har baar use krne ke liye sochna padh raha hain.So kyu na apan iska function bana lete hain.

```C++
#include <iostream>
using namespace std;

int max(int a,int b)
{
    int c = (a > b) ? a : b ;
    return c;
}


int main(){
    int a = 10;
    int b = 20;
    int m = max(a,b);
    cout << m;
}
```
But abhi mast code readable hain mast chal raha hain but abhi bhi ek problem hain ki hamesha upar function mein jaana hain run krna hain niche aana hain.We dont want this so here we introduce **INLINE FUNCTIONS** .

jaise apan variable ko declare krte hain 
lets say int a = 10;
toh compiler runtime pe a ki jagah 10 laga deta hain waise hi hum functions ke saath bhi kr skte hain during runtime by using INLINE functions.

```C++
#include <iostream>
using namespace std;

inline int max(int a,int b)
{
    return (a > b) ? a : b ;
}

int main(){
    int a = 10;
    int b = 20;
    int m = max(a,b);
    cout << m;
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
20
```
------------------------------------------------------------

## DEFAULT ARGUMENTS

function ko agar kam argument dena hain yaa koi occasionally hi change hota hain toh use default argument.kuch nahin aasan hain function ke argument ko default value dena hain.

```C++
#include <iostream>
using namespace std;

inline int max(int a,int b = 100) 
{
    return (a > b) ? a : b ;
}

int main(){
    int a = 10;
    int b = 200;
    int m = max(a);  //ek hi argument dena hain
    cout << m;
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
100
```

```C++
#include <iostream>
using namespace std;

inline int max(int a,int b = 100) 
{
    return (a > b) ? a : b ;
}

int main(){
    int a = 10;
    int b = 200;
    int m = max(a,b);  // abhi 200 diya 
    cout << m<< endl;
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
200
```
--------------------------------------------------------

# CONSTANT VARIABLES

keyword is **const** . A the name suggests it makes thing constant 
```C++
const int i  = 10;  // or int const i = 10; dono chalbo
```
Ab yeh variable change nahin hoga.Ab yeh toh chindi hain. 
Ab iska intresting part dekhte hain.

```C++
#include <iostream>
using namespace std;

int main(){
    int j = 12;   //iske pass read and write path hain toh     yeh              dusre ko access de skta hain 
    const int & k = j; //isne yaha pe access diya read ka
    j++;
    cout << j << k;
}
```
Ab const se sirf path constant ho raha hain in above code not the value itself.Ab apan k ke through jaake change nahin kr skte par j ke through jaake kr rahe hain.The storage is not constant.The path is constant.

CASE 2 :
```C++
#include <iostream>
using namespace std;

int main(){
    const int j = 12;//iskepass declare krne ke baad sirf read kr skta hain write nahin
    int & k = j; //yeh kya isse read and write access dega mujhe fuckoff 
    j++;
    cout << j << k;
}
```
Upar wala code mein error hain read comments .



