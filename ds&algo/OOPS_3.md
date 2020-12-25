# OPERATOR OVERLOADING AND DYNAMIC ARRAY CLASS

### OPERATOR OVERLOADING 1:

Operator OverLoading -> hum kisi bhi pre-existing operator ke functionality ko extend kr skte hain such that it will work for our user defined classes also.

Pehle codes mein apan ne fraction class banai thi.If we want hum humare functions ko add kr paaye using '+' operator we can't do that.

Humne 2 objects banaye.Ab humme in 2 object ko add krna hain using this '+' operator.Aur uska resukt recieve krna hain kisi F3 mein
F3 = F1 + F2

Here we can't do this.
Jaise humm integer variables mein kr skte the
int c = a + b; yeh kr skte hain as a nd b are 2 integer variables hain jo already declared and defined hain.
Aisa hum fraction class ke saath nahin kr paayege bcoz the plus operator is not defined for our class.It is only defined for integers and doubles.

So we want ki hum humari plus operator ki functionalities ko thoda extend kree, so that woh humare fraction class ko bhi add kr paaye.

This process is known as Operator Overloading.Ab humme yahin seekhna hain ki hum kaise apne operators ko overload krke usse use kr skte hain apne user defined classes mein.

```C++
class Fraction{

    private:

    int numerator;
    int denominator;

    public :

    Fraction(int numerator,int denominator){
        this -> numerator = numerator;
        this -> denominator = denominator;
    }

    void print(){
       cout << numerator << " / " << denominator << endl;
    }

    void simplify(){
        int gcd = 1;
        int j = min(this -> numerator, this -> denominator);
        for(int i=1;i<=j;i++){
            if(this->numerator % i == 0 && this->denominator % i ==0){
                gcd = i;
            }
        }
        this -> numerator = this -> numerator/gcd;
        this -> denominator = this -> denominator/gcd;        
    }

    void add(Fraction f2){
        //calculating lcm
        int lcm = denominator * f2.denominator;
        int x = lcm / denominator;
        int y = lcm / f2.denominator;

        int num = x*numerator + y*f2.numerator;
        //ab answer aa gaya hain num/lcm
        //----------------
        //ab iso firse f1 mein dalte hain
        numerator = num;
        denominator = lcm;

        simplify();
        //simplify krega 70/4 ko 35/2 krega
        /*also issline pe apan ne direct function call kiya ,object dot nahin likha,to same iska matlab hain this ke upar simplify call krdo.taha par this f1 tha toh f1 pe call chala jaayega.*/
    }

};
```
```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(15,4);

    f1.add(f2);

    f1.print();
    f2.print();
}

```

Upar jo code hain direct copy paste kiya hain OOPS_1 se.

Yahan parr add functions ki help se humm 2 functions ko add kr paaye.
f1.add(f2);
Yeh krne ke baad hum final result f1 mein hi daal dete the.
Yeh addition humare "add" function ke through ho rha tha. 

Ab humm chahte hain woh naya F3 banaye jo dono ko add krke return krde.

So we did some changes in the code see:

```C++
class Fraction{

    private:

    int numerator;
    int denominator;

    public :

    Fraction(int numerator,int denominator){
        this -> numerator = numerator;
        this -> denominator = denominator;
    }

    void print(){
       cout << numerator << " / " << denominator << endl;
    }

    void simplify(){
        int gcd = 1;
        int j = min(this -> numerator, this -> denominator);
        for(int i=1;i<=j;i++){
            if(this->numerator % i == 0 && this->denominator % i ==0){
                gcd = i;
            }
        }
        this -> numerator = this -> numerator/gcd;
        this -> denominator = this -> denominator/gcd;        
    }

    Fraction add(Fraction f2){
        //calculating lcm
        int lcm = denominator * f2.denominator;
        int x = lcm / denominator;
        int y = lcm / f2.denominator;

        int num = x*numerator + y*f2.numerator;
        // numerator = num;
        // denominator = lcm;
        Fraction fNew(num,lcm);
        fNew.simplify();
        return fNew;
    }
};
```
```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(15,4);
    Fraction f3 = f1.add(f2); //(1)shayad yeh copy operator hain
    f1.print();
    f2.print();
    f3.print();
}

```
Here we just changed the structure of our code.Making new fraction rather than updating purana fraction.

---------------------------------------
Ab yaar humme (1) mein jo add hain,woh use nahn krna hain.humme toh plus use krna hain.Functionality same honi chahiye.

Aasan hain koi major changes nahin hain sirf ek line ka change use keyword "operator" and "jo operator chaiye woh use kr".

Before:
```C++
    Fraction add(Fraction f2){
        //calculating lcm
        int lcm = denominator * f2.denominator;
        int x = lcm / denominator;
        int y = lcm / f2.denominator;

        int num = x*numerator + y*f2.numerator;
        // numerator = num;
        // denominator = lcm;
        Fraction fNew(num,lcm);
        fNew.simplify();
        return fNew;
    }
```

After:
```C++
    Fraction operator+(Fraction f2){
        //calculating lcm
        int lcm = denominator * f2.denominator;
        int x = lcm / denominator;
        int y = lcm / f2.denominator;

        int num = x*numerator + y*f2.numerator;
        // numerator = num;
        // denominator = lcm;
        Fraction fNew(num,lcm);
        fNew.simplify();
        return fNew;
    }
```

Bas so easy dekha.

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(15,4);
    Fraction f3 = f1 + f2;
    f1.print();
    f2.print();
    f3.print();
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
10 / 2
15 / 4
35 / 4
```

Chindi,laga ke bindi,kya kl hain hindi?

----------------------------------------
Explaination:

Fraction f3 = f1.add(f2);
Ab before mein: f1 toh this mein pass ho raha tha.f2 ko hum this mein pass krte the.Aisa hi hota hain na
So first waala this mein chala jaata hain.Second waala argument mein chala jaata hain.

Ab humein operator use krne ke time use krege:
Fraction f3 = f1 + f2;
Aisa likhne se function call ho jaayega operator plus "+". Operator ke pehle ka jo operand hain (here it is f1) uska address this mein chala jaayega.f2 ka address humm argument mein pass krni hogi.

Similarly for multiply operator too.

```C++
    Fraction operator*(Fraction f2){
        int n = numerator = numerator * f2.numerator;
        int d = denominator = denominator * f2.denominator;
        Fraction fNew(n,d);
        fNew.simplify();
        return fNew;
    }
```


Similarly for boolean operator

```C++
bool operator==(Fraction f2){
    return (numerator == f2.numerator && denominato == f2.denominator);
}
```

Final Code

```C++
class Fraction{

    private:

    int numerator;
    int denominator;

    public :

    Fraction(int numerator,int denominator){
        this -> numerator = numerator;
        this -> denominator = denominator;
    }

    void print(){
       cout << numerator << " / " << denominator << endl;
    }

    void simplify(){
        int gcd = 1;
        int j = min(this -> numerator, this -> denominator);
        for(int i=1;i<=j;i++){
            if(this->numerator % i == 0 && this->denominator % i ==0){
                gcd = i;
            }
        }
        this -> numerator = this -> numerator/gcd;
        this -> denominator = this -> denominator/gcd;        
    }

    Fraction operator+(Fraction f2){
        //calculating lcm
        int lcm = denominator * f2.denominator;
        int x = lcm / denominator;
        int y = lcm / f2.denominator;

        int num = x*numerator + y*f2.numerator;
        // numerator = num;
        // denominator = lcm;
        Fraction fNew(num,lcm);
        fNew.simplify();
        return fNew;
    }


    void multiply(Fraction f2){
        numerator = numerator * f2.numerator;
        denominator = denominator * f2.denominator;
        simplify();
    }    

    Fraction operator*(Fraction f2){
        int n = numerator * f2.numerator;
        int d = denominator * f2.denominator;
        Fraction fNew(n,d);
        fNew.simplify();
        return fNew;
    }
    bool operator==(Fraction f2){
        return (numerator == f2.numerator && denominator == f2.denominator);
    }


};

```
```C++
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
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
10 / 2
10 / 2
10 / 1
25 / 1
Equal
```

Ab we also know about constant functions.So all 3 are and should be marked constant bcoz woh khudko proprty mein koi change nahin kr rahe dusra variable banakar change kr rahe hain.

-------------------------------------------------

Now we will learn how to overload few more operators !

Previously we worked on all the binary operators.i.e. unn operators ko work krne ke liye 2 operands ki zaroorat hoti hain.First operand this mein pass hojata hain and second waala argument mein pass hota hain.

But now we will work on Unary operator.i.e ek hi operator ki requirement hain. i.e. ++f1;

So,in this case humara yeh operand "this" mein hi pass ho jaayega.Humme argument dene ki zaroorat nahin hain.


First wait thoda clear krte hain apna kachra : 

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(10,2);
    //Fraction f3 = f1 + f2;

    f1.print();
    ++f1;
    f1.print();
    Fraction f3 = ++ f1;
    f3.print();
}
```
```C++
    void operator++(){  //void
        numerator = numerator + denominator;//by default
        //this->numerator =this->numerator + this->denominator;
        simplify();//kuch nahin bola toh bydefault this pe call hoga.
    }
```
So we got the correct error which is "no viable conversion from void to Fraction"
     Fraction f3 = ++ f1;
                   ^~~~~
Aisa kyu hua??
error keh raha hain jo f1 function hain uska return type to void hain na .Ab jab yeh function kuch return hi nahin kr raha hain toh hum uski value ko f3 mein kaise assign kr skte hain. Hum toh kr hi nahin skte assign.We have already studied in function class ki jab bhi function ka call void hota hain,humme usse directly call krna hota hain.Left hand side mein hum koi value recieve nahin krte.Same is happening here
Ab humne void banaya toh woh kuch return hi nahin krta toh yeh galat hain.

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
helloworld.cpp: In function ‘int main()’:
helloworld.cpp:13:19: error: conversion from ‘void’ to non-scalar type Fraction’ requested
     Fraction f3 = ++ f1;
                   ^~~~~
```

Fraction f3 = ++f1;

toh first f1 should update and then f3 mein f1 ka content aajana chaiye.We mean to say ek copy bann jani chaiye f1 ki.

eg: f1 ke block mein N = 10 and D = 2 rakha tha .Increment krne ke baad usme simplify ke baad N = 6 and D = 1 aagaya.

ab we will copy the value in f3.But the thing is humme iss poore ke poore object ko hi return krna padega tabhi hum value ko copy kr paayege.
Kaise? chalo dekhte hain !
What we want to return ? -> f1 ka poora i.e object ka poora content return hoo jayein.Ab iss function see below mein hum f1 ko toh nahin jaante but ?

```C++
    void operator++(){
        numerator = numerator + denominator;//by default
        //this->numerator =this->numerator + this->denominator;
        simplify();//kuch nahin bola toh bydefault this pe call hoga.
    }
```

hum "this" ko jaante hain.this mein actually f1 ka i.e. object ka addresss pada hua hain,toh hume f1 object ka poora content return krna hain.So we should write
```C++ 
return *this;
```
why *this and not this ? -> because this ek pointer hain ie f1 ka address hain lets say 700 but apne ko  700 thodi daalna hain apne ko toh block ka asli maal dalna hain.So *this.
Ek tarah se humm chahte hain copy constructor call hojaye. Toh uske liye humme actual object pass krna hoga,actual object return krna padega rather than just the address.

Also change the return type from void to fraction.

```C++
    Fraction operator++(){
        numerator = numerator + denominator;//by default
        //this->numerator =this->numerator + this->denominator;
        simplify();//kuch nahin bola toh bydefault this pe call hoga.
        return *this;
    }

```
```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(10,2);
    //Fraction f3 = f1 + f2;

    f1.print();
    ++f1;
    f1.print();
    Fraction f3 = ++ f1;
    f3.print();
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
10 / 2
6 / 1
7 / 1
```

Humne initially void isliye likha tha as we thought humme kuch return krne ki zaroorat nahin hain but after that humne realise kiya ki humm iski value ko assign bhi toh kr skte hain.Toh assign krne ke liye humme apne object ki updated value ko return krna hoga.So we returned *this.Bcoz this ka poora content humm return krna chahte hain.

----------------------------------------------
Sabh sahii chal raha hain bas isme thodi aur problem hain.

Ab yaar let's say
i = 5;
++(++i);
cout << i;
Toh answer aayega 7.
But idhar apan kr paayege kya?
Lets say fraction f1 hain toh we want
++(++f1);
cout << f1;
Jab hum f1 ko print krne jaaye toh f1 ki value 2 baar increment ho jaani chaiye.
Chalo dekhte hain !!

Ab yaar humme agar "++f1" pe "++" call krna hain toh this function should return something.Agar "++f1" void hi return kr raha hota,toh apan uspe ++  nahin call kr paate.Bcoz jabh yeh function kuch laake hi nahin de raha toh apan uspe ++ kaise call kr skte hain.
So first baat toh yeh hain ki yahan void nahin return hona chaiye.Joh ki hum already correct kr chuke hain that it is not returning void.It is actually returning me the current object.

```C++
    Fraction operator++(){
        numerator = numerator + denominator;
        simplify();
        return *this;
    }
```

Toh current object pe hi toh increment krna tha .To kr dete hain call.Hojana chaiye call.

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(10,2);
    //Fraction f3 = f1 + f2;

    f1.print();
    ++(++f1);
    f1.print();
```

Ideally toh 7/1 answer aana chaiye

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
10 / 2
6 / 1
```
But nahin,answer aaya 6/1 .Ab yeh kyaa gochi hain.

---------------------------------------
Ab ek aur cheez try krte hain.
Ab apan ne niche assign kr diya f3.Phir f1 ko bhi print kr diya and f3 ko bhi.Ideally dono ka answer same aana chaiye but chalo dekhte hain.


```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(10,2);
    //Fraction f3 = f1 + f2;

    f1.print();
    Fraction f3 = ++(++f1);
    f1.print();
    f3.print();
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
10 / 2
6 / 1
7 / 1
```
Ab yeh kya gochi hain.Chalo dekhte hain apan kya miss kr raahe hain !

Explaination:
int i = 5; jabh likhte hain toh internally memory mein pehle is 5 ki value system ke buffer mein save hoti hain.Fhir i variable create hota hain and phir i variable mein buffer ki value copy ho jaati hain.

So lets say
```C++
int fun(int i){
    i++;
    return i;
}

main(){
    cout << fun(5); //(1)
    }
```
Ab yahan par ho kya raha hain??
sabse pehle i ki value 5 mein copy hui.Toh i block bana jisme 5 copy ho gaya.Ab i++ kiya toh i 6 hogaya phir we are returning the value 6.
Ab main mein agar humm is return value ko recieve krte toh samajh mein aata hain i.e. int j = fun(5); cout << j;
ki iss function ki value pehle j mein copy ho rahi hain.j mein 6 aagaya,phir hum j ki value ko print kr rahe hain.

But, yahan pe humm i.e. (1) mein bina recieve kiye hi direct print kr rahe hain.Toh yahan ho kya raha hain ki system ne temperory buffer memory mein iss 6 ko recieve kiya, and jub bola print krne toh usne (1) mein 6 print kr diya. So,this is how,it actually works.

Ab dekhte hain,humare case mein kya ho rha hain!

Humara class hain Fraction,object f1

f1 ka address 700 jisme N = 10 and D = 2 assume kr
ab apan kr rahe hain:
fraction f3 == ++(++f1);

Toh jab yeh "++" operator call hua,tabh niche given function call hua usme address 700 gaya this ka

```C++
    Fraction operator++(){ 
        numerator = numerator + denominator;//by default
        //this->numerator =this->numerator + this->denominator;
        simplify();//kuch nahin bola toh bydefault this pe call hoga.
        return *this;
    }
```

Iss ++(++f1) mein sabse pehle (++f1) evaluate hoga.Toh N= 6 and D = 1 return hoga.Ab jabh return hua toh humne kahin isse recieve kiya ??
-> nahin humne usse,kahin recieve hi nahin kiya,humm directly uspe ++ call kr rahe hain.So system ne kya kiya ki see pehle wala example usko apan ne directly print kr diya tha.Toh system buffer ne de diya.

But yahan par toh aisa nahin hua toh system ne temporary buffer mein usko rakha.
Lets say that block of buffer is "x" jisme N = 6 and D = 1 hain.

Ab iss "x" naam ke block pe phirse "++" call hua.(address lets say 800)
Ab increment hua and N = 7 and D = 1 aaya and iss block ki value(address 900) copy hogi F3 mein .

Toh jabh F3 print kiya toh 7/1 aagaya.Lekin jab f1 print krne ka try kiya toh 6/1 aagaya joh ki aana bhi chahiye.

So,in conclusion -> Jabh bhi koi function koi value return krta hain, toh pehle humara system usse temporary buffer mein usko copy krta hain/value ko recieve krta hain.Aur jaha phir humm assign krte hain woh value assign ho jati hain.

But iss case mein (++f1) isse humm kahi assign nahin kr rahe hain,toh ho kya raha hain jo system ne copy banai hain,ussi pe humara next function call ho raha hain.Ussi ke wajah se f1 mein ek level updation ho raha hain.

-----------------------------------------------

Ab yaar humm chahte hain,yeh kya hain x ,y yeh copy nahin chaiye.Humme toh seedha answer laake dede bhaiya!
Humm chahte hain,yeh copy banne hi naa and yeh jo 2nd waala plus plus hain,woh bhi ussi pe call ho jaaye.

So jab bhi humm chahte hain,opy naa bane toh pass by referance return krna chaiye bro!

Ab agar humne jo pehle apna return type sirf Fraction tha toh copy banna.
But agar hum Fraction& i.e.(and percent) laga dege toh ab copy nahin banegi.

and percent likhne se hoga yeh ki F1 ki copy nahin banegi seedha uspe hi shot lagege.Humare system ke according jo buffer memory hogi,woh yahin hogi f1.Woh issi ko point kr raha hoga.
Toh jabh aage ka ++ i.e. dusra ++ call hoga woh issi pe call hojayga and this is what we wanted.

Toh bas apne ko &(and percent) add krne ki zaroorat hain.
```C++
    Fraction& operator++(){
        numerator = numerator + denominator;
        simplify();
        return *this;
    }
```

Bas hogaya.Aagayi answer.

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
10 / 2
7 / 1
7 / 1
```


Samjha ?
Chal ek baar dry run krke samjhate hain

```C++
    Fraction& operator++(){  //(1)
        numerator = numerator + denominator;
        simplify();
        return *this;  //(2)
    }
```

Toh object f1 ka ek block hain,jahan par numerator mein 10 hain denominator mein 2 hain.Iska address hain 700.Humne yaha call kiya hua hain ++(++f1);

Toh ab this mein aagaya hain 700 kyuki 700 hi f1 ka address hain.
ab operator++ kaam krna shuru kiya and humne numerator mein jaake changes kr diye and simplify call kiya and aaya 6/1.
Ab we are returning *this. -> *this means we are returning contents of this block. But return type hain Fraction and percent so humm bol rahe hain return toh karo lekin return by address.Ab agar humne &(and percent) nahin likha hota toh copy create hoti and uss copy mein saari values/content copy hoti.
But kyuki humne and percent lagaya hain toh woh copy nahin banayega.Woh same block mein point krega.TOh iss baar ka joh ++ hoga woh issi block pe call hojayega.
And iss baar jo ++ hoga uske "this" mein dobara se same address i.e. 700 jaayega no changes.Isime change krega and return bhi krega.

Yeh sabh humne iss liye kiya bcoz we want ki joh humara ++ operator hain woh pre-inbuilt internal ++ operator ki tarah kaam krre.Isiliye itni mehnat ki hain.

Toh abb apan kitni bhi level ke ++ laga skte hain,woh waise hi kaam krega jaise krna chaiye.

----------------------------------------

OPERATOR OVERLOADING 3

In last session,we talked about pre-increment operator.We will see example of some more.

Post Increment -> "++" .It is a unary operator.call krna hain toh sirf F1++ kiya toh chal jaayega. Unary operator hain toh ek hi argument chaiye woh bhi "this" mein pass ho jaayega toh inshort koi bhi argument ki jarorat hich nahin hain.

So the first major chalenge is pre-increment and post-increment mein differentiaite kaise kare??Operator toh same hain "++"

Toh yeh cheez yaad rakhne wali hain, write :
```C++
operator++(int){
    ------
}
```
int likhne se malum padh jaata hain that yeh post increment operator hain.

--------------------------

Ab iska return type kya hoga??Abhi ke liye Fraction rakhte hain.Dekhlege kuch changes krne hoge toh.

Ab agar we say: int j = i++;Toh j mein i ki purani value aajayegi and phir i increment hoga.

Fraction f4 = f1++;
f4 mein f1 ki purani value copy krni hain and f1 ko increment krna hain .But end mein return krna hain f4 ko.

Lets say f1 agar N=10 and D = 2 hain

Toh f4 = f1++; kiya toh
f1 ho jaayega N=6 and D=1 and f4 hojayega N=10 and D=2 hi rhega
So in short f4 mein purani value and f1 mein changes.And ofc purane content ko return krna hain.

So since humme purane content ko return krna hain in code we will create a new fraction jisme hum purane fraction ki value daal dege
```C++
Fraction operator++(int){
    Fraction fNew(numerator,denominator);//previous num and deno
    numerator = numerator + denominator;
    simplify();
    fNew.simplify();
    return fNew;
}
```

So lets try this function:

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(10,2);

    Fraction f3 = f1++;
    f1.print();
    f3.print();
```

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
6 / 1
5 / 1
```

Ab jaise humne preincrement mein nesting ki thi,waise hi post increment mein bhi kr skte hain kya??

    int i = 5;
    (i++)++; //(1)
    cout << i;


Ab normally bhi aisa allowed nahin hain.Post increment operator pe nesting ho hi nahin skti.So post increment pe nesting krne ki zaroorat nahin hain.


-------------------------------------------

Now we want to overload the operator "+=" 
int i = 5;int j = 3;
i+=j;
isse i = i+j; hota hain and answer i=8 hojata hain.
ANd also isme nesting bhi hoti hain .
Eg: (i+=j)+=j;  //hoga

-----------
F1 +
Ab hum chahte kya hain? F1

Ab since ye binary operator hain,2 operands chaiye hoge.Toh f1 toh this mein chala jayega.f2 ko pass krte hain.And also we know jabh hum pass krte hain toh reference mein pass krna chaiye to avoid copy.
And also apne ko f1 mein hi changes krne hain

```C++
    Fraction operator+=(Fraction const &f2){
        int lcm = denominator * f2.denominator;
        int x = lcm / denominator;
        int y = lcm / f2.denominator;

        int num = x * numerator + (y * f2.numerator);

        numerator = num;
        denominator = lcm;
        simplify();
    }
```

explaination: 
    Fraction f1(10,3);
    Fraction f2(5,2);

    f1 += f2;

AB f1 ka address lets say 700 hain and f2 ka address say 800 hain.f1 toh this mein chala jaayega.f2 ko apan reference ke thru pass krege toh no copy address 800 hi rhega.Ab humme return krne ki zrorat nahin hain,humne sirf f1 mein f1+f2 update kiya hain,

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,3);
    Fraction f2(10,2);

    f1 +=f2;
    f1.print();
    f2.print();
}

```
Ab yeh bina nesting ke toh sahii chal raha hain.Wahin f1 update ho raha hain.Ab humm fraction hatakar void likhte hai bcoz kuch return nahin krna hain sirf update krna hain and nesting krte hain


```C++
    void operator+=(Fraction const &f2){
        int lcm = denominator * f2.denominator;
        int x = lcm / denominator;
        int y = lcm / f2.denominator;

        int num = x * numerator + (y * f2.numerator);

        numerator = num;
        denominator = lcm;
        simplify();
    }

```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
helloworld.cpp: In function ‘int main()’:
helloworld.cpp:9:15: error: no match for ‘operator+=’ (operand types are ‘void’ and ‘Fraction’)
     (f1 +=f2) += f2;
     ~~~~~~~~~~^~~~~
```

Error aaya ki yeh jo function hain apna woh kuch return hi nahin kr raha.Woh toh void hain.(f1+=f2) jo hain woh toh void hain ab usme fhirse += kaise call kr skte hain !.Same as preincrement.Toh bas void nahin return krna poora ka poora fraction return krna hoga. and return krege current object jisme humari updated value hain so *this.

```C++
    Fraction operator+=(Fraction const &f2){
        int lcm = denominator * f2.denominator;
        int x = lcm / denominator;
        int y = lcm / f2.denominator;

        int num = x * numerator + (y * f2.numerator);

        numerator = num;
        denominator = lcm;
        simplify();

        return *this;
    }
```

Ab firse problem hogi ki woh ek baar change hoga buffer mein jaaega woh dusre baar changes appear nahin hoge.Toh woh naa hone ke liye wwe will return fraction by referance

```C++
    Fraction& operator+=(Fraction const &f2){
        int lcm = denominator * f2.denominator;
        int x = lcm / denominator;
        int y = lcm / f2.denominator;

        int num = x * numerator + (y * f2.numerator);

        numerator = num;
        denominator = lcm;
        simplify();

        return *this;
    }
```

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
40 / 3
10 / 2
```
BC padhle interviews mein puchte hain.