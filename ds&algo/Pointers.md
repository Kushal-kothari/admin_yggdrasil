kushal's notes
agar 
int a =100 bola toh
a -> 100
&a -> assume 0x700 adress

ab
*p = a;
toh cout << *p; //100 hoga
cout << p // &a hoga 

box bana phir kr aasan hain

-------------------------------------

# int *p //pointer declaration
# p //pointer kaha point kr raha hain
# *p // pointer jaha point kr raha hain woh value(Dereference)


# POINTERS

Explaination: -> int i=10 toh i ka 4 byte hogaya memory mein
i=i+5;
cout << i ;
ab memory mein thodi i hain .Toh kya hota hain ?
i ko ek address milti hain jo jaake lets say i-> 7000 mein store hain toh jab i call hoga system dekhega where is this variable actually stored in memory tabh 7000 call hoga.Itna hi nahin "int" bhi store krta hain.

Aise hi j bhi store hota hain k store hota hain.
Yeh sabh store hote hain symbol table mein.

Ab "i" kisi storage mein store ho raha hain.Uss storage ka koi address hain.Usko hum find kr skte hain !

### Uske liye ek operator hota hain **&i**

```C++
#include<iostream>
using namespace std;
int main(){
    int i;
    cout << &i;
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
0x7ffe4e215734kushal@kushal:~/Desktop/C++/test$ 
```

Yeh address hexadecimal address hain. bcoz of "0x"
0 -> f (15)

-------------------------------------------------------

## AB JAISE HUM INTEGER KO int MEIN STORE KRTE HAIN CHAR KO char MEIN STORE KRTE HAIN WAISE HI HUM ADDRESS(&i) KO BHI STORE KR SKTE HAIN.

## USS TYPE KE VARIABLES KO POINTERS BOLTE HAIN. SO POINTERS ARE VARIABLES WHICH STORES ADDRESS OF OTHER VARIABLES.

HOW TO DECLARE POINTERS?

pointer p = &i; -> yeh wrong hain

int *p = &i -> yeh write hain

* ab aage int kyun? bcoz i integer hain
* agar char hua toh char p = &c;
* HOW TO READ?  int*p   -> p ek integer ka pointer hain.
* int *p =&i -> p ek integer ka pointer hain jisme i ka address store kiya hain.

EXAMPLE

```C++
#include<iostream>
using namespace std;

int main(){
    int i;
    cout << &i << endl;
    int *p = &i;
    cout << p;
}
```
```t
kushal@kushal:~/Desktop/C++/test$ ./hello
0x7ffe3c45c82c
0x7ffe3c45c82c
```

As expected address of i and p are basically the same thing bcoz humne p ko address of i ke andar store kr diya.

# DETAILS
(assume i ka address 7000 hain)
int i = 10;
i kya hain ?
-> i ek tarika hain jisse apan ko pata chal pata hain 10 kaha stored hain and usko access kr pate hain.

So int i likhne pe humme 4 byte ka storage mila hain and i likhne pe hume pata chalta hain ki yeh cheez kaha stored hain

So i ek tarika hain jisse humein pata chalta hain ki yeh cheez kaha stored hain and usko access kr pate hain.
So int i likhne pe humein 4 byte ki space mili and i ke through iss space ke address ko access kr skte hain.
Yeh hua ek tarika. 

int * p = &i;

## BUT JAISE HI POINTER AAYE p KE PAAS BHI ADDRESS HAIN KI YEHH KAHA PE STORE HAIN.TOH HUM STORAGE PE P KE THROUGH BHI POHOCH SKTE HAIN.

SO we have 2 ways.Yaa toh variable ka naam use krlo .Symbol table se pata chal jaayega kaha store hain
Ab pointer ke andar address aise hi hain toh directly access krlo.

Now agar pointer se integer access krna hain so use ***p**
Yeh tabhi use krna hain jab humare pass address hain.

# *p ko bilkul integer ki tarah treat kr skte hain hum.Sabh wahin increment decrement ho skta hain.

Eg:
int * q = p;
*q++;

sabh possible hain.

Aadat daaldo ki jab bhi pointer ko declare karo toh usse o se initialise krdo.

-------------------------------------------------------

## POINTER ARITHMETIC OR HOW POINTER WORKS ON OPERATORS.

```C++
#include<iostream>
using namespace std;

int main(){
    int i =10;
    int * p = &i; //1
    cout << p << endl;
    p = p + 1;
    cout << p << endl;
}
```
Abhi (1) bol raha hain pointer p is pointing towards the address of i.

Abh hum address ko increment kr rahe hain? I mean yeh kya bakchodi hain.But hota hain aur ekdum mazear hota hain.

0x7000 samajh address hain toh normally ek byte hona chaiye i.e 0x7001 
But nahin 0x7004 bcoz compiler assume krta hain tumhe next place mein jaana hain toh direct sizeof mein move krta hain.

So increment krne par woh size of bytes jitna increment hota hain bro ie 4 bytes. in int ke case mein
double mein 8 bytes.

Ab operators se >, < sabh kr skte hain but iska main application hain in array jaha increment and decrement use hoga.

# ARRAY WITH POINTERS

bcoz jab hum p = p + 1 kare toh we want to make sure ki jo space banaya woh humara hain woh humara integer hain.

Explaination -> int a[10];
Iska mtlab kya hain?
This creates 40 bytes of array for us.What is "a". a is basically name for this 40 bytes.

Ab a and a[0] dono ka address same hain boz a[0] is starting element of a.

Eg:
```C++
#include<iostream>
using namespace std;

int main(){
    int a[10];
    cout << a << endl;
    cout << &a[0] << endl;
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
0x7ffc1213d4b0
0x7ffc1213d4b0
```
SO "a" is BASICALLY THE ADDRESS OF a[0].

## so a is effectively the address of a[0].( &a[0] )

What does this mean ??

So agar apan ne *a print kiya toh it will behave as a[0].Not exactly thode se differences hain but woh baadme dekhege.

```C++
int main(){
    int a[10];
    int a[0] = 5;
    cout << *a << endl;
    cout << a << endl;
}

```
Ab address pe thodi arithmetic krte hain.Agar address ko humne 1 increment kiya toh hum 4 byte aage pohoch jaayege.

Agar humne usse dereference kiya toh aage wala array print hoga i.e. a[1]

so agar a+1 kiya toh address aayega 4 byte extra milake aur agar isse apan pointer bana de toh mil jaayega uss array ki value.

```C++
#include<iostream>
using namespace std;

int main(){
    int a[10];
    a[0] = 5;
    a[1] = 10;
    cout << a << endl;
    cout << (a+1) << endl;    
    cout << *a << endl;
    cout << *(a+1) << endl;
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
0x7ffd2829cc10
0x7ffd2829cc14
5
10
```

## SO effectively: *(a+1) -> a[1]
##                 *(a+i) -> a[i]  system yahi krta hain.

IMP EXAMPLE:
Assume address of 0th index of array 'a' is 200.
What is the output -
int a[6] = {1, 2, 3};
int *b = a;
cout << b[2];

Options
Error
3 
1
200
212

Answer is -> 3.


Now differences kya hain ??

Main differences jiske wajah se saare differences aane wale hain !

# 1) Size
int a[10]; 
lets assume address is 700
-> toh a 700 se 40 byte ki memory ho jayegi. a ko print kiya toh 700 print krdega which is address of 0th element .Par humare pass alag se 8 bytes nahin hain jo pointer ke case mein hoti thhi.

In case of pointer, hum alag se 8 bytes banate the uska naam jo bhi humne rakha tha let's say 8 and uske corresponding alag se ek entry hoti thi ki yeh pointer kaha pe stored hain.Bas yahi diffference will lead to all the differences.Therefore pointer p ke liye 8 bytes bana tha array ke case mein aisa nahin tha usme toh chupchap 40 bytes bani thi. 

# 2) &(AND OPERATOR)
Agar apan pointer p bana rahe hain toh &p mein bhi toh koi address hoga lets say woh hain 900
Toh &p pe 900 hoga and &a pe 700 hain

WHAT's INTRESTING?
cout << a << endl; OUTPUT -> 700
cout << &a << endl; OUTPUT -> 700 

dono mein same print hoga.
a = a +3 nahin kr skte bcoz symbol table mein ek baar jo chalegaya woh change nhain ho skta pointer ke saath masti kro but not here
Mtbl yeh hain ki array cannot be reassigned.Pointer reassigned ho skta hain.


------------------------------------

# CHARACTERS POINTERS

Yeh thoda differently behave krte hain.

Let's see: ek integer array and ek character array hain
int a[] = {1,2,3};
char c[] = "abc";

in dono ko print krke dekhege

```C++
#include<iostream>
using namespace std;

int main(){
    int a[] = {1,2,3};
    char b[] = "abc";
    cout << a<< endl;
    cout << b << endl;
}
```
```T
kushal@kushal:~/Desktop/C++/test$ ./hello
0x7ffd96c4e4a8
abc
```
ab char ke time pointer actually uss array pe jaayega aur array ke content ko print krdega jab tak usse null character nahin dikhta

Yeh kyu? Bcoz cout thoda differently implemennted hain for character arrays and pointers ke liye.

Abh 

-------------

```C++
#include<iostream>
using namespace std;

int main(){
    char b[] = "abc";
    cout << b << endl;
    char * c = &b[0];
    cout << c << endl;
}
```
With the above code we were expecting ki isse character ka address mil jaye but aisa nahin hua.
```T
kushal@kushal:~/Desktop/C++/test$ ./hello
abc
abc
```
---------------------------------------------

# POINTERS AND FUNCTIONS

How does pointers and functions work together ? 
hum function mein array bhej skte the ,integer character send krte the.Kya hum pointer send kr skte hain.

Chalo banate hain !

```C++
#include<iostream>
using namespace std;

void print(int * p)  // mujhe pointer do aur mein integer print krduga jaha yeh pointer oint kr raha hain
{
    cout << *p << endl;  //usse dereference krke mein number print krduga
}

int main(){
    int i = 10;
    int *p = &i;
    print(p); //jaise hum integer pass krskte the toh int p likhte the
             //vaise hi hum upar dekh pointer pass krdiye int *p(star p)

}
```

## ABHI YEH JO HAIN EKDUM IMPORTANT JABRI IMPORTANT

Lets create increment pointer function.Jo pointer input leta hain. p ko p + 1 krta hain bas.
Now the question is agar hum increment pointer pass krne se pehle address print krte hain and baadme bhi.

```C++
#include<iostream>
using namespace std;

void incrementPointer(int *p)
{
    p = p + 1;
}

int main()
{
    int i = 10;
    int *p = &i;

    cout << p << endl;
    incrementPointer(p);
    cout << p << endl;
}
```


CHANGES HOGA KI NAHIN ?(I meant increment hoga ki nahin ? )

Answer is NOOOOOOOOooooooooooo

How ?
PASS BY VALUE HOTA HAIN WHEN WE SEND PARAMETERS IN FUNCTION
PASS BY VALUE HOTA HAIN TOH WAHAN PAR EK NAYA "p" BANA

int main ki memory and apne function ki memory alag.

Toh humne  p ki copy bana ke function ko bhej di

Humare pass lets say address 0x1000 tha humne iski copy banai aur function ko send krdi ab jo bhi changes ho raha hain woh udhar ho raha i.e waha ka address 0x1004 ho jaayega bilkul jaise integer change nahin hota tha in function **waise hi ekdum same** humare pointer change nahin hoga .Uss function mein hoga but main mein nahin hoga bcoz humne copy/cheat banake yahan bhej di hain humare function mein
YEH PASS BY VALUE HAIN TOH KOI FARAK NAHIN PADTA.

<img src = "https://images/pointers1.jpeg">

# int *p //pointer declaration
# p //pointer kaha point kr raha hain
# *p // pointer jaha point kr raha hain woh value(Dereference)



## DUSRI IMPORTANT CHEEZ remember the above points

iss baar hum apan pointer ke value ko increment krege dekhte hain changes hota hain ki nahin.

```C++
#include<iostream>
using namespace std;

void increment(int *p)
{
    ( *p )++;
}

int main()
{
    int i = 10;
    int *p = &i;

    cout << *p << endl;
    increment(p);
    cout << *p << endl;
}
```
Ab main mein jo pointer p hain and uska address 7000 tha uski copy gayi increment function mein. (TOh gaya pointerr p and address)
Ab function bolta hain address pe jo value hain woh jaake increment kr dete hain.TOh woh address 7000 pe jaayega aur uspe padi value change krdege toh har jagah change reflect hogi bro.

-------------------------------------------------

# FUNCTIONS AND ARRAYS


```C++
#include<iostream>
using namespace std;

int sum(int a[],int size)  //(2)[ int a[] ]
{
    
}

int main()
{
   int a[10];
   cout << sum(a,10) << endl;  //(1)[a]
}
```

Ab yeh hain na thoda fraud hain humne jo likha hain.AIsa nahin hota jo hum kabse kr rahe the .Chal jaayega yeh aisa nahin hain ki yeh nahin chalega but problem kya hain?

Jab hum array bhej rahe hain (1) pata hain kya ho raha hain woh upar as a pointer jaa raha hain array ki tarah jaa hi nahin rha. Upar jaake 8 byte aayegi size nikal ke dekh lege.

Niche size nikalege toh 40 aayega upar 8 aayega

```C++
#include<iostream>
using namespace std;

int sum(int a[],int size)
{
    cout << sizeof(a) <<endl;
    return 0;
}

int main()
{
   int a[10];
   cout << sizeof(a)<<endl;
   cout << sum(a,10) << endl; 
} 
```
```T
kushal@kushal:~/Desktop/C++/test$ ./hello
40
8
0
```
SO IF WE WANT WE CAN WRITE IT LIKE THIS 

int sum(int * a, int size)
{
    ---------   
}

bcoz jaa toh raha pointer hain toh pointer hi pass krwa dete hain.

-------------------------------------------------------------

SMALL DISCUSSIONS

Yaar pointer itna complicated kyu hain ?
Eg:
integer ka address daalna hain toh int *p = &i likhna padta hain

Why not just pointer p = &i; ???
Ab okay upar waaala kr diya address store ho gaya ,koi issue nahin hain. Character array store krna hain ,integer array store krna hain usme kya hi farak padta hain
But agar yeh kr dia toh derefernce krne ke time humme pata hi nahin address integer type ka hain,character type ka hain
Agar woh nahin pata toh woh bhi nahin pata kitni bytes read kre kaise interpret kre. Wo sirf data ko point kr raha hain.

## DOUBLE POINTERS

Storing address of other pointers.

Jo pointer bann raha hain uska bhi toh address hoga ,apan wo bhi store kr skte hain.

int *p = &i;

[
Ab syntax yeh kehta hain ki jiss type ka variable store kr rahe ho usko aage likh do.

(var *p = & i ;)

]

So double pointer mein toh pointer ka address store kr rahe hain toh aage (int*) aayega.

----------------------------------
Therefore,

int* *p2 = &p;

----------------------------------

```C++
#include<iostream>
using namespace std;

int main(){
    int i = 10;
    int * p = &i;
    int ** p2 = &p;
    cout << p2 << endl;
    cout << &p << endl;

    
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
0x7ffff36b4078
0x7ffff36b4078
```

```C++
#include<iostream>
using namespace std;

int main(){
    int i = 10;
    int * p = &i;
    int ** p2 = &p;
    cout << p2 << endl;
    cout << &p << endl;

    cout << p << endl;
    cout << *p2 << endl;
    cout << &i << endl;

    cout << i << endl;
    cout << *p << endl;
    cout << **p2 << endl;   //ek baar star lagaya p pe phoch gaye 
                            // ek aur star lagaya i pe pohoch gaye

}
```

```T
kushal@kushal:~/Desktop/C++/test$ ./hello
0x7fffc1b44698
0x7fffc1b44698
0x7fffc1b44694
0x7fffc1b44694
0x7fffc1b44694
10
10
10
```



























