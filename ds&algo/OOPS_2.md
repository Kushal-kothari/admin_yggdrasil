FEW MORE IMPORTANT CONCEPTS OF OOP's

Abhi hum OOP's 1 lecture ki baat krre toh humne student ke naam ki baat hi nahin ki bc.

AB humm name property ko include krege but thoda different hoga .Toh chaliye shuru krte hain bina kisi bakchodi ke.

-----------------------------------------------

### SHALLOW AND DEEP COPY

```C++
class Student{
    int age;
    // char name[100];
    //name to string hota hain toh using character array
    /*but apne ko dynamic allocation aata hain toh we will not
    use this  instead use this*/

    //we will create array dynamically

    char *name;  //abhi tak [100] aisa kuch nahin diya bcoz pata nahin 

    public :

    Student(int age, char *name){
        this -> age = age;
        this -> name = name;
    }

    void display(){
        cout << name << " " << age << endl;
    }

};
```

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    char name[] = "abcd";
    Student s1(20,name);

    s1.display();

    name[3] = 'e';
    Student s2(21,name);
    s2.display();
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
abcd 20
abce 21
```
Abhi mast output aaya majaa aaya waah bhai waah
Ab, phirse s1 display krke dekhte hain

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    char name[] = "abcd";
    Student s1(20,name);

    s1.display();

    name[3] = 'e';
    Student s2(21,name);
    s2.display();

    s1.display(); //new
}
```

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
abcd 20
abce 21
abce 20
```

Gotchi ho gaya, output change iski maa kaa.Kaise?
Kusch gadbad hain ,koi galti kiye apun.

main mein
humne name ka array banaya hain jiske pass array ka address hain lets say 780mand value padi hui hain a b c d \0
So name is pointing to address 780.

Ab chalte hain class ki taraf
humne pass kiya tha : Student(int age, char *name)

Toh iss name ki jagah actually pass hua hain addresss 780 and constructor function ne usko recieve kiya aise
-> age parameter banaya usme 20 daala and name parameter banaya and usme usne 780 ko pass kr diya

Toh s1 ke block mein jo uske pass 2 properties hain name and roll no usme 20 and address 780 daal diya.Toh s1 ka name actually same arrY KO HI POINT KR RAHA HAIN

Ab apan ne code mein d ki jagah 3 likh diya toh woh change hua

But,s2 mein toh apan 
Student s2(24,name) -> i.e. rollno aur address pass kr rahe hain

Toh s1,s2 aur name teeno hi same array ko point kr rahe hain.

So ek mein bhi changes kiye toh dono mein reflect ho jaayega.


## SO RATHER THAN COPYING THE ENTIRE ARRAY ,USNE SIRF ZEREOTH INDEX KE ADDRESS KO COPY KIYA .THIS IS KNOWN AS SHALLOW COPYING.

Humne poora array doobara nahin banaya, sirf address copy kiya.

Ideally humme shallow copy nahin krni chaiye tha,humme khud ka array banana chaiye tha jo poora copy kre.

--------------------------------------
## DEEP COPY

```C++
class Student{
    int age;
    // char name[100];
    //name to string hota hain toh using character array
    /*but apne ko dynamic allocation aata hain toh we will not
    use this  instead use this*/

    //we will create array dynamically

    char *name;  //abhi tak [100] aisa kuch nahin diya bcoz pata nahin 

    public :

    Student(int age, char *name){
        this -> age = age;
        //this -> name = name; // SHALLOW COPY AVOID

        this -> name = new char[strlen(name)+1]; 
        /*naya array banaya and uska length count kiya aur 
        +1 for null character */
        strcpy(this -> name,name);
        /* ab humne array bana toh diya hain ab iss function ki 
        madat se copy bhi hogaya */
    }

    void display(){
        cout << name << " " << age << endl;
    }


};
```

Name array mein change krne se koi changes reflect nahin hue.

EXPLAINATION KYA HO RAHA HOGA !

-> name jo point kr raha hoga address(780) ko jaha a b c d lkha hua hain.

ab humne object banaya Student s1 jisme humne roll no aur name pass kiya.Name ki jagah humne dekha ki character pointer array hain yeh toh.Naya haracter array bana diya of length pichle wale ka(i.e. name ka )
Toh humne 1 D character banaya of length ---

-------------------------------------------------------------

### COPY CONSTRUCTOR

Let's quickly discuss what is copy constructor

Humne name ko public kiya so that class ke bahar access krne men aasani ho and yahan par deep copy horela hain

```C++
class Student{
    private :
    int age;

    public :
    char *name; 

    Student(int age, char *name){
        this -> age = age;
        //this -> name = name; // SHALLOW COPY AVOID
        this -> name = new char[strlen(name)+1]; 
        strcpy(this -> name,name);
    }

    void display(){
        cout << name << " " << age << endl;
    }
};
```

```C++
#include <iostream>
using namespace std;
#include<cstring>

#include "student.cpp"

int main(){
    char name[] = "abcd";
    Student s1(20,name);

    s1.display();

	Student s2(s1);

	s2.name[0] = 'x';


	s2.display();
	s1.display();
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
abcd 20
xbcd 20
xbcd 20
```

Explaination: Jab character array banaya tabh hua yuh hoga ki lets say uska address 800 hain.Toh (name ko mila address 800).Now humne student ka object dia ,usme humne 2 parameters pass kiye.Humne class ki file mein deep copy kiya hain.TOh uske dono parameters mein name ko alag address mila let's say 800.Ab yahan par deep copy hua.Thats not the issue.
But jabh humne,
Student s2(s1); likha toh yahan par,yahan par hua COPY CONSTRUCTOR CALL and bydefault copy constructor shallow copy krta hain.  so gaya abhi bhi name ka address 800 .Explaination khatam

Humne yahan par copy constructor use kiya for object s2 so poora content copy ho gaya s1 ka

Ab yaar yahan par question yeh hain ki andar ki copy kaisi ho rahi hain?
i.e s1 ka s2 mein kaisa jaa raha hain?
Iskina mtlb kya hain : Student s2(s1);  ?
Iska matlab s1 ki saari values s2 mein copy ho jaayegi.But kaise?See blue niche
### Remember in-built copy constructor,by-default shallow hota hain,always.


Thats the reason why s1 mein bhi changes reflect hue.Ab yaad rakhna jab bhi string use krni ho toh always use deep copy not shallow copy.Avoid copy constructor

Toh kaise krna chaiye?

Sabse pehle we will analyse ki humara copy constructor kaise hota hoga?
Name toh same hi hoga bcoz woh constructor hain.Woh ek hi argument expect kr raha hain humare student type ka
```C++
    //Trying to visualise student constructor toh aisa hi hoga copy constructor ka structure
    Student(Student s){
        ------
    }
```
Ab hum chahte hain main mein s1 ke saare values s2 mein copy ho jaaye.

Idhar i.e. class mein humne s1 ko s mein recieve kr liya.

Toh,
```C++
    Student(Student s){
        this -> age = s.age;
        this -> name = s.name;
    }
```

Ab yeh jo upar hain woh shallow copy hain jo internally hota hain.This is what by default happens in copy constructor hum nahin krna chahte hain.We should avoid this.

Humm chahte hain deep copy ho.Deep copy ke liye humme  new array create krna padega.But pehle length banani padegi phir copy krlege.

```C++
    Student(Student s){
        this -> age = s.age;
        // this -> name = s.name;

        this -> name = new char[strlen(s.name)+1];//iss line  new array create hoga toh new array ka new address bhi hoga
        strcpy(this -> name,s.name);//isme purana array ka content copy hogaya
    }
```

Ab yahan par humne khudka copy constructor banaya jisko humne blindly copy nahin kiya.Pehle new array create kiya and new array banaya.
Logic toh correct hain.Great.lekin abhi bhi isme kuch mistakes hain jisse humme dhyan dena chaiye

Constructor ko humne bohot ache se padha hain.

Jab humne main mein Student s2(s1) likha hain toh class mein 
Student(Student s) call hota hain.Ab we know that function call by value se call hote hain.
Also humne yeh bhi dekha hain,when we write
Student s3 = s1; -> toh hota yeh hain ki ek naya object student banta hain s3 and s1 ki saari values s3 mein chale jaati hain.Ofc copy constructor call hota hain
Student(Student s) iska matlab Student s mein Main.s1 ki value daaldo. i.e Student s = main.s1;

------------------------------------------------------
More simple explaination:

int fun(int b){  // yahan par pass by value or lets say value copy hui i.e. 5
    cout << b;>>
}

int a = 5;
fun(a);

---------------------------
Same is happening in student constructor.Copy constructor call hota hain.
But the only problem here is hume khudka copy constructor banaya jo deep copy krta hain.Toh apna by default copy constructor kaam nahin krega.But apan uss copy constructor ko hi call kr rahe hain.
Since humne apna khudka copy constructor likh diya hain.TOh copy constructor khudka hi call hoga
class file mein humne

Student(Student s) jab call kiya toh yeh line ka kaam hain copy krna so woh copy constructor bulayega ,but copy constructor toh woh khud hain.Toh khud ko hi call krega .Phir iski wajah se infinite loop bann jaayega.
Humm copy constructor call kr rahe hain ,but humme uss copy constructor ke argument mein copy constructor chaiye.How it is possible.
So argument waali value copy constructor mein jaayegi,phirse woh wohi loop chalta rahega.infinite loop ko humme avoid krna hain.

So humm chahte hain argument mein copy constructor call nahin ho!.i.e naya object banke call by value nahin ho.

We can and should do here pass by reference.

Remember: Whenever we feel ki humme copy create nahin krni toh hum pass by reference use krte hain.

-------------------------------
Pass by value:

int i = 5; // i ka block bana usme value 5 
int j = i; // j ka block bana usme value 5

---------------------------------
Naya block nahin banana,

int &j = i;  //ab naya block nahin banega seedha ,j same block ko point krega .j reference variable hain

### But kisi function mein reference variable ko pass krna hain?

main(){
    int i = 5;
    fun(i);
}
 --------------

int fun(int j){
    int j = main.i;  //pass by value;
} 


int fun(int &j){
    int &j = main.i;//pass by reference : j naya block banayega -> NO.Jo humara main block hain woh usse point krega.
}
So main ka jo i block tha j bji ussi ko point kr raha hain
 ------------------

So in our code we want 
Student(Student &s) // so that koi nayi copy create naa ho. Pass by reference humara value pass hojaye

So now output is what we expected:

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
abcd 20
xbcd 20
abcd 20
```

-----------------
Now one more important thing humm refrence variable ko majorly sirf read krne ki permission deni chaiye not to let them change the value ,so write const in front of them always

SO this is the FINAL COPY CONSTRUCTOR WITH DEEP COPY USE IT AT TIMES OF USING STRING.


```C++
    Student(Student const &s){
        this -> age = s.age;
        // this -> name = s.name;

        this -> name = new char[strlen(s.name)+1];//iss line  new array create hoga toh new array ka new address bhi hoga
        strcpy(this -> name,s.name);//isme purana array ka content copy hogaya
    }

 ```  

 ---------------------------------------------------------------
FEW MORE CONCEPTS OF OBJECT ORIENTED PROGRAMMING

### INITIALISATION LIST

Example 1)

```C++
int a = 5;
int const b = a;
```

```C++
int a;
a = 5;

int const b;//3
b = a; //4
```

In example 1 ,first piece of code is correct.constant ko pehle likho yaa baadme likho koi farak nahin padta.
In example 2 ,line 3 bhi correct hain but usme garbage value place ho jaayegi and phir hum line 4 mein usse change krr rahe hain, so though error line 4 pe hain but copilation error line 3 pe aayega.

--------------------------------------------------
Example 2:
Same is the case with the reference variable.

int i = 5;
int &j = i;
 --------------

int &j;
j = i; // wrong galat hain
 ------------------------------------

So the crux is jabh bhi hum constant variable banaye, toh initialise ke time hi declare krne kaa baadme kiya toh error aa jaayega.

 --------------------------------------

Example 3:
```C++
class Student{
    public :
    int age;
    const int rollNumber; 
};
```
Ab yahan humne isko constant mark kr diya which simply means rollnumber ko humne ek baar value dedi toh woh doobara value change nahin kr paayega.

```C++
class Student{
    public :
    int age;
    const int rollNumber; 
};
```
```C++
#include <iostream>
using namespace std;
#include<cstring>

#include "student.cpp"

int main(){
    Student s1;//0
    s1.age = 20; //1
    s1.rollNumber = 101;//2
}
```

Ab yaar 1 mein toh jhaata koi problem nahin hain lekin 2 mein hain

Bcoz jaise hi humne Student s1 likha,s1 ke liye default constructor call hogaya.
Default constructor ka kaam kya hota hain?Humare class ki har property ko uss object ke liye initialise krna with the default values which are garbage.

So statement zero mein hi age and rollno ki koi garbage value jaa chuki hain bro
So therefore statement no 2 toh allowed hi nahin honi chahiye.Error aayega  and error line no 6 pe hi aajayega.
Class ke data member ke saath bhi wahi hua hain jiss crux ki humne baat ki thi.

-------------------------------------------

```C++
class Student{
    public :
    int age;
    const int rollNumber = 101; 
};
```
Ab yaar yeh bhi nahin kr skte bcoz phir toh jitne bhi object banayege unn sabke roll no 101 ho jaayega

Toh yaar humara yeh kaam toh constructor ko hi krna padega,bcoz woh jitne baar initialise hoga utni baar milegi unko constant

```C++
class Student{
    public :
    int age;
    const int rollNumber; //1

    Student(int r){
        rollNumber = r;
    }
};
```

Ab yaar baat yeh hain ki isme bhi error hain, bcoz humne line 1 mein initialise kiya toh usko memory mein kahin toh jagah mili hain and woh garbage value se initialise ho chuka hain.
So,now  ek aur try

```C++
class Student{
    public :
    int age;
 

    Student(int r){
        const int rollNumber = r;
    }

    display(){
        cout << age << " " << rollNumber << endl;
    }
};

```C++
#include <iostream>
using namespace std;
#include<cstring>

#include "student.cpp"

int main(){
    Student s1(101);
    s1.age = 20;
    // s1.rollNumber = 101;
}
```

Isse error aaya
 ‘rollNumber’ was not declared in this scope
         cout << age << " " << rollNumber << endl;

-----------------------------------------

SO THERE COMES THE ROLL OF INITIALIZATION LIST

```C++
class Student{
    public :
    int age;
    const int rollNumber;

    Student(int r) : rollNumber(r) {
    }
};
```
Ab koi problem nahin hain.We took the help of
### Initialisation List.

Jo humare constant data members ko constructor ke andar jaane se pehle hi,at the time of memory allocation hi initialise kr paaye.
How to use : Constructor ke  saath mein humme colon lagana hoga uske baad apne datamember ka naam jisko humm initialise krna chahte hain and parentheses mein uska naam jiski value hum uss datamember mein set krna chahte hain.Idhar r; 
Ab koi tension nahin hain

So jab bhi constant data members ko initialise krwana hota hain toh remember this bro.

Ab bohot saare data members ke saath bhi ek saath kr skte hain.



SECOND THing whwere we need the help of initialisation list
```C++
class Student{
    public :

    const int age;
    const int rollNumber;
    Student(int r,int age) : rollNumber(r), age(age) {
    }
};
```
In refeence variable

```C++
class Student{
    public :

    const int age;
    const int rollNumber;
    int &x; //age reference variable
    Student(int r,int age) : rollNumber(r), age(age), x(this -> age) {
    }
};
```

Jab bhi constant property or constant reference hoga tabh in the class tab Initialisation use krna chaiye.

---------------------------------------------------

## CONSTANT FUNCTIONS

Before studying constant function ,lets check once again and review fraction class.
Uski 2 properties thi : numerator and denominator.
Both were private

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
/*since both the properties are private but hame dono ki values ko read krna haintoh get toh lagana padega bacchi*/

//basically getters and setters

//properties read krne ke liye 2 functions
    int getNumerator(){
        return numerator;
    }

    int getDenominator(){
        return denominator;
    }
//properties set krne ke liye 2 functions
    int setNumerator(int n){
        numerator = n;
    }

    int setDenominator(int n){
        denominator = d;
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

};
```

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(15,4);


```

ab now we will do something in constant.

AB jaise hum constant variables banate hain 
Eg:
int b = 10;
int const a = b;

### Waise hi hum class ke constant objects bhi bana sakte hain

How?

const (name of the class) (name of the object) ;

So
Example :
const Fraction f3;
We created the variable of our constant class jiska naam f3 hain !

Ab see in variable : since a is constant we cant change any value in a. like a++ not possibke

Similarly in constant object we cant change the property.

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(15,4);

    Fraction const f3;

    cout << f3.getNumerator()<<" "<<f3.getDenominator() << endl;
}
```
```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(15,4);

    Fraction const f3;

    cout << f3.getNumerator() << " " << f3.getDenominator() << endl;

    f3.setNumerator(10);
}
```

Ab yaar humne ek constant object banaya i.e. initiailise kiya toh usme garbage value chale gayi hogi since constructor ka kaam hain initialise krna

Fhir humm usse print krwa rahe hain and we assume usme error nahin aana chaiye tha and after that humm constant object ki property ko numerator 10 initialise kr krahe hain.Yeh wrong hain.Isme jhol hain constant ki value thodi change hoti hain

So we asssumed ki error ek hi aayega
But we got three errors.
-----------------------------------

Bcoz f3 is our constant object so f3 ke through hum koi bhi function call nahin kr sakte hain.Kyuki compiler ko tension hain jo humne functions call kiye uske andar jaakar apan ne change kr diya toh problem ho jaayegi.

### So remember,humara compiler humme constant object ke through koi bh normal function call krne nahin deta hain.

### CONSTANT OBJECT KE THROUGH WE CAN CALL ONLY CONSTANT FUNCTIONS.

## What are constant functions ?

Constant functions are those jo humare current object ke kisi property mein koi change nahin krte.

More specifically "this" keyword ke through change naa kare.Bcoz current property ka address toh this mein jaata hain.So we can say that this ke kisi bhi property mein change naa kare.
Example :

    int getNumerator(){
        return numerator;
    }

    int getDenominator(){
        return denominator;
    }

Abb yeh dono this ke kisi bhi ko change nahin kr rahe hain so we should mark this as constant.  

JAb hum function ko constant mark krege tabhi hum usko constant object ke through mark kr paayege.
```C++
    int getNumerator() const{
        return numerator;
    }

    int getDenominator() const{
        return denominator;
    }
```
------------------------

Ab see how it works

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(15,4);

    Fraction const f3;

    cout << f3.getNumerator() << " " << f3.getDenominator() << endl;

    // f3.setNumerator(10);(1)
}
```
```C++
class Fraction{

    private:

    int numerator;
    int denominator;

    public :

    Fraction(){

    }

    Fraction(int numerator,int denominator){
        this -> numerator = numerator;
        this -> denominator = denominator;
    }
/*since both the properties are private but hame dono ki values ko read krna haintoh get toh lagana padega bacchi*/

//basically getters and setters

//properties read krne ke liye 2 functions
    int getNumerator() const{
        return numerator;
    }

    int getDenominator() const{
        return denominator;
    }
//properties set krne ke liye 2 functions
    int setNumerator(int n){
        numerator = n;
    }

    int setDenominator(int d){
        denominator = d;
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
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello2093173504 22024
```

A lets chaeck this kya error aata hain i mean uss ko uncomment krte hain

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Fraction f1(10,2);
    Fraction f2(15,4);

    Fraction const f3;

    cout << f3.getNumerator() << " " << f3.getDenominator() << endl;

    f3.setNumerator(10);//(1)
}
```
and class mein jaake iss function ko constant kiya toh sahii error aaya hain humko.

```T
student.cpp:32:21: error: assignment of member ‘Fraction::numerator’ in read-only object
         numerator = n;
```        

So humara setnumerator and setdenominator function constant nahin ho sakte hain.

Print function bilkul constant bann skta hain bcoz woh kuch change nahin kr raha.


Simplify ko constant function nahin bana skte bcoz woh bhi humare this ke numerator and this ke denominator ki values ko change kr raha hain.
Same with numerator function etc we cant change it to constant.

--------------------------------------------

In this session,we will understand
## STATIC PROPERTY OF A CLASS

Lets see with an example:

```C++
class Student{

    public :

    int rollNumber;
    int age;

    int totalStudents; // total number of students present
};
```
Ab agar humm Student s1 krege toh class ki copy create ho jaayegi and iss s1 ke pass apna :
rollNo,age,tS ki value hain.All 3 mein filhal toh garbage hi pada hoga.

Ab humne phirse ek aur object banaya :
Object s2 jiske teeno property mein garbage initialise i.e pada hain.

So jaise jaise student object bante jaayege yeh har students ke bante jaayege.

Now the question arises:
Har student ke pass apna apna Roll no and age hoga yeh samajh mein aaya but totalStudents ki property toh kisi ke student ke respect mein hain hi nahin na.
This property ki value should be same for all objects.Jitne bhi humare students created rahege.


So in short we realize indirectly yeh property uss object ke liye nahin hain,sabke liye same hogi so we dont want it to change.So we will make it static.

## Static belongs to a class aur usse access humm class ki madat se hi kr skte hain

So we will make tS static

```C++
static int totalStudents;
```

Ab static likhne ke baad,this property belongs to the class. Jab bhi humm iss class ka object banayege iss property ki copy nahin hogi.Kaise?

ans) Abb jab hum Student s1; object banayege toh uske pass sirf rollNo and age hoga.totalStudents nahin hoga.(box assume kr)
totalStudents actually humare class ke pass hi rakha hoga.

We can say that rollNumber and age are non-static as agar kuch mention nahin kiya hain toh by-default non-static bann jaata hain woh.
* Non-static belongs to a object
* Static belongs to a class.


So abb jaise hum object ke liye block assume krte hain jisme uski properties and value hoti hain.
Waise hi similarly assume a square box for a class atleast for now.

So class ke block mein:
1)Ek property hain rollNumber jaha par koi value save nahin ki hain
2)Ek property hain age jaha par koi value save nahin ki hain bcoz dono hi properties apne apne object ki hogi and bcoz dono non-static hain
3)totalStudents waha value rakhi hogi jo bhi humm save krna chahte hain.

Ab yaar non static values ko agar access krna hain toh pata hain humme object banana hain aur mi jaayegi
Student s1; //object bana
s1.rollNumber; // mil gaya 

Ab  for totalStudents ,object ke pass toh hain hi nahin yeh property toh 
s1.totalStudents ; is wrong bcoz yeh property toh humari class ke pass hain.

### So if we want to access the staticproperty we need to use following syntax:
(classname) (::scope resolution operator) (name of the property)
Example:
```C++
cout << student :: totalStudents;
```

Ab since yeh humari property poore class ki hain,poore class ko belong krti hain.Humme isse initialise class ke bahar jaake krna hota hain.Andar nahin hota.


```C++
class Student{

    public :

    int rollNumber;
    int age;
    static int totalStudents; 
};
int Student :: totalStudents = 0;//initialise static data members

```
```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1;
    cout << s1.rollNumber << " " << s1.age<< endl;
    cout << Student :: totalStudents << endl;
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
0 0
0
```
Ab lets do something wrong
```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1;
    cout << s1.rollNumber << " " << s1.age<< endl;
    cout <<s1.totalStudents<< endl;  //ab yeh logically incorrect hain but phirbhi iska answer dedeta hain compiler

    s1.totalStudents = 20; // yahan se humne change ki value to bhi chalega but logically incorrect.Changes reflect hoge.Crux is baar baar copy nahin banegi ek hi copy rahegi. jo class ka object hain value change ho skti hain but ek hi rahegi.


    Student s2;
    cout << s2.totalStudents << endl;
    cout << Student :: totalStudents << endl;
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
0 0
0
20
20
```
## So just remember static copy nahin hota for every object.


Now,what we want is jo humari property hain totalStudents woh add hoti jaaye,jaise jaise hum naye student banaye.
Aisa hum kaise kare?Initialise krna aagaya .Value change krna aagaya.Update?

Hmmm,shayad constructor humari help kr skta hain.
Bcoz har object jab create hoga, constructor toh call hoga na.Constructor mein jaake iss value ko ++ krna hain.

```C++
class Student{

    public :

    int rollNumber;
    int age;

    static int totalStudents;

    Student(){
        totalStudents++;
    }
};
int Student :: totalStudents = 0;//initialise static data members
```

Humne main mein 5 student object banaye the aagayi humari value 5.

----------------------------------------------
Now this are static data variables.Ab jiss tarah static variables hote hain,ussi tarah humm functions ko bhi static bana skte hain.

## Just remember the crux -> Static means property(variable,function) belongs to a class not an object dependent

Example: ab yaar lets say we need to have a function say getRollNumber.Kya hona chaiye?
abhi har student object ka alag alag rolllnumber hoga and same toh hoga nahin so yeh toh static nahin hain beta.Roll number toh har kisika alag hoga.

```C++
    int getRollNumber(){
        return rollNumber;//return kiya property ka rollNumber
    }
```

But agar humme totalStudents ki value ko access krna hain.I mean pehle humm iss property ko private bana dete hain
```C++
static int totalStudents;
```

Ab humme iski value ko access krna hain.Toh humme ek function create krna hoga.

```C++
int getTotalStudent(){
    return totalStudents;
}
```

Ab now when we see looking at the object kya humme iss function ko call krne ke liye kisi object ki zarorat padegi? Ofc nahin.Bcoz yeh function jiss property pe kaam kr raha hain woh property toh static hain .So humme iss function ko static declare kr dena chaiye

```C++
class Student{

    static int totalStudents; //PRIVATE STATIC

    public :

    int rollNumber;
    int age;

    int getRollNumber(){
        return rollNumber;
    }

    static int getTotalStudent(){
        return totalStudents;
    }


    Student(){
        totalStudents++;
    }
};
int Student :: totalStudents = 0;//STATIC
```
Ab niche waala function completely belongs to a class.

```C++
    static int getTotalStudent(){
        return totalStudents;
    }
```

Ab isse access krne ke liye we need to write:
classname ::(scope resolution) functionname();

Eg: Student :: getTotalStudents();

This is the way we will access our static function

```C++
class Student{

    static int totalStudents;

    public :

    int rollNumber;
    int age;

    int getRollNumber(){
        return rollNumber;
    }

    static int getTotalStudent(){
        return totalStudents;
    }


    Student(){
        totalStudents++;
    }
};
int Student :: totalStudents = 0;//initialise static data members
```

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1,s3,s4,s5;
    Student s2;
    cout << Student :: getTotalStudent() << endl;
}
```

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
5
```

So humm humare class ke datamembers and functions kisi ko bhi  static declare kr skte hain.Static declare krne ka simple sa meaning hain "I want inn properties ki value object pe depend naa kare , basically har object ke liye same ho.Har object ke liye unke liye common jagah padi hui hain.Jab bhi humein inhe access krna hain,we need to use class ka naam scoper resolution and name of your property chahe woh function ho yaa variable hoo"

see example variable bhi static print kiya hain Dekhle.

```C++
class Student{

    static int totalStudents;

    public :

    int rollNumber;
    int age;
    static int totalStudents2;

    int getRollNumber(){
        return rollNumber;
    }

    static int getTotalStudent(){
        return totalStudents;
    }


    Student(){
        totalStudents++;
    }
};
int Student :: totalStudents = 0;//initialise static data members
int Student :: totalStudents2 = 0;
```

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1,s3,s4,s5;

    Student s2;
    cout << Student :: getTotalStudent() << endl;
    cout << Student :: totalStudents2<< endl;
}
```

Now small small things jispar bhi dhyan dena chaiye.They are :

Humare jo static functions hote hain,woh sirf static properties ko hi access kr skte hain, chahe phir woh data members ho yaa chahe functions ho.

```C++
    static int getTotalStudent(){ // static hain yeh
        return totalStudents;  //static hain yeh
    }
```

1)Static function ke andar we can't use non-static data member nor we can call other non-static function.Jo bhi krna hain static data member access kro .Static function access kro.

2)Static function ke pass this keyword/pointer nahin hota.Humne pehle discuss kiya tha ,humare class mein jitne bhi object hote hain unke pass this naam ka keyword hota hain which holds the address of the current object.But static ko tho humm object ke through call hi nahin krte toh usme toh value nahin aapayegi.
This simply means, humare static function ke pass "this" naam ka koi keyword nahin hota.