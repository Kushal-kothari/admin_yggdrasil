In flowchart we were learning decision box and based on condition true or false we were able to choose which dirccn we wanted to go.
So how to make decision boxes in C++? basically its if and else.
SYNTAX:
```
if(condition true){
(do)
}else{
(do)
}
```
## ideally on condition true try to do boolean over there.

# VARIATION OF IF ELSE
* Only if -> condition true hain toh yeh krna hain wrna kuch nahin krna hain. 
* if ke andar if-else block or similarly else ke andar is-else block
* if,else if,else if,else if................(last ka else optional) .

### QUESTION TIME

Write a program that takes a character as input and prints either 1, 0 or -1 according to the following rules.
1, if the character is an uppercase alphabet (A - Z)
0, if the character is a lowercase alphabet (a - z)
-1, if the character is not an alphabet
Input format :
Single Character

```C++
#include<iostream>
using namespace std;

int main() {
	// Write your code here

    char a;
    int b;
    cin >> a;
    cout << a<<endl;
    if(97 < a &&  a < 122){
        cout <<"0"<<endl;
    }
    else if(65 < a && a < 90){
        cout <<"1"<<endl;
    }
    else{
        cout <<"-1"<<endl;
    } 
}
```
My solution
```C++
#include<iostream>
using namespace std;

int main() {
	// Write your code here

    char a;
    int b;
    cin >> a;
    if(97 < a &&  a < 122){
        cout <<"0"<<endl;
    }
    else if(65 < a && a < 90){
        cout <<"1"<<endl;
    }
    else{
        cout <<"-1"<<endl;
    }
    
    
}

```



So above we just looked at some code depending on some condition and executing according to that.but one thing is missing from flowchart.Jab tak ek condition meet nahin ho rahi thi hum loop mein kaam kare jaa rahe the,kare jaa rahe the.How we were reading it while the condition is true do that.

Syntax:
```C++
while(condition true){

}
``` 
## WHILE LOOP -> SOME PART OF CODE WHICH WE WANT TO REPEAT TILL THE CONDITION IS SATISFIED, WE USE WHILE LOOP. 

Eg
```C++
int main() {
	// Write your code here
int i = 1,N;
cin >> N;
while(i<= N){
    cout << i<< endl;
    i = i +1;
}
```
Example_2 :to check if number is prime or not.Logic: Number is N.So check from 2 to N-1 if remainder 0 toh composite or it is prime.

Solution

```C++
int main() {
	// Write your code here
int i = 2,N;
bool divided = false;
cout << "Enter N";
cin >> N;
while(i<N){
    if( N % i == 0){
        cout << "Number is not a prime"<< endl;
        divided = true;
    }
    i = i + 1;
}
if(!divided){
    cout << "Prime" << endl;
}


}


Eg: Given a number N, print sum of all even numbers from 1 to N.
My solution

```C++
#include<iostream>
using namespace std;

int main() {
	// Write your code here sum of even number from 1 to N
    int i = 0,Sum = 0,N;
    cin >> N;
    while(i<=N){
        if(i%2 ==0){
            Sum = Sum + i;
        }
        i = i + 1;
    }
    cout << Sum << endl;
}
```

Actual Solution
```C++
#include<iostream>
using namespace std;

int main() {
	// Write your code here sum of even number from 1 to N
    int i = 0,Sum = 0,N;
    cin >> N;
    while(i<=N){
        if(i%2 ==0){
            Sum = Sum + i;
        }
        i = i + 1;
    }
    cout << Sum << endl;
}
```
Example:
Fahrenheit to Celsius Table
Send Feedback
Given three values - Start Fahrenheit Value (S), End Fahrenheit value (E) and Step Size (W), you need to convert all Fahrenheit values from Start to End at the gap of W, into their corresponding Celsius values and print the table.
Input Format :
3 integers - S, E and W respectively 
Output Format :
Fahrenheit to Celsius conversion table. One line for every Fahrenheit and corresponding Celsius value. On Fahrenheit value and its corresponding Celsius value should be separate by tab ("\t")
Constraints :
0 <= S <= 80
S <= E <=  900
0 <= W <= 40 
Sample Input 1:
0 
100 
20
Sample Output 1:
0   -17
20  -6
40  4
60  15
80  26
100 37

Solution
```C++
#include<iostream>
using namespace std;

int main(){
    int S,E,W,Farn;
    cin >> S >> E >> W;
    while(S <= E){            
            Farn = (S - 32)*5.0/9;
            cout <<S<<"\t"<<Farn<< endl;
            S = S + W;
    }  
}
```

### learning from previous example.kuch nahin tab ke liye use tis:  cout <<S<<"\t"<<Farn<< endl; ("\t")

## PATTERNS

* very important concept.Printing hamesha aisi hoti hain _ _ _ _ Ek baar enter daba diya toh wapas upar nahin aa skte.THis is how cout works.Which means ek baar jo row chod di waha wapas nahin jaa sakte.

So eg: i = 1; 
       while(i<=n){
           iske andar abhi horizantally kya krna hain.
           Ek generic code likhna hain jo i'th row ko print krega.
       }

* Ab column mein lets say humme for eg:
1
1 2
1 2 3
1 2 3 4

krna hain.So now row "i" kaam kr raha hain jo ho gaya for a column now we will use "j"

```C++
i = 1;
while(i<=n){
    j = 1;
    while(j<=i){
        cout << j;
        j = j+1;
    }
    cout << endl;
    i=i+1;
}
```
Example 2:
print
1
23
456
78910

```C++
bring one more variable "value"

#include<iostream>
using namespace std;

int main(){
    int i,n,j,value;
    cin >> n;
    
i = 1;
value =1;
while(i<=n){
    j = 1;
    while(j<=i){
        cout << value;
        j = j+1;
        value = value+1;
    }
    cout << endl;
    i=i+1;
}
}

```
Abhi one more pattern
   1
  23   
 456
78910 
space hona chaiye which is important. 

explaination:kuch spaces aarahe hain phir kuch likhte hain.2nd row mein spaces kam aur likhte zyada hain,End mein toh hain hi nahin.
For n = 4 which is above example first row mein 3 spaces hain.2nd mein 2 hain.3rd mein 1 hain.end mein nahin hain ,so for ith row there are n-i spaces.

* So spaces ke liye we are making one more counter of while loop jo sirf space print krega
while(k<=n-i){
    cout << " ";
    k = k + 1;
}

So solution
```
#include<iostream>
using namespace std;

int main(){
    int i,n,j,value;
    cin >> n;
    
i = 1;
value =1;
while(i<=n){
    int k = 1;
    while(k<=n-i){
    cout << " ";
    k = k + 1;
}
    j = 1;
    while(j<=i){
        cout << value;
        j = j+1;
        value = value+1;
    }
    cout << endl;
    i=i+1;
}
}
```
IMPORTANT EXAMPLE
1
23
345
4567

Below is my solution

```C++
#include<iostream>
using namespace std;

int main(){
    int i = 1;
    int n,j,value;
    cin >> n;
    while(i<=n){
        j = 1;
        value = i;
        while(j<=i){
            cout << value;
            value = value+1;
            j = j + 1;
        }
        cout << endl;
        i=i+1;
    }
}
```
Real Solution:
```C++
#include<iostream>
using namespace std;

int main(){
    int i = 1;
    int n,j,value;
    cin >> n;
    while(i<=n){
        j = 1;
        value = i;
        while(j<=i){
            cout << value;
            value = value+1;
            j = j + 1;
        }
        cout << endl;
        i=i+1;
    }
}
```
Learning: bro jab bhi kuch column mein changes krne hain toh naya variable introduce kar bro.

## STAR PATTERN
for n = 4
   *
  ***
 *****
*******

Bhau ka solution.
```C++
#include<iostream>
using namespace std;

int main(){
    int i = 1,j,N;
    cin >> N;
    while(i <= N){
        j = 1;
        while(j<=N-i){
            cout << ' ';
            j = j + 1;
        }
        j =1;
        while(j<=2*i-1){
        cout << '*';
        j = j +1;
        }

        cout << endl;
        i =i + 1;
    }
}  
```
Real solution
### remember jab bhi koi pattern print krna hota hain we need to figure out i'th row mein kya chal rha hota hain.
first row mein 1 star hain.2nd row mein 3 star hain 3rd row mein 5 star hain.**Its a typical (2i-1) formula**.

Now star pehle se print nahin krne hain.1st row mein 3 space hain.2nd row mein 2 space hain and so on.So it is basically **(n-i)**

So ith row mein 2 kaam krna hain
* n-i spaces
* 2i - 1 stars

and i ko 1 se lekar n tak lekar jaana hain bas.

```C++
#include<iostream>
using namespace std;

int main(){
    int i = 1,j,N;
    cin >> N;
    while(i <= N){
        j = 1;
        while(j<=N-i){
            cout << ' ';
            j = j + 1;
        }
        j =1;
        while(j<=2*i-1){
        cout << '*';
        j = j +1;
        }

        cout << endl;
        i =i + 1;
    }
}  
```
Example:
Write a program to input an integer N and print the sum of all its even digits and sum of all its odd digits separately.
Digits mean numbers, not the places! That is, if the given integer is "13245", even digits are 2 & 4 and odd digits are 1, 3 & 5.

```C++
#include<iostream>
using namespace std;

int main() {
    int N,even = 0,odd = 0;
    cin >> N;
    int a;
    while(N != 0){
        a = N%10;
        if(a%2 == 0){
            even = even + a;
        }else{
            odd = odd + a;
        }
        N = N/10;
    }
    cout << even << " " << odd;
}
```

Example:
Write a program to find x to the power n (i.e. x^n). Take x and n from the user. You need to print the answer.

```C++
#include<iostream>
using namespace std;

int main() {
    int x,n,i=0,a = 1;
    cin >> x >> n;
    if(n>0){
        while(i<n){
            a = x*a;
            i = i + 1;
        }
    }else
    {
        a  = 1;
    }
        
    cout << a;    	
}
```
