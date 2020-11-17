Find Unique
Sample Input 1:
1
7
2 3 1 6 3 6 2
Sample Output 1:
1

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
Find Duplicate
Sample Input 1:
1
9
0 7 2 5 4 7 1 3 6
Sample Output 1:
7

```C++
int duplicateNumber(int arr[], int size){
    int n;
    n = size;
    cin >> n;
    for(int i=0;i<=(n-1);i++){
        cin >> arr[i];
    }
    for(int j=0;j <=( n-1 ); j++) {
        int unique = arr[j];
        for(int i=0;i<=(n-1);i++){
            if(i != j){
                if(arr[j] == arr[i]){
                    return arr[i];
                }            
            }
        }        
    }   
}
```
Array Intersection

Sample Input 1 :
2
6
2 6 8 5 4 3
4
2 3 4 7 
2
10 10
1
10
Sample Output 1 :
2 4 3
10

```C++
#include <climits>

void intersection(int *input1, int *input2, int size1, int size2){
    int n1 = size1;
    int n2 = size2;

    int duplicate;
    for(int i=0;i<=(n1-1);i++){
        duplicate = input1[i];
        for(int j=0;j<=(n2-1);j++){
            if(duplicate == input2[j]){
                cout << duplicate <<" " ;
                input2[j] = INT_MIN; // match mila toh repeat matc na mile toh number hi change kr diya array ka
                break;
            }
        }
    }
}
```
Pair Sum
Send Feedback
You have been given an integer array/list(ARR) and a number X. Find and return the total number of pairs in the array/list which sum to X.

Sample Input 1:
1
9
1 3 6 2 5 4 3 2 4
7
Sample Output 1:
7


```C++
int pairSum(int *input, int size, int x){
    int count = 0;
    int n = size;
    for(int i=0;i<=(n-1);i++){
        for(int j=i+1;j<=(n-1);j++){
                if(input[i]+input[j]==x){
                    count++;
                }
        }
    } 
    return count;   
}
```
TRIPLET SUM
Sample Input 1:
1
7
1 2 3 4 5 6 7 
12
Sample Output 1:
5

```C++
int tripletSum(int *input, int size, int x)
    
{
    int count = 0;
    int n = size;
	for(int i=0;i<=(n-1);i++){
    int pair1 = input[i];
        for(int j=i+1;j<=(n-1);j++){
            int pair2 = input[j];
            for(int k=j+1;k<=(n-1);k++){
                int pair3 = input[k];
                if(x == input[i]+input[j]+input[k]){
                    count++;
                }
            }
        }
    }
    return count;
}
```

Sort zereos and Ones
```C++
void sortZeroesAndOne(int *input, int size){
    int n = size;
    int j =0;
    int arr2[100];
    for(int i=0;i<n;i++){
        if(input[i]==0){
            input[j]=0;
            j++;
        }
    }
    for(int i=j;i<size;i++){
        input[i] = 1;
    }      
}
```
------
SWAP ALTERNATE
Sample Input 1:
1
6
9 3 6 12 4 32
Sample Output 1 :
3 9 12 6 32 4

```C++
void swapAlternate(int *arr, int size)
{
    int temp = 0;
    for(int i=0;i<size-1;i+=2){  //khud soch bhosadike
        temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;
    }
}
```


Rotate array
Sample Input 1:
1
7
1 2 3 4 5 6 7
2
Sample Output 1:
3 4 5 6 7 1 2

```C++
void leftrotate(int arr[],int n){
    int tmp = arr[0];
    int i;
    for(i=0;i<n-1;i++){
        arr[i]=arr[i+1];
    }
    arr[i]=tmp;
}
void rotate(int arr[], int d, int size) {
    for(int i=0;i<d;i++){
        leftrotate(arr,size);
    }
```

SECOND LARGEST IN AN ARRAY
```C++
#include<limits.h>
using namespace std;
int FindSecondLargest(int *input,int n){
    if(n<=0)
        return INT_MIN;
    int maxx=input[0];
    int secmax=INT_MIN;
    for(int i=1;i<n;i++) {
        if(input[i]>maxx){
            secmax=maxx;
            maxx=input[i];
        }
        else if(input[i]>secmax && input[i] != maxx)
            secmax=input[i];
    }
    return secmax;
}
```

Sort 0 1 2

Sample Input 1:
1
7
0 1 2 0 2 0 1
Sample Output 1:
0 0 0 1 1 2 2 

```C++
#include<bits/stdc++.h>
using namespace std;
void sort012(int *A, int n) {
    int k = n - 1; 
    int i = 0;
    for (; i < n; ++i) {
        if (A[i] != 0) {
            break;
        }
    }
    int j = i;
    for (; i <= k; ++i) {
        if (A[i] == 0) {
            swap(A[j++], A[i]); 
        }
        else if (A[i] == 2) {
            swap(A[i--], A[k--]); 
        }
    }
}
```

SUM OF TWO ARRAYS : SEE THE LOGIC YOU DUMP
```C++
void sumOfTwoArrays(int input1[], int size1, int input2[], int size2, int output[]){
    /* Don't write main().
     * Don't read input, it is passed as function argument.
     * No need to print or return the output. Just fill the output in given output array.
     * Taking input and printing output is handled automatically.
     */
    int i = size1-1, j = size2-1;
    int ans = 0, q=0, r=0, k;
    if(size1 <= size2){
        int size3 = size2;
        k = size3-1;
    }
    else{
        int size3 = size1+1;
        k = size3-1;
    }
    
    if(size1 > size2 ){
        while(i >= 0 && j >= 0){
            ans = q + input1[i]+input2[j];
            r = ans%10;
            output[k] = r;
            q = ans/10;
            i--;
            j--;    
            k--;
        }
        while(i >= 0){
            output[k]==input1[i];
            i--;
            k--;
        }
    output[0] = q;
    }
    else if(size1 == size2){
       while(i >= 0 && j >= 0){
            ans = q + input1[i]+input2[j];
        r = ans%10;
        output[k] = r;
        q = ans/10;
           i--;
        j--;
        k--;
    }
    output[0] = q; 
    }
    else{
        while(i>=0){
            output[k]==input1[i];
            i--;
            k--;
        }
    }
}
```
CHARACTER ARRAY

CHECK PALINDROME
```C++
#include<string.h>
bool checkPalindrome(char str[]){

    int i=0;
    int j = strlen(str) - 1;
    while(j > i){
        if(str[i] != str[j]){
            return false;
        }   
        i++;
        j--;
    }    
    return true;
}
```
TRIM SPACES
Sample Input :
abc def g hi
Sample Output :
abcdefghi

MY solution: bekaar solution
```C++
void trimSpaces(char input[]) {
    int count = 0;
    for(int i=0;input[i]!='\0';i++){
        count++;
    }
    for(int i=0;input[i]!='\0';i++){
        if(input[i]==' '){
            
            for(int index =i;index<count;index++){
                char abc =input[index+1];
                input[index] = abc;
            }
        }
    }
}
```
```C++
#include<string.h>
void trimSpaces(char input[]) {

    int count = 0;
    int len = strlen(input);
    for(int i = 0; input[i]; i++){
        if(input[i] != ' '){
            input[count]=input[i];
            count++;
        }
    }
    input[count] = '\0';
}
```

REVERSE COMPLETE STRING
```C++
void reverseCompleteString(char input[]) { 
    int i = 0, 
    j = length(input) - 1; 
    while(i < j) {
        char temp = input[i]; 
        input[i] = input[j]; 
        input[j] = temp;
        i++; 
        j--; 
    } 
}
```

Print All Substrings
Sample Input 1 :
xyz
Sample Output 1 :
x
xy
xyz
y
yz
z

```C++
void printSubstrings(char input[]){    
    int count = 0;
    for(int i=0;input[i]!='\0';i++){
        count++;
    }    
    for(int m = 0;m<count;m++){
        for(int i=m;input[i]!='\0';i++){
            for(int j=m;j<=i;j++){
                cout <<input[j];
            }
            cout << endl;
        }    
    }   
} 
```