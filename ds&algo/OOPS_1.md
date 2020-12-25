OBJECT ORIENTED PROGRAMMING -> is a programming style that we use to follow modern conventions.Basically it revolves around objects.

What are Objects -> Objects are basic simple entities which possess some properties and some functions.For Eg: Laptop,pen,paper,chair,camera,smartphone everything is an object.We want humm apne code mein bhi yeh objects involve krle so that it be as close to real life.

So we will involve our objects in our code.Jaise real world mein object humse interact krte hain .We want woh humare code mein bhi interact krre.

Now Ek object ke pass kuch properties hoti hain and kuch functions hote hain.

Lets say Student
PROPERTIES :
    ->Name
    -> Roll no
    -> Age
    -> Address
    -> Contact no

FUNCTIONS : are basically the tasks we can perform over the object
    ->Change Address
    ->Set Roll NO


------------------------------------------------------------------------

Now lets say humme 20 students banane hain.
Student 1 ko chaiye Name ,Roll NO and address
similarly,Student 2 ko chaiye Name ,Roll NO and address
similarly,Student 3 ko chaiye Name ,Roll NO and address

Yeh bohot tedious tak ho jayega sabh ko assign krna.

----------------------------------------------------
SOLUTION : We will create a template of student ->Name,Roll No,Age.

Ab humme jabh bhi student banana hain ,humme sirf template ki copy create krni hain 
lets say S1

Template ki copy bante hi S1 ke pass Name,Roll NO,Age aajayega.
Toh ab humme sirf S1 ki properties i.e.(Name,Roll NO,Age) ko jaake fill krna hain.
Lets say:
Name = ABC
Roll No = 101
Age = 25

Aur iss tarah apna student S1 ready ho gaya.Similarly this for other student.So iss tarah iss template ko use kr skte hain

Ab iss template ko we call **Class**.

*** Class is basically a blueprint that defines properties and functions of a particular object. ***

Class ki copy ko hum Object bolte hain.Jitne bhi hum students banayege woh saare student class ke objects hoge.

Important : Ab template i.e. class se thodi pata chalta hain kitne students i.e. Objects hain. Usse sirf uski properties pata chalti hain.

But hum object ki baat krre toh uski value hoti hain

Now lets see how to create a class of student !!!

```C++
class Student{
    int rollNumber;
    int age;
};
```

Ab class banane ke baad humme specify nahin krna padega barbar ki usme kaunsi properties hain

---------------------------------------------------

Ab humme object kaise banana hain woh dekhna hain

Lets discuss hum normal integer variable kaise banate hain?

int a; //we created a variable a of type integer.

Now humme object banana hain of student let's say s1.

Student s1; // Variable[Remember isse hum variable nahin object bolte hain] s1 of type Student

Ab int a; likhte hain toh memory mein 4 byte ka memory block hota hain.Class se kya hoga?

Student ke pass 2 integer properties hain age and roll no .Dono integer hain toh almost 8 byte store krni chahiye memory

So jab hum Student s1 likhege toh 8 bytes ki memory allocate ho jaayegi.
Filhal apan ne sirf declare kiya hain kuch initialise nahin kiya toh random garbage value padi hogi.

--------------------------------------------------
Now lets rewind ourselves in static and dynamic memory allocation we did in pointers

Static:
int a; // Stack mein jaayega
Student s1; //Similarly stack mein jaayega
Student s2; // Stack mein jaayega

Dynamic:

int *a = new int; //8 byte ka memory static memory mein allocate hoyega jiska naam "a" and usme address lets say "1000" yeh address dynamically allocate hoga aur heap mein jaayega

Similarly,

Student *s3 = new Student;



---------------------------------------------

Ab humne file banai "student.cpp".Usme class create ki .Ab us class ka object humm main mein create krege.

```C++
//file name student.cpp
class Student{
    int rollNumber;
    int age;
};
```
Ab main mein hum objects banayege.

Now lets talk about Access Modifier.(Public,Private,Protected)
Ab jo humne student class banai woh toh bataya hi nahin yeh kaha se kaha tak visible hain

Private -> andar tak hi visible hain ,bahar nahin dikh skti aur use nahin kr skte hain.Access krne ka try kiya toh error aayega bcoz visible hi nahin hain.Kuch nahin likha toh bydefault class ki saari properties private bann jaati hain.

Public -> kahi par bhi use kr bc.

-----------------------------------------------
So finally
```C++
class Student{

    public:
    int rollNumber;
    int age;

    private:
    int foo;
    char bar;
};
```

```C++
#include <iostream>
using namespace std;
#include "student.cpp"
 //poora code place hogaya yeh file ka

int main(){
    Student s1;//Created object statically
    Student s2;//Created object statically

    Student s3,s4,s5;//Ek saath 3 static object create kiye

    // Creating object dynamically
    Student *s6 = new Student; //Object created dynamically

    //Abhi object toh create ho gaye,ab humein objects ki proprty ko set krna hain.
    
    /*Ab humein s1 jo static hain uski value set krni hain.Lets see hum integer
    ki value kaise set krte the i.e. int a = 5;.But agar humme age set krna hain 
    we simply cannot write s1 = 24;This is not enough.Bcoz s1 block ke pass 
    multiple properties and values hain jo hum set kr skte hain. So humme batana padega ki s1 ka roll
    no 24 hain ya s1 ka age 24 hain.*/

    s1.age = 24;
    s1.rollNumber = 101;
    cout << s1.age << " " << s1.rollNumber << endl;

    /* Ab yaar statically toh aasan hain ho jaatega aise krne seh but in dynamic jab declare 
    kiya toh stack mein address hain and uss address pe woh heap pe jayega .So humme reference and 
    derefernce ude krna padega
    */

    // Student *s6 = new Student;
    (*s6).age = 18;
    (*s6).rollNumber = 57;
    /* Shortcut bhi hain
    s6 -> age = 18;
    s6 -> rollNumber = 57;*/
}
```

```T
kushal@kushal:~/Desktop/C++/test$  g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
24 101
kushal@kushal:~/Desktop/C++/test$ 
```

----------------------------------------------------

*** GETTERS AND SETTERS ***

```C++
class Student{

    public:
    int rollNumber;

    private:
    int age;

    public :

    void display(){
        cout << age << " " << rollNumber;
    }
};
```

Abhi age toh private hain toh bahar kaise use krre?

Usee public mein return krdo hogaya ! and main file mein age ki jagah uss method/function ko use krne ka i.e. is getAge() instead of just age.

```C++
class Student{

    public:
    int rollNumber;

    private:
    int age;

    public :

    int getAge(){
        return age;
    }

    void display(){
        cout << age << " " << rollNumber;
    }
};
```

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1;
    Student s2;

    Student *s6 = new Student; 



    // s1.age = 24;
    s1.rollNumber = 101;
    s2.rollNumber = 102;
    cout << s1.getAge() << " " << s1.rollNumber << endl;

    s1.display();
    s2.display();


    // (*s6).age = 18;
    (*s6).rollNumber = 57;

    (*s6).display();

}
```
```T
kushal@kushal:~/Desktop/C++/test$ ./hello
22066 101
22066 101
32764 102
0 57
kushal@kushal:~/Desktop/C++/test$ 
```


------------------------------------

Niche in short mein diya hain how to read and write private property

```C++
class Student{

    public:
    int rollNumber;

    private:
    int age;

    public :

    int getAge(){
        return age;
    }

    int setAge(int a){
        age = a;
    }
    

    void display(){
        cout << age << " " << rollNumber << endl;
    }
};
```

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1;
    Student *s2 = new Student;

    s1.setAge(20);
    s2 -> setAge(24);

    s1.display();
    s2 -> display();
    

}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
20 -1276270352
24 0
```
Abhi apan ne kya achieve kr liya private kiya phir set se value set krdi,and baadmein get se value leli.?

aisa nahin hain !.Agar humne publicly bola age negative nahin hona chaiye toh publicly koi bhi aake value change kr skta hain.Jo humein nahin chaiye.But ab property private hain and function ke thru hi hum value ko change kr paa rahe hain.We can check if agar kisine age ki value negative daldi toh apan khli return krege.Humm update hi nahin krege bc

```C++
    int setAge(int a){
        if(a < 0){
            return;
        }
        age = a;
    }

```

Also,apan ko apan jisko jaante hain,ussi ko bolna hain change krn ko toh
```C++
    int setAge(int a){
        if(password != 12345){
            if(a < 0){
                return;
            }
            age = a;
        }
    }
```

Real World projects mein humme kuch properties ko private banana chaiye .SO that third person aake koi bakchodi naa kare.

GETTERS function -> used to read the private value.
SETTERS function -> used to change/edit/update the value of any private property.

*** CONSTRUCTOR AND THIS KEYWORD ***

How to create constructors?

Jab bhi hume kisi class ka object banana hoga: Eg Student s1;
Aisa likhte hi student class ka ek object create hogaya jiska naam s1 hain aur isme student class ki saari properties aajayegi which is (roll no and age) and abhi inn dono properties mein koi random garbage value padi hogi kyuki humne inki values ko set nahin kiya hain.

```C++
class Student{

    public:
    int rollNumber;

    private:
    int age;

    public :

    int getAge(){
        return age;
    }

    int setAge(int a){
        age = a;
    }
    

    void display(){
        cout << age << " " << rollNumber << endl;
    }

    void setAge(int a,int password){
        if(password != 123){
            return;
        }
        if(a<0){
            return;
        }
        age = a;
    }
};

```
Abhi s1.display() krne se value i.e "age" and "rollno" print hojayega.

---------------------------------------------------------

Now lets discuss in detail,jab apan Student s1 likhte hain toh hota kya hain memory mein?

INTERNALLY HOTA HAIN :
Jab hum Student s1 likhte hain toh internally s1.student() function call hojata hain and iss special function ka kaam kya hain? humare pass jitne bhi default variables hain unko garbage value se initialise krwana.This is the work of internally kaam krnewala special function and *** Iss special function ko hum CONSTRUCTOR BOLTE HAIN ***

PROPERTIES OF CONSTUCTOR:(DEFAULT CONSTRUCTOR)
* same name as class name.
* no return type.
* No input arguments.

----------------------------------------------------------

Dobara dekhte hain

Humne likha sirf Student s1;
-> Internally s1.Student() function call ho raha hain and the question is have we created the function? Humne kahin par bhi student naam ka function nahin banaya hain but still yeh function call horaha hain aur humari values bhi initialise ho paari hain default or garbahe value se/. Aisa kaise

Jab hum class banate hain, yehh constructor by default automatically bann jata hain.Humme isse banane ki zarorat nahin hain. Humm automatic wale inbuilt constructor ko hi use kr skte hain.

TOH YAAD RAKHNA JABH BHI CLASS BANAOGE ,DEFAULT CONSTRUCTOR HUMME FREE MEIN MILTA HAIN. KAAM KYA HAIN? HUMARE JITNE BHI DATA MEMBERS HAIN UN SABKO INITIALISE KRNA WITH DEFAULT VALUES JO GARBAGE VALUE HOTI HAIN.

JITNE OBJECTS BANEGE UTNI BAAR EK BAAR DEFAULT CONSTRUCTOR BANEGA

In case of dynamic constructor: 
Student *s3 = new Student;
same hi constructor banega no changes
Internally interpret hoga kuch aise
(*s3).Student();  OR s3 -> Student;

OF COURSE HUM KHUDKE BHI CONSTRUCTOR BANATE HAIN BUT YEH YAAD RAKHNA.

Now one more important point,jabh humne apna constructor likh diya ,inbuilt waala constructor gayab ho jaata hain.

Eg : Student(){
    //Ab internal in-built wala call nahin hoga.Jo humne banaya hain woh call hoga.And this will also serve the same purpose,har property ko default value se initialise krdega
}

Lets Check is constructor get called or not and kiss kis ke liye constructor call ho raha hain and kab ho raha hain.

```C++
class Student{

    public:
    int rollNumber;

    private:
    int age;

    public :

    //Default constructor
    Student(){
        cout << "COnstructor called !" << endl;
    }

    int getAge(){
        return age;
    }

    int setAge(int a){
        age = a;
    }
    

    void display(){
        cout << age << " " << rollNumber << endl;
    }

    void setAge(int a,int password){
        if(password != 123){
            return;
        }
        if(a<0){
            return;
        }
        age = a;
    }
};
```


```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1;//Yeh likhne par constructor call hojana 
               //chaiye
    s1.display();  //age and roll no print hoga(constructor 
                    //initialised garbage value) 
    Student s2;

    Student *s3 = new Student;
    s3 -> display();                   
}
```
3 baar constructor call kiya hain.2 baar value display kari hain.

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
COnstructor called !
0 0
COnstructor called !
COnstructor called !
0 0
```
Now,
Constructor kisse kehte hain? Function name is same as class name is known as Constructor.

Name same hain ,jo mere class ka naam hain wahin mere function ka naam hain.Ab humm argument bhi dege and usko set krege
```C++
    Student(int r){  //1 argument constructor
        rollNumber = r;
        cout <<"Constructor 2 called" << endl;
    }
```
They are paramatrised constructor bcoz they take arguments

```C++
class Student{

    public:
    int rollNumber;

    private:
    int age;

    public :

    //Default constructor
    Student(){
        cout << "COnstructor called !" << endl;
    }
    
    Student(int r){  //1 argument constructor
        rollNumber = r;
        cout <<"Constructor 2 called" << endl;
    }

    int getAge(){
        return age;
    }

    int setAge(int a){
        age = a;
    }
    

    void display(){
        cout << age << " " << rollNumber << endl;
    }

    void setAge(int a,int password){
        if(password != 123){
            return;
        }
        if(a<0){
            return;
        }
        age = a;
    }
};
```
```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1;//Yeh likhne par constructor call hojana 
               //chaiye
    s1.display();  //age and roll no print hoga(constructor 
                    //initialised garbage value) 
    Student s2;

    Student *s3 = new Student;
    s3 -> display();     

    cout << "Parametrised constructor demo" << endl;
    //Student s4;    //Aisa krne se humara default constructor call ho jaayega but we dont want that hum chahte hain parametrised constructor call ho        
    Student s4(10);//aise krne se parametrised constructor call hua not default constructor

    s4.display(); // roll no 10 set hoga not a garbage;

    Student *s5 = new Student(101);
    s5 -> display();
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
COnstructor called !
32571 -1847871072
COnstructor called !
COnstructor called !
0 0
Parametrised constructor demo
Constructor 2 called
22082 10
Constructor 2 called
0 101
```

So we can create our own parametrised constructor .

Ek aur cheez to remembr.Jabhi humne constructor banaya chahe woh default ho or parametrised ho humara inbuilt nikal jaata hain.Toh phir agar humne koi argument nahin diye toh error aajayega.

Student s1; //yeh line mein error ayega agar parametrised constructor banaya but default constructor nahin banaya and argument bhi nahin diya toh.So better to create one.

-------------------------------------------------------

#### KEYWORD "this" 
```C++
class Student{

    public:
    int rollNumber;

    private:
    int age;

    public :

    //Default constructor
    Student(){
        cout << "COnstructor called !" << endl;
    }
    
    Student(int rollNumber){  //yaha par bhi humne rollNumber hi diya
        rollNumber = rollNumber;//thoda problem lagg raha hain apan differentiate nahin kr paa rahe hain ,kaun kya hain.
        cout <<"Constructor 2 called" << endl;
    }

    int getAge(){
        return age;
    }

    int setAge(int a){
        age = a;
    }
    

    void display(){
        cout << age << " " << rollNumber << endl;
    }

};
```
 "this" -> holds the address of current object.


```C++
class Student{

    public:
    int rollNumber;

    private:
    int age;

    public :

    //Default constructor
    Student(){
        cout << "COnstructor called !" << endl;
    }

    Student(int r){  //1 argument constructor
        rollNumber = r;
        cout <<"Constructor 2 called" << endl;
    }

    Student(int a,int r){
        cout << "this : " << this << endl;
        age = a;
        rollNumber = r;
        cout << "Constructor 3 called !" << endl;
    }
```

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){


    Student s1(10,3000);
    cout << "Address of s1 : " <<&s1 << endl;
}
```
```t
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
this : 0x7ffc9d2ba990
Constructor 3 called !
Address of s1 : 0x7ffc9d2ba990
```

this ka address and address of s1 dono ka address exactly same hain.So jaisa hum soch rahe the waisa hi ho raha hain.

EXPLAINATION

Toh jaise hi hum likhte hain 
Student s1(10,3000);

### Toh humara joh s1 mein memory block banta hain,usko joh address hota hain,humare class ke function ke this keyword mein chala jaata hain.

So lets say agar s1 ka address hain 7000 toh this ka bhi address 7000 hain

```C++
    Student(int a,int r){
        cout << "this : " << this << endl;
        age = a;
        rollNumber = r;
        cout << "Constructor 3 called !" << endl;
    }
```

Toh yahan par jo age hai,actually implicitly uka meaning yeh hain this ka jo bhi address aaya hain us block ke age mein value daal do jo humne pass kari hain.

this -> memory address hold kr raha hain ,memory address toh sirf pointer hi hold krte hain .therefore **this** is a pointer.

```C++
    Student(int age,int rollNumber){
        cout << "this : " << this << endl;
        this -> age = a;
        this -> rollNumber = r;
        cout << "Constructor 3 called !" << endl;
    }
```
--------------------------------------------------------------

MORE ABOUT CONSTRUCTORS

1) Default constructor humme free mein milta hain jabh bhi class banate hain.Agar ek bhi constructor banaya toh yeh gayab hojata hain.

2) **COPY CONSTRUCTOR**

lets say humme age 10 and roll no 1001 save krna hain.

Student s1(10,1001);
Toh 2parameters lene wala paramaterised constructor initialise hoga

Student s2; -> iss case mein default constructor call hojayega 

Ab, humme kehna hain jo yeh default constructor s2 hain uski saari properties s1 ke jaisi ho, exactly same ho.
So humme s2 ke age mein bhi s1 ki age daali hain and s2 ke roll no mein s1 ka roll no daalna hain.Toh humme bola jaayega toh hum kaise krege?

s2.age = s1.age;
s2.rollno = s1.rollno;

After writing this 2 statements humare s2 ke age mein 10 ajayega and roll no mein bhi 1001 aajayega jo humne s1 ko provide kiya tha
But yeh kaam humne explicitly kiya hain.
Iski zaroorat nahin hain,we have a constructor for this,which is known as **COPY** constructor
What it does is !?
-> It creates an object which is a copy of another object.

Eg:
Jaise humne object create krege s1,phir humme saari properties s1 ki copy krni hain s2 mein 

```C++
Student s1(10,1001);
Student s2(s1);  // Argument mein s1 banaya(1)
```

Internally kya ho raha hoga?
Statement (1) intrepret hogi aise-> s2.Student(s1);Par humm use kr paa rahe hai usse

Bas itna hi hain.Also remember ,it is a constructor ,so yeh run hoga at the time of creation.

Lets try with the code !

MAIN CODE;

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1(10,1001);
    cout << "S1 : ";
    s1.display();
    Student s2(s1);
    cout << "S2 : ";
    s2.display();    
}
```

student.cpp code.
```C++
class Student{

    public:
    int rollNumber;

    private:
    int age;

    public :

    //Default constructor
    Student(){
        cout << "COnstructor called !" << endl;
    }

    Student(int r){  //1 argument constructor
        rollNumber = r;
        cout <<"Constructor 2 called" << endl;
    }

    Student(int a,int r){
        cout << "this : " << this << endl;
        age = a;
        rollNumber = r;
        cout << "Constructor 3 called !" << endl;
    }

    int getAge(){
        return age;
    }

    int setAge(int a){
        age = a;
    }
    

    void display(){
        cout << age << " " << rollNumber << endl;
    }

    void setAge(int a,int password){
        if(password != 123){
            return;
        }
        if(a<0){
            return;
        }
        age = a;
    }
};
```
OUTPUT

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
this : 0x7fffa067fbc8
Constructor 3 called !
S1 : 10 1001
S2 : 10 1001
```

Ab deke toh constructor sirf ek baar call hua.Exactly s2 ke liye constructor ka message nahin aaya bcoz s2 ke liye copy constructor call hua hain aur usme toh koi cout message hain hi nahin.

### SO IN THIS WAY WE CAN USE COPY CONSTRUCTORS TO CREATE COPY OF ANY OBJECT

We can do this dynamically too.
Here below are all examples that are valid.
```C++
    Student *s3 = new Student(20,2001);
    Student s4(*s3);
    s4.display();

    Student *s5 = new Student(*s3);
    Student *s6 = new Student(s1);
```

---------------------------------------------------------

### 3)COPY ASSIGNMENT OPERATOR (=)

Student s1 jiski age 10 hain and roll no 1001 hain
Student s2 jiski age 20 hain and roll no 2001 hain

Student s1(10,1001);
Student s2(20,2001);

Yeh dono hi objects humm already create kr chuke hain.Dono ke liye hi same parametrised constructor call ho chuka hain.
Now we want, dono objects create krne ke baad s1 ki value s2 mein copy ho jaaye
So we want student s2 mein bhi age 10 chaiye and roll no 1001 chaiye.

ABhi object creation krne ke baad toh copy constructor ko call  nahin kr skte bcoz constructor toh sirf ek hi baar call hota hain.Only at the time of its creation.Object ki lifetime mein ek se zyada hum constructor call nain krwa skte.
Abhi dono object ne constructor use kr lia hain toh humme explicitly daalna padega
s2.age = s1.age;
s2.rollno = s1.rollno;

But aisa krne ki zaroorat nahin hain .We have special operator available

**s2 = s1; -> aisa kre se hoga kya?**

s2.age = s1.age;
s2.rollno = s1.rollno;

Yeh dono ho jaayega ,humme likhne ki zarrorat nahin.Copy assignment operator humare liye krdega.

Copy constructor and copy assignment operator ,dono ka kaam same hain .The only difference is
Copy constructor -> at time of creation
Copy assignment operator- > jab memory mein created hain aur ek ki values ko dusre mein copy krna hain.

---------------------------------------------------

### 4) DESTRUCTOR ->  Object ki memory ko deallocate krana

1) Object name is same as class name
2) No return type
3) It takes no input arguments

Abee yeh toh apna exactly default constructor ki tarah hain?toh isko differentiate kaise krege?

We use a special symbol tilda (~) jisko apan ko constructor ke aage lagana hota hain.
Example

```C++
~Student(){

}

```
This is our destructor.Yeh bhi humme class create krte hi automatically create hojata hain humare liye aur humme free mein available hota hain.And iska kaam hota hain object ki memory ko deallocate krana.
Like constructor ,destructor bhi object ki lifetime mein ek hi baar call hota hain,wo bhi ekdum end mein,jab object destroy hone wala hota hain i.e. object ka scope finish hone wala hota hain, uss time pe destructor call hojata hain, just exiting before function, uski memory ko deallocate krne ke liye.

Yeh destructor bhi humm khudka bana sakte hain,but ek hi banega bcoz argument toh de nahin skte to bc ek hi banega na .

Jabh hum apna constructor banayege,default wala constructor humare liye nahin rahega.

```C++
class Student{

    public:
    int rollNumber;

    private:
    int age;

    public :

    //Default constructor
    Student(){
        cout << "COnstructor called !" << endl;
    }

    Student(int r){  //1 argument constructor
        rollNumber = r;
        cout <<"Constructor 2 called" << endl;
    }

    Student(int a,int r){
        cout << "this : " << this << endl;
        age = a;
        rollNumber = r;
        cout << "Constructor 3 called !" << endl;
    }

    int getAge(){
        return age;
    }

    int setAge(int a){
        age = a;
    }
    

    void display(){
        cout << age << " " << rollNumber << endl;
    }

    void setAge(int a,int password){
        if(password != 123){
            return;
        }
        if(a<0){
            return;
        }
        age = a;
    }

    //Destructor

    ~Student(){
        cout << "Destructor called ! ." << endl;
        //Ab humne apna destructor banaya hain,toh apna destructor 
        //call hoga in-built wala nahin
    }


};

```

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1(10,1001);
    cout << "S1 : ";
    s1.display();
    Student s2(s1);
    cout << "S2 : ";
    s2.display();    

    Student *s3 = new Student(20,2001);
    Student s4(*s3);
    s4.display();

    Student *s5 = new Student(*s3);
    Student *s6 = new Student(s1);
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
this : 0x7ffe02ef9770
Constructor 3 called !
S1 : 10 1001
S2 : 10 1001
this : 0x55eedf4f9280
Constructor 3 called !
20 2001
Destructor called ! .
Destructor called ! .
Destructor called ! .
```

Hiila object toh 6 hain, toh destructor sirf teen hi baar call kyu hua?Chalo dekhte hain.

Explaination : s1,s2 and s4 stack mein bana hain,and not in heap.Toh uspe deconstructor kaam krega.In s4,s5,s6 woh dynamic bana hain and stack mein toh sirf pointer hain.Uss pointer ka address will lead to heap and phir hota hain.Toh destructor heap ki memory ko allocate nahin kr skta.So? normally apan pointer ko delete kaise krte hain?
delete s3;

bas aise hi krna hain safaya ke liye.

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1(10,1001);
    cout << "S1 : ";
    s1.display();
    Student s2(s1);
    cout << "S2 : ";
    s2.display();    

    Student *s3 = new Student(20,2001);
    Student s4(*s3);
    s4.display();

    Student *s5 = new Student(*s3);
    Student *s6 = new Student(s1);

    delete s3;
    delete s5;
    delete s6;
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
this : 0x7ffe4d84e6d0
Constructor 3 called !
S1 : 10 1001
S2 : 10 1001
this : 0x55ad6c1d2280
Constructor 3 called !
20 2001
Destructor called ! .
Destructor called ! .
Destructor called ! .
Destructor called ! .
Destructor called ! .
Destructor called ! .
```
So this are the 4 functions jo humme har class ke saath free mein available hote hain,that we can use anytime and khudse bana bhi skte hain.But inbuilt wale use krne ka directly for help.

-----------------------------------------------------------

PLAYING WITH CONSTRUCTOR

Few more intresting examples.

Constructor 1 -> default constructor
Constructor 2 -> one argument(rollNumber) constructor
Constructor 3 -> 2 argument(age, rollNumber) constructor

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    Student s1;//default constructor call hoga with zero arguments

    Student s2(101); //constructor 2 called

    Student s3(20,102); //constructor 3 called

    Student s4(s3); // copy constructor call hoga

    s1 = s2; //copy assignment operator
    //koi constructor call nahin ho raha we just want s2 ki saari values s1 mein
    //copy ho jaaye.s1 and s2 ofc pehle se hi memory mein hain so
    // humne use kiya copy assignment operator to copy values from s2 to s1

    Student s5 = s4; // Student s5(s4);
    /* ab yaha par constructor bhi bann raha hain and s4 copy assignment bhi lagg raha
    hain
    So in two steps:
    Student s5;
    s5 = s4;
    But aisa nahin hota compiler isse 
    Student s5(s4) mein convert kr deta hain for optimization
    so dono kaam ek hi steps mein ho gaya 
    Copy assignment operator use nahin hoga*/

}
```
----------------------------------------------------------

We will create a class with the help of jitna bhi humne padh liya hain and cheezein clear bhi ho jaayegi.

We will code a fraction class ! 12/5
Numerator mein 12 rakha hoga
Denominator mein 5 rakha hoga

Yeh dono hi data members should be private,aur inki properties ko use krke humme dusre dusre operations perform krne hain.


```C++
class Fraction{

    private:

    int numerator;
    int denominator;

    public :

};
```
Now we want to restrict that kabhi bhi garbage value nahin jaana chaiye num and denominator mein.We want to restrict this.
Aisa consraint lagana hain.Kya kr skte hain?

Humm parametrised constructor banayege, and humne parametrised constructor bana liya toh default constructor accesible nahin rahega humare liye.Woh humare liye visible nahin hoga toh isse humm user ko force kr paayege toh numerator and denominator dono dena hi padega.

```C++
class Fraction{

    private:

    int numerator;
    int denominator;

    public :

    Fraction(int numerator,int denominator){
        this -> numerator = numerator;  //argument waali numerator ki value ko humare this waale numerator mein daaldo
        this -> denominator = denominator;
    }

    // Ab due to this parametrised constructor ,user ko dono value daalni hi padegi bcoz iss constructor ke wajah se baaki constructor chale gaye hain toh user forcefully value dega

    void print(){
       cout << this ->numerator << " / " << this -> denominator << endl;
    }
    //Return type void hoga bcoz humme print krna hain return kuch nahin krna hain

};
```
Ab humme agar iss class ka agar object banana hain toh humme likhna padega
Eg: Fraction f1(10,2);

TOh f1 ke liye ek block bann jaayega

Ab print function mein humme f1 object ka numerator and denominator access krna hain toh f1.print() krege .f1 ka numerator and denominator access krna hain toh we can access using **this** . 
f1 ka jo address hoga woh this keyword mein chala jaayega yeh toh malum hi hain apne ko ,jabh bhi name.function call krte hain toh uss function ke paass humare current object ka address this keyword mein chala jaata hain jiski help se hum uske properties ko access kr skte hain.

Ab humme print krna hain toh
```C++
    void print(){
       cout << this ->numerator << " / " << this -> denominator << endl;
    }
```

Kya humm this keyword hata skte hain?Is it compulsory?

Yes.We can bcoz agar humm this mention nahin kr rahe hain and humare argument mein bhi koi denominator nahin hain,toh implicitly this-> denominator ka matlab denominator hain.
So in this case humm nahin likhege toh chalega




Ab humme 2 fractions ko add krna hain F1 = 10/2 and F2 = 15/4

Function ka naam add hoga add(- - - )

Ab argument 2 dene ki zaroorat hain?Agar add nam ka function hoga toh 
Humme ek argument se kaam chal jaayega bcoz

Kyuki humme class ka function call krne ke liye we need object_name.function_name() and so we will call 
f1.add(f2) -> ab humne f1.add call kiya hain,toh add function ke "this" keyword mein toh f1 ka address toh chala hi jaayega with the use of this keyword.So hum f1 ki properties ko access kr skte hain.To humme f1 pass krne ki zaroorat nahin hain
Humme sirf f2 pass krna hain
Now return type kya rakhe?
We want jab hum f1.add(f2) krre tabh toh f1 and f2 add krne ke baad jo result ho woh f1 mein hi update ho jaye, f2 unchanged rahe.Toh naya kuch create hi nahin krna,toh return hi nahi krna, in that case humara return type void hona chaiye

Ab calculations:

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

        simpli fy();
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
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello

35 / 4
15 / 4
```
------------------------------------------------

COMPLEX NUMBER CLASS INTRODUCTION

Humari class mein 2data members hone chaiye.One is real and another is imaginary.Both should be set private 




