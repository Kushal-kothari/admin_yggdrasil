# RECURSION

Function khudko call krta hain is known as recursion.Galat hain aisa nahin sochna chaiye humme.

We will use recursion when ek problem aise hain jiska solution thodi choti si problem pe depend krta hain.
Example:

n! = n*(n-1) * (n-2)*-------*1
n! = n * (n-1)!
fact(n) = n * fact(n-1)
fact(n-1) = n-1 * fact(n-2)


```C++
#include <iostream>
using namespace std;

int factorial(int n)    //function integer return krega and input bhi integer milega
{
    if(n == 0){     //sabse pehle base case
        return 1;
    }else{
        int smalloutput = n*factorial(n-1);       //
        return smalloutput;
    }
}

int main(){
    int n;
    cin >> n;
    int output = factorial(n);
    cout << output << endl; 
}
```

The main principal behind recursion chalta kaise hain.

PMI -> Principal of Mathematical Induction

F(n) is true for all n

(1) Prove F(0) or F(1) is true
(2) Induction Hypothesis : Assume that F(k) is true
(3) Induction step : Using (2) prove that F(k+1) is true.

So agar yeh valid hain toh apan ko logic check krne ki zaroorat nahin hain fact(4)->fact(3)->fact(2) etc sidha n ke liye sahin se likho pir toh chalega bidhu

So coding mein 3 steps are :
Base case means 0 or 1 ke liye
Assume krna ki choti problem ke liye chalega
Badi problem ke liye barabar code krneka


---------------------------------------------------------

FIBONACCI SERIES

0 1 1 2 3 5 8
Fib(n) = Fib(n-1) + Fib(n-2) Yeh fact se humein code krna hain.


Pehle hum PMI ki extended form dekhege phir hum start krege.

PMI mein bhi base case hota hain.Extended form mein bhi base case hota hain.

* 1)Base Case : prove F(0) or F(1) is true
* 2)Assume f(i) is true for all i less than equal to k
* 3)Use (2) to prove f(k+1) is true. 


--------------------------

Now next step with Recursion bcoz abh apan sirf ek integer pe hi kr rahe the baadme problem hard hone waali hain jo sirf recursion se hi ho paayegi.

So hum chote chote problem ko tackle krege and phir bade problem krege.

Problem : Check if array is sorted or not using recursion

Solution : ek array milega and array size milega 

Base case kya hoga that agar array ka size 0 or 1 hain toh woh sorted hain answer is true .So base case is taken care of.

Now abhi hum 0th and 1st element ko compare krege and check sahi order mein hain ki nahin
if a[0] > a[1] return false 
but agar true hain toh apne ko abhi 1 se n array check krna hain which is chota array i.e. recursion use krna hain .

```C++
#include<iostream>
using namespace std;

bool is_sorted(int a[], int size){
    if (size == 0 || size == 1){
        return true;
    }

    if(a[0]>a[1]){
        return false;
    }
    bool isSmallerSorted = is_sorted(a+1,size-1);
    return isSmallerSorted;
}

int main(){
    int n;
    cin >> n;
    int a[100];
    for(int i = 0;i<n;i++){
        cin >> a[i];
    }
    cout << is_sorted(a,n);

}
```

Given an array of length N, you need to find and return the sum of all elements of the array.
Do this recursively.
Input Format :
Line 1 : An Integer N i.e. size of array
Line 2 : N integers which are elements of the array, separated by spaces

Sample Input 1 :
3
9 8 9
Sample Output 1 :
26

```C++
int sum(int input[], int n) {
  /* Don't write main().
     Don't read input, it is passed as function argument.
     Return output and don't print it.
     Taking input and printing output is handled automatically.
  */

    if(n == 0){
        return 0 ;
    }
    if(n == 1){
        return input[0];
    }
    int smallsum = input[0] + input[1];
    int totalsum = smallsum + sum(input+2,n-2);
    return totalsum;
    
    
}
```

Problem

Check Number
Send Feedback
Given an array of length N and an integer x, you need to find if x is present in the array or not. Return true or false.
Do this recursively.
Input Format :
Line 1 : An Integer N i.e. size of array
Line 2 : N integers which are elements of the array, separated by spaces
Line 3 : Integer x
Output Format :
'true' or 'false'
Constraints :
1 <= N <= 10^3
Sample Input 1 :
3
9 8 10
8
Sample Output 1 :
true
Sample Input 2 :
3
9 8 10
2
Sample Output 2 :
false

```C++
bool checkNumber(int input[], int size, int x) {
  /* Don't write main().
     Don't read input, it is passed as function argument.
     Return output and don't print it.
     Taking input and printing output is handled automatically.
  */

    if(size == 0){       //base case
        return false;
    }
    if(x == input[0]){
        return true;
    }
    checkNumber(input+1, size-1,x);   //array ko ek aage kiya chota and size chota kiya
}
```

Geometric Sum
Send Feedback
Given k, find the geometric sum i.e.
1 + 1/2 + 1/4 + 1/8 + ... + 1/(2^k) 
using recursion.
Input format :
Integer k
Output format :
Geometric sum
Constraints :
0 <= k <= 1000
Sample Input 1 :
3
Sample Output 1 :
1.875
Sample Input 2 :
4
Sample Output 2 :
1.93750

-----------------------------
```C++ 
//(with normal)
double geometricSum(int k) {
    // Write your code here
    double sum = 0;
    double divide = 0.5;
    for(int i = 0;i<k;i++){
        
        sum = sum + divide;
        divide = divide*0.5;
    }
    return sum+1;

}
```

```C++ 
//(with recursion)
 double geometricSum(int k){
     double sum = 0;
     if(k == 0){
         return 1;
     }
     sum = 1+0.5*geometricSum(k-1);
     return sum;
 }

 ```

----------------------------------------------

* RECURSION 2

IMPORTANT: ONLY PROBLEM SOLVING

We have been given a character array,find length of a string ? (Using recursion)

BAse case yeh hoga ki agar zero pe hi null character rakha hoga which means apne string ki length zero hain
```C++
    if (s[0] == '\0'){
        return 0;
    }
```
else agar if pehla character kuch hain toh hum add 1 krege and sring ko ek chota krege meaning recursion lagayege



