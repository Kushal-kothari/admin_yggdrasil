TO COMPILE THE PROGRAM: g++ filename.cpp
TO RUN THE PROGRAM : ./a.out

Eg:
 g++ helloworld.cpp -o hello
./hello
Abhi copy content of file of one into another
cp oldfilename.cpp newfilename.cpp

The way we used to write (start) in flowchart to start any program.Same way we use 

```C++
int main{

}
```
Bcoz jaise system aayega woh dekhega "main" kaha hain. Jab usne main ko dekha toh woh andar ghus jaayega


## HOW TO RUN C++ COMMAND IN TERMINAL
```
vi helloworld.cppkushal@kushal:~/Desktop/C++/test$ vi helloworld.cpp
kushal@kushal:~/Desktop/C++/test$ ls
helloworld.cpp
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp
kushal@kushal:~/Desktop/C++/test$ 
kushal@kushal:~/Desktop/C++/test$ ls
a.out  helloworld.cpp
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello (to put output file not in default a.out but in hello file)
kushal@kushal:~/Desktop/C++/test$ ls
a.out  hello  helloworld.cpp
kushal@kushal:~/Desktop/C++/test$ ./hello
kushal@kushal:~/Desktop/C++/test$ ls
a.out  hello  helloworld.cpp
```
Now we use "cout" to print.So we wont write the function to print what we wrote.So we use inbuilt but to use them we need to use library file which is iostream so first see error and then add iostream
```C++
#include <iostream>
using namespace std;

int main() {
    cout << "Hello World";
}
```
First line meant i want to include iostream file to use cout

### To go to a new line we use "Enter" .Similarly in C++ we use "\n"

### Semicolon : as we use fullstop to say line khatam ho gayi hain. We use semicolon ";" to C++.

Eg:
```C++
#include <iostream>
using namespace std;

int main() {
    cout << "Hello World"<< "\n";
}
```
Same koi difference nahin
```C++
cout << "Hello World\n";
```


Now instead of using "\n" barbar people have started using another thing "endl".Koi difference nahin hain ekdum same hain.

Eg:
```C++
cout << "Hello World" << endl  ;
```
big example:
```C++
#include <iostream>
using namespace std;

int main(){
	cout << "Hello World" << endl  ;
	cout << "check";
}

```

```
#include <iostream>
using namespace std;

int main(){
	cout << "Hello World" << endl  ;
	cout << "check";
}

```
```
[Running] cd "/home/kushal/Desktop/C++/test/" && g++ helloworld.cpp -o helloworld && "/home/kushal/Desktop/C++/test/"helloworld
Hello World
check
[Done] exited with code=0 in 0.472 seconds
```

Eg of adding two numbers:
```C++
#include <iostream>
using namespace std;

int main(){
    a = 10;
    b = 15;
    c = a + b;

    cout << c << endl;
}
```
Yeh program fullon galat hain bcoz humne space toh maang li lekin memory mein 2 cheezein batani padegi:1>kind of data 2>How big is data going to be.

So the thing is kiss type ka saaman daloge aur saaman kitna bada hona chaiye.And dono saath mein batana hain Ray .

so write : int a;(tumhe storage mila)
int a = 10;(content bhi dediya)
 correct eg
```C++
#include <iostream>
using namespace std;

int main(){
    int a = 10;
    int b = 15;
    int c = a + b;

    cout << c << endl;
}
``` 

## Various Datatypes Examples
* char d = 'x';(to store character of one byte).[remember to print character print 'x'.to print string "abcd"]
* float f = 1.23;(to store decimal no's  4 bytes ) 
* double xyz = 3.45(8 bytes)
* bool b = true (Very important :either true or false.they are constants nothing to change)

To check the size of anything.there is an inbuilt function: sizeof("variable");
Eg :
```C++
float f = 1.23;
int size = sizeof(f);
cout << size << endl;
}
```
Output 4 aayega iska :)

Eg Simple Interest

```C++
int a = 10;
float rate = 0.08;
int time = 10;
float SI;
SI = a*rate*time/100;
cout << SI << endl;
```

Remember
* float and double only they can store decimal numbers.float 4 bytes and double 8 bytes.
* jab tak initialize nahin kiya toh variable contains garbage value.

## When we want input from user we use cin
* Eg: cin >> a;
Now ek saath 2 nos user se lene hain toh
 cin >> a >> b;
We are able to use cin and cout bcoz it is defined in <iostream>

## HOW IS DATA BEING STORED

int a = 400;
400 will get converted into binary format anf then get stored in memory.

How to store char d = 'y';
Ab to store y we need ASCII value so ASCII store ho ga.(toh y ko ascii number hoga woh store hoga). 

How to store float values?
lets say 2.35
toh convert it into binary : 10.1101 (let's say).
ab do :1.- - - - *2raise to e

Eg: 2.35 -> 10,1101 -> 1.01101 * 2 raise to 1

100.1101 -> 1.001101 * 2 raise to 2

Aise hi double store krte hain

----------------------------------------------------
Eg to test ASCII value:

```C++
#include <iostream>
using namespace std;

int main(){
    int a;
    char c;
    a = 100;
    cout << c << endl;
}
```
Output d hain.

--------------

Ab humne socha ki upar waala program toh theek hain int 4 byte char 1 byte toh jo bhi 1st byte mein likha tha woh aagaya
## THIS IS KNOWN AS TYPECASTING

Eg: c = 'y';
    a = c;
    cout << c << endl;

output: 121 (ASCII value of y)
Logic :char ka one byte will go in first byte of 4 bytes in integer and remaining other 3 bytes meinzero aajayega.    

Ab lets see integer to float typecasting(chote se badha).

float f = 1.2;
a = f;
cut << a << endl;

OUTPUT : 1 explaination: jitna read kr skta tha usne read kiya baaki lost kr diya data this is known as **Implicit TYpecasting** bcoz woh apne aap typecasting krne ki koshish kr raha hain.

#### quick note : ASCII value of char 'a' is 97.'A' is 65

#### Negative numbers are stored as 2's compliment in system.

## ARITHMETIC OPERATORS
```C++
#include <iostream>
using namespace std;

int main(){
    int f;
    float celsius;
    cout << "Enter Fah value" << endl;
    cin >> f;
    celsius = (f - 32)*5/9;
    cout << celsius << endl;

}
```
Iska output hamesha integer hi aayega not float bcoz in formaula 5/9 it will always give integer not float bcoz int/int is int not float.So to get float/double yaa toh input float or output float.Similarly with remainder.

#### FEW OPERATORS -> + , - , * , / , % WHICH WE KNOW  

### RELATIONAL OPERATORS -> ONLY GIVE BOOLEAN OUTPUT ie 0 and 1 zero meaning false and 1 being true
```
bool isEqual = (a == b);
bool isGreater = (a > b);
bool isLess = (a < b);
cout << "Are they equal" << isEqual << endl;
cout << "A greater " << isGreater << endl;
cout << "A less " << isLess << endl;
```
### LOGICAL OPERATORS -> extension hain logical ki. Agar humme check krna hain kya a,b se bada hain **and** a,c se bhi bada hain dono condition check krna hain. Answer inke bhi 1 and 0 hi hoge.
   
## AND &&,  OR || ,  NOT !.     


Eg continuation of above eg
```C++
bool third = isEqual && isAGreater;
bool fourth = isEqual || isAGreater;
cout << ! isEqual << endl;
cout << fourth << endl;
cout << third << endl;

```


