# OPERATOR OVERLOADING AND DYNAMIC ARRAY CLASS

### OPERAROR OVERLOADING 1:

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






