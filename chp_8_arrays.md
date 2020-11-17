# ARRAYS

Problem : We are given 10 integers .We want to save them all and then we need to figure out what is the largest one.So users se 10 integer mill rahe hain ab woh baadmein uska kya krna hain !
Arrays are basically list of similar kind of elements.

Lets go to the past: int a; -> krne par 4 bytes of memory store hota hain 

Ab array create krna hain and collectively usko store krna hain.

## int b[10];

yaha b -> name of a array and 10 is length of an array.

Ab array ke block mein 10 integer ko store kr skte hain toh in order to differentiate elements we provide indexes to every element which starts from 0 and goes till -> n-1

Now how to individually store values in array Eg : b[0] = 5;
cout << b[0];

Now we were doing with int datatype similarly with other datatype also.

## IMPORTANT POINTS REGARDING ARRAY:

* KABHI BHI ARRAY CONSTANT LENGTH KA HONA CHAIYE VARIABLE LENGTH KA NAHIN

Eg: int a[5]; int b[10]; -> chalega

int a;
cin >> a;
int input[a]; -> Yeh nahin chalega user ke hisaab se array banane ka hi nahin hain
So give a bigger array jagah waste hogi tobhi chalega but use bigger array.

Example of how to take input as array and print the array:
```C++
#include<iostream>
using namespace std;

int main(){

    int input[100];
    int n;
    cin >> n;

    for(int i = 0;i<=(n-1);i++){
        cin >> input[i];
    }
    for(int i = 0;i<=(n-1);i++){
        cout << input[i] << endl;
    }    
}
```
Eg: Print the largest element of an array from given no from use
```C++
#include<iostream>
using namespace std;

int main(){

    int input[100];
    int n;
    cin >> n;

    for(int i = 0;i<=(n-1);i++){
        cin >> input[i];
    }
    int max = input[0];
    for(int j =1;j<=n-1;j++){
        if(max<input[j]){
            max = input[j];
        }
    }
    cout << max;            
}
```
```T
kushal@kushal:~/Desktop/C++/test$ ./hello
5
3
16
55
0
-9
55
```
AB upar waala code sahi chal raha hain for any given array size except **0** . If n=0 toh answer wrong hojayega bhaiya.

Toh solution yeh hain ki hum max ko zero se initialize kr dete hain and jo first integer hain array ka usko bhi for loop mein faal dete hain compare hone ke liye

```C++
    int max = 0;
    for(int j =0;j<=n-1;j++){
        if(max<input[j]){
            max = input[j];
        }
```

Sahi humne yeh bug toh fix kr diya but abhi -ve number daale dekha toh saala malum padha ki yeh maximum tabh bhi zero de raha hain .Yeh kya gochi hain

```T
kushal@kushal:~/Desktop/C++/test$ ./hello
0
0
kushal@kushal:~/Desktop/C++/test$ ./hello
3 
-9
-3
-5
0
```

Toh iska solution yeh hain ki max ko ek bade negative number se initialize krdo fhir dekho kamaal

```C++
#include<iostream>
using namespace std;

int main(){

    int input[100];
    int n;
    cin >> n;

    for(int i = 0;i<=(n-1);i++){
        cin >> input[i];
    }
    int max = -1000;
    for(int j =0;j<=n-1;j++){
        if(max<input[j]){
            max = input[j];
        }
    }
    cout << max;            
}
```

## HOW ARE ARRAYS STORED IN MEMORY

Jab apan a[i] likhte hain : i ka significance kya hain.i ka matlab hain ki woh starting index se kitna duur hain
a[0] matlab bilkul duur nahin
a[1] matlab 4 byte durr

## JUST FOR REMEMBERANCE

* ## sizeof(variable) -> use for knowing the size of that variable
* ## include <climits> -> used for knowing 1)INT_MIN(integer ki minimum value)  2)INT_MAX(integer ki maximum value)


## ARRAYS AND FUNCTIONS

```C++
int main(){
    int b[5];
    fun(b);    //idhar array ka sirf naam baaki kuch nahin.
}

void fun(int b[]){  //idhar array ka sirf square bkt
    ------
}
```
## remember:function mein jabbhi hum array ko pass kr rahe hoge toh humme array ke saath saath explicitly uska size bhi pass krna hoga. Reason being there is no other way ki hum uske array se uska size figure out kr paaye.

VERY IMPORTANT EXAMPLE OF FINDING A SINGLE **DUPLICATE NUMBER** FROM AN ARRAY

```C++
#include<iostream>
using namespace std;

int duplicateNumber(int arr[], int size){
    int n;
    n = size;
    for(int j=0;j <=( n-1 ); j++) {
        int unique = arr[j];
        for(int i=0;i<=(n-1);i++){
            if(i != j){
                if(arr[j] == arr[i]){
                    
                }            
            }
        }        
    }
    
}

int main(){
    int arr[5] = {7,4,2,2,1};
    int d_n = duplicateNumber(arr,5);
    cout << d_n << endl;
}
```

VERY IMPORTANT EXAMPLE OF FINDING A SINGLE **UNIQUE NUMBER** FROM AN ARRAY

```C++
int findUnique(int * arr, int size){
    for(int i=0; i<size;i++){
        int j;
        for(j=0;j<size;j++){
            if(i!=j){
                if(arr[i] == arr[j]){
                    break;
               }
            }
        }
        if(j==size){
            return arr[i];
        }
    }
}
```


Array Intersection

You have been given two integer arrays/list(ARR1 and ARR2) of size M and N, respectively. You need to print their intersection; An intersection for this problem can be defined when both the arrays/lists contain a particular value or to put it in other words, when there is a common value that exists in both the arrays/lists.

```C++ 
void intersection(int *input1, int *input2, int size1, int size2){
    int n1 = size1;
    int n2 = size2;

    int duplicate;
    for(int i=0;i<=(n1-1);i++){
        duplicate = input1[i];
        for(int j=0;j<=(n2-1);j++){
            if(duplicate == input2[j]){
                cout << duplicate <<" " ;
                input2[j] = -101; // match mila toh repeat matc na mile toh number hi change kr diya array ka
                break;
            }
        }
    }
}
```

Sort 0 1
You are given an integer array A that contains only integers 0 and 1. Write a function to sort this array. Find a solution which scans the array only once. Don't use extra array.
You need to change in the given array itself. So no need to return or print anything.
Input format :
Line 1 : Integer N (Array Size)
Line 2 : Array elements (separated by space)
Output format :
Sorted array elements in a single line separated by space
Constraints :
0 <= N <= 10^7
Sample Input 1:
7
0 1 1 0 1 0 1
Sample Output 1:
0 0 0 1 1 1 1
Sample Input 2:
8
1 0 1 1 0 1 0 1
Sample Output 2:
0 0 0 1 1 1 1 1
/***************************************************** SOLUTION **************************************************************************/

```C++

void SortZeroesAndOne(int arr[], int n){    
     int count = 0; 
    for (int i = 0; i < n; i++) { 
        if (arr[i] == 0) 
            count++; 
    } 
    for (int i = 0; i < count; i++){
        arr[i] = 0; 
    }
    for (int i = count; i < n; i++) {
        arr[i] = 1; 
    }
}

```
