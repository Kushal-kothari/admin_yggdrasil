## DYNAMIC ARRAY CLASS


In last session we talk about operator overloading and we discussed a lot about fraction class.

Now we want to create another class name Dynamic array.
What functionalities do we want?
we want an array of integers.And we want ki user jabh jaaye jitne chahein elements add kr paayein.

Abhi jo normal array hain,usmein problem hain ki humme usse array initially batana padta hain i.e. 5,10 N.Ek baar bol diya toh woh extend nahin ho paata.We want to remove this problem with the help of our own class which is name as Dynamic array.Jismein humm user ko allow krege ki woh jitne chchein elements ko add krta rahein.

Toh baat aayi ki kasein krna hain??
Toh lets say array ka size hain 5.And agar user ne 6th element daalne ki koshish krri toh humm naya array banadege uske double size ka .Usmein purani value add kr dege and array ko udhar oint krdege.Thoda jagah waste hoga but chalega.

-------------------------------------------------------

How to implement??What should be our data members!!!!

Pehle toh array hona chaiye .Toh apan pehle array rakh dege uska naam rakhdege data.Usse humein dynamically initialise krna hain ,so abhi apan sirf uska pointer rakh lege.

int *data;

and constructor mein jaake we will do

data = new int[5];

--------------------------

So humara data naam ka array hain jo ki 5 size ka hain.Visualise in terms of blocks.

Now we want to have a function known as addElement.
Iska kaam hoga array mein last mein jaake baithna hain.

Use ek element dega woh humme next index mein jaake add krna hain.
Toh samajh abhi toh array empty hain toh first element dalege apan aise 
data[0] = elem;//10 user ne diya 
phir next element aise aise krte jaayege. 

Toh humme ek aur variable chahiye jo bata skae ki next index usse kaha jaana hain. therefore int nextIndex;
and nextIndex ko increment krte rahege.
Toh initally nextIndex ki value zero hogi bcoz jaise hi user ne vaue daali toh woh zereoth index pe aajana chahiye phir usse increment krge.

Ab humm aise value add krte rahege.Humm tab tak add kr skte hain jab tak value bhar naa jayein i.e. 5 elements aana jaayein
Jab nextIndex == size of array hogaya humein double krna hain.

Toh abhi apan likhege full program.

class DynamicArray banayege and data ko apan private rakhege.Users ko kuch bhi access krna hoga,humare functions ke through access krna hoga.
Toh apan 3 variable banaye jo pehele discuss kiya hain

```C++
class DynamicArray{
    int *data;
    int nextIndex;
    int capacity;  // total size
}
```
Abhi inke liye constructor banate hain.

```C++
class DynamicArray{
    int *data;
    int nextIndex;
    int capacity;  // total size

    public :

    DynamicArray() {
        data = new int[5];
        nextIndex = 0;
        capacity = 5;
    }
}
```

Abhi addIndex ka function jismein if condition ka hi paisa hain.Toh woh dekht hain .Ki new array banane se pehle kya krna hain.

```C++
    void add(int element){
        if(nextIndex == capacity){

        }
        data[nextIndex] = element;
        nextIndex++;
    }
}
```

Abhi humm sirf if ki condition pe hi baat krege.
Toh lets assume ki jo humara "data" hain of array of size 5 right now containing elements 10, 20, 30, 40 and 50.Toh abhi humara nextIndex mein 5 hoga.Humari capacity bhi 5 hi hain.
Toh ab koi nayi value aayi woh jaayegi if condition mein.
Toh humein double krna hoga.Ab double kaise karein,uske liye we need to create a new array of twice its initial capacity.

AB humein purana content nayein rra mein copy krlena chaiye.
```C++
    void add(int element){
        if(nextIndex == capacity){
            int *newData = new int[2*capacity];
            for(int i=0;i<capacity;i++){
                newData[i] = data[i];
            }
        }
        data[nextIndex] = element;
        nextIndex++;
    }
```

Ab yaar jo purana data hain woh humne copy toh kr liya.Lekin yeh newData humnein yaha abhi initialise kiya hain.Toh iska scope bahar jaate hi khatam ho jaayega.

Toh filhal abhi ka scenario yeh hain ki,that "data" is pointing to fully occupied array .
And "newData" is pointing to new array jisme values humne daal di hain.So apna concern is "if" se bhar jaate hi newData ka scope toh khatam hojayega.Toh newData toh finish hojayega.
So humein data ko bolna chaiye ki go and point to the newly created array.
Also keep in mind "data" ko reassign krne se pehle uski memory ko deallocate krne ki responsibility apni hain.Also end mein apni capacity ko double krni chaiye

```C++
    void add(int element){
        if(nextIndex == capacity){
            int *newData = new int[2*capacity];
            for(int i=0;i<capacity;i++){
                newData[i] = data[i];
            }
            delete [] data;
            data = newData;
            capacity == capacity*2;
        }
        data[nextIndex] = element;
        nextIndex++;
    }
```

Now lets create one more function getData.Usme index milega toh uska value dedena hain.Nahin mila toh -1 return krne ka.
```C++
    int get(int i){
        if(i < nextIndex){
            return data[i];
        }
        else{
            return -1;
        }
    }
```

Ab humme ek aur function banana hain,jisme humme user se 2 elements mil rahe hoge ek index jaha daalna hain and ek index ki value e.g. 4th index pe value 40 daaldo.

```C++
    void add(int i,int element){
        if(i < nextIndex){
            data[i] = element;
        }
        else if(i == nextIndex){
            add(element);
        }
        else{
            return;
        }
    }
```

Ab result janne ke liye print bhi kr lete hain

```C++
    void print(){
        for(int i=0;i<nextIndex;i++){ // ((1)
            cout << data[i] << " ";
        } 
        cout << endl;
    }
```
(1) -> yaha par capacity daalte toh poora capacity tak print hota samjhe nahin samjhe toh try kr run krne kaa.

Ab chalo isse use krte hain iski maa ka.

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    DynamicArray d1;
    d1.add(10);
    d1.add(20);
    d1.add(30);
    d1.add(40);
    d1.add(50);
    d1.add(60);

    d1.print();
}
```

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
10 20 30 40 50 60
```

TOh sahii hain ek baar poora code saaath mein likh dete hain for convinience.

student.cpp

```C++
class DynamicArray{
    int *data;
    int nextIndex;
    int capacity;  // total size

    public :

    DynamicArray() {
        data = new int[5];
        nextIndex = 0;
        capacity = 5;
    }

    void add(int element){
        if(nextIndex == capacity){
            int *newData = new int[2*capacity];
            for(int i=0;i<capacity;i++){
                newData[i] = data[i];
            }
            delete [] data;
            data = newData;
            capacity = capacity*2;
        }
        data[nextIndex] = element;
        nextIndex++;
    }

    int get(int i){
        if(i < nextIndex){
            return data[i];
        }
        else{
            return -1;
        }
    }

    void add(int i,int element){
        if(i < nextIndex){
            data[i] = element;
        }
        else if(i == nextIndex){
            add(element);
        }
        else{
            return;
        }
    }

    void print(){
        for(int i=0;i<capacity;i++){
            cout << data[i] << " ";
        } 
        cout << endl;
    }
};
```
helloworld.cpp
```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    DynamicArray d1;
    d1.add(10);
    d1.add(20);
    d1.add(30);
    d1.add(40);
    d1.add(50);
    d1.add(60);

    d1.print();
}
```

Ab aur bhi naye concept dekhte hain.

Ab humm ek aur object banayege

Dynamic array d2(d1); // Copy constructor

isse uski saari value d2 mein aajayegi but this is shallow copy.

Short revision of Shallow copy woh poora ka poora copy krta hain bhidu.

Ab jaie yeh likha

Dynamic array d2(d1);

Toh uske
```C++ 
    int *data;  //isme d2 ko address mil jaayega d1 ka same jaha point karring
    int nextIndex; // same value of d1
    int capacity;  // total size
```

Toh jo bhi changes d1 mein krege woh automatically d2 mein bhi dikhega 
nahin yakin,just chexck it

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    DynamicArray d1;
    d1.add(10);
    d1.add(20);
    d1.add(30);
    d1.add(40);
    d1.add(50);
    d1.add(60);

    d1.print();

    DynamicArray d2(d1);  // copy constructor
    
    d1.add(0,100);
    
    d2.print();

}
```
```T
kushal@kushal:~/Desktop/C++/test$ ./hello
10 20 30 40 50 60 
100 20 30 40 50 60 
```
See d2 mein humne changes bhi nahin kiye toh bhi hogaya bcoz woh address ko point kr raha hain shallow copy hain iski maa ka.

Also remember naa,that copy assignment operator bhi shallow copy krta hain.Nahin yakin check krle

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    DynamicArray d1;
    d1.add(10);
    d1.add(20);
    d1.add(30);
    d1.add(40);
    d1.add(50);
    d1.add(60);

    d1.print();

    DynamicArray d2(d1);  // copy constructor

    DynamicArray d3;
    d3 = d1; //copy assignment operator

    d1.add(0,100);
    d3.print();

}
```

```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
10 20 30 40 50 60 
100 20 30 40 50 60 
```

So once again remember budhu,copy constructor and copy assignment operator dono shallow copy krte hain.

So agar deep copy krani hain,toh humme khudse deep copy kri padegi bruh.

Deep copy mein apan blindly addresss copy nahin krege,but apan ek naya array banayege aur usme saari values daalege.Krna padta hain bruh krwuch padse.

## DEEP COPY KRANI HAIN TOH KHUD SE ARRAY BANANA PADEGA .SEEKH LE IDHAR HI BRUH.BAAR BAAR NAHIN SIKHAYEGA MEIN BC.

Toh copy constructor create krne ke liye constant reference variable pass krna hoga.toh constructor baayege and usme object pass krege which would be by constant reference)[Copy krna hain isliye constant reference pass kr diya]
```C++
DynamicArray(DynamicArray const &d){

}
```

Ab shallow copy nahin krni hain deep copy krni hain.Shallow copy krne ke time ho kya raha hoga ki see niche 

```C++
DynamicArray(DynamicArray const &d){
    this -> data = d.data; //THis is shallow copy jo nahin krna hain bachi,
    this -> nextIndex = d.nextIndex;  //yeh to integer hain 
    this -> capacity = d.capacity;//yeh bhi toh chalega
}
```
Toh we want ki hum deep copy krre iski maa ka.So humme naya array banana padega "this" ke liye

```C++
DynamicArray(DynamicArray const &d){
    //this -> data = d.data; shallow copy jo nahin krni hain

    this -> data = new int[d.capacity];//itne size ka apne ko array bana lena chaiye.
    
        /* code */
    this -> nextIndex = d.nextIndex; 
    this -> capacity = d.capacity;
}
```
Ab humme array copy krna hain.

```C++
    DynamicArray(DynamicArray const &d){
    this -> data = new int[d.capacity];
    for(int i=0;i < d.capacity;i++){  //Deep Copy
        this -> data[i] = d.data[i];
    }
    this -> nextIndex = d.nextIndex; 
    this -> capacity = d.capacity;
    }
```

Ab abhi yeh code krne se shallow copy nahin hogi jo by default ho rhi thi and abhi d2 mein changes nahin hoge.

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    DynamicArray d1;
    d1.add(10);
    d1.add(20);
    d1.add(30);
    d1.add(40);
    d1.add(50);
    d1.add(60);


    DynamicArray d2(d1);  // copy constructor

    d1.add(0,100);
    d1.print();
    d2.print();

}
```

```C++
class DynamicArray{
    int *data;
    int nextIndex;
    int capacity;  // total size

    public :

    DynamicArray() {
        data = new int[5];
        nextIndex = 0;
        capacity = 5;
    }

    void add(int element){
        if(nextIndex == capacity){
            int *newData = new int[2*capacity];
            for(int i=0;i<capacity;i++){
                newData[i] = data[i];
            }
            delete [] data;
            data = newData;
            capacity = capacity*2;
        }
        data[nextIndex] = element;
        nextIndex++;
    }

    int get(int i){
        if(i < nextIndex){
            return data[i];
        }
        else{
            return -1;
        }
    }

    void add(int i,int element){
        if(i < nextIndex){
            data[i] = element;
        }
        else if(i == nextIndex){
            add(element);
        }
        else{
            return;
        }
    }

    void print(){
        for(int i=0;i<nextIndex;i++){
            cout << data[i] << " ";
        } 
        cout << endl;
    }

    DynamicArray(DynamicArray const &d){
    this -> data = new int[d.capacity];
    for(int i=0;i < d.capacity;i++){  //Deep Copy
        this -> data[i] = d.data[i];
    }
    this -> nextIndex = d.nextIndex; 
    this -> capacity = d.capacity;
    }
    
};
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
100 20 30 40 50 60 
10 20 30 40 50 60 
```

ABh aise hi humm apne Copy Assignment Operator ko bhi deep copy mein convert krege so that woh default use naakare by operator Overloading.Chaliye krte hain

So Copy assignment operator kaise bana hoga,usne equal to ko overload kiya hoga na.Toh ofc apan bhi krege overload.
```C++
    void operator=(DynamicArray const &d){
    this -> data = new int[d.capacity];
    for(int i=0;i < d.capacity;i++){  //Deep Copy
        this -> data[i] = d.data[i];
    }
    this -> nextIndex = d.nextIndex; 
    this -> capacity = d.capacity;
    }
```

Code exactly same hain upar ki tarah.
Ab apan main file mein assignment "=" use krege toh deep copy hogi.

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    DynamicArray d1;
    d1.add(10);
    d1.add(20);
    d1.add(30);
    d1.add(40);
    d1.add(50);
    d1.add(60);


    DynamicArray d2(d1);  // copy constructor


    DynamicArray d3;

    d3 = d1;  //d1 and d3 naamak array

    d1.add(0,100);
    d1.print();
    d2.print();
    d3.print();

}
```

```T
kushal@kushal:~/Desktop/C++/test$ ./hello
100 20 30 40 50 60 
10 20 30 40 50 60 
10 20 30 40 50 60 
```

SO JUST REMEMBER JABH BHI KISI CLASS MEIN ARRAY USE HO RAHE HAIN TOH INBUILT COPY CONSTRUCTOR AUR DEEP COPY CONSTRUCTOR YEH SABH DHYAN RAKHNA.HUM KHUD KA CREATE KRNA CHAIYE.

Final Code

```C++
class DynamicArray{
    int *data;
    int nextIndex;
    int capacity;  // total size

    public :

    DynamicArray() {
        data = new int[5];
        nextIndex = 0;
        capacity = 5;
    }

    void add(int element){
        if(nextIndex == capacity){
            int *newData = new int[2*capacity];
            for(int i=0;i<capacity;i++){
                newData[i] = data[i];
            }
            delete [] data;
            data = newData;
            capacity = capacity*2;
        }
        data[nextIndex] = element;
        nextIndex++;
    }

    int get(int i){
        if(i < nextIndex){
            return data[i];
        }
        else{
            return -1;
        }
    }

    void add(int i,int element){
        if(i < nextIndex){
            data[i] = element;
        }
        else if(i == nextIndex){
            add(element);
        }
        else{
            return;
        }
    }

    void print(){
        for(int i=0;i<nextIndex;i++){
            cout << data[i] << " ";
        } 
        cout << endl;
    }

    DynamicArray(DynamicArray const &d){
    this -> data = new int[d.capacity];
    for(int i=0;i < d.capacity;i++){  //Deep Copy
        this -> data[i] = d.data[i];
    }
    this -> nextIndex = d.nextIndex; 
    this -> capacity = d.capacity;
    }


    void operator=(DynamicArray const &d){
    this -> data = new int[d.capacity];
    for(int i=0;i < d.capacity;i++){  //Deep Copy
        this -> data[i] = d.data[i];
    }
    this -> nextIndex = d.nextIndex; 
    this -> capacity = d.capacity;
    }
```

```C++
#include <iostream>
using namespace std;
#include "student.cpp"

int main(){
    DynamicArray d1;
    d1.add(10);
    d1.add(20);
    d1.add(30);
    d1.add(40);
    d1.add(50);
    d1.add(60);


    DynamicArray d2(d1);  // copy constructor


    DynamicArray d3;

    d3 = d1;

    d1.add(0,100);
    d1.print();
    d2.print();
    d3.print();

}
```

Abhi ek mast chakachak polynomial class ka question discuss krege.
polynomial mein 2 cheezein hoti hain : 3x2 + 4x5 - x7

Toh humein isme 2 cheezein save krni hain.coefficient and degree.

So we will make an array jisme initially poora zero hoga.But fhir humm jaha degree hain uske waha uska indx daal dege.Iss tarah se hum polynomial ko save krege.So array ke indexes ko we are treating as degress and uske andar ki values ko we are using as coefficients.

Toh iss question ko bhi dynamic array ki tarah hi krna hoga.ek array int *degCoeff; and second variable capacity.

So,we need to create 
Default constructor,
Copy Constructor and 
Copy assignment Operator.