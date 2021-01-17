Strings -> 1D Character Arrays.

Ab isme for loop use krne ki zaroorat nahin hain kyuki woh thoda different behave krte hain

Agar humme character array mein apna naam print krwana hain toh 
Eg:
char b[10];
cin >> b;-> kushal In one go poora naam enter krdene ka.

Aisa upar wala krne se hota yeh hain ki yeh naam array mein save hoga and ek aur cheez hogi that end mein "\0" which is null character apend ho jaayega 
Jaise \n hota hain hain newline ke liye waise hi \0 hota hain.
Iski ASCII value hoti hain zero.
Yeh automatic add hota hain and work as a terminator which signifies string zero se chalu ho rahi hain and null pe khatam ho rahi hain and uske baad jo bhi hain are null character.

Ab ideally integer array mein agar apan 
int a[100];
cout << a; toh address print ho jayega.

But in case of string aisa nahin hoga.Jo diya hain wahi print hoga

char a[100]; //100 bytes ki memory allocate ho gayi isse
cin >>a;
cout << a;

ideally address print hona chaiye but aisa nahin hoga jo diya hain woh print hoga.

## So cin and cout dono special behave krta hain in case of Strings.

So cout kr kya raha hain -> woh address pe jata hain and string print krna shuru kr deta hain till he finds null.

* Jab bhi null read kiya tabh woh stop ho jayega.
 

---------------------------------------
Create a function to find length of a string?

In array ke case mein there was no way to figure out length of an array.Humme pass krna padta tha.In string we an take help of null character

```C++
int length(char input[]){
    int count = 0;
    for(int i=0;input[i] != '\0';i++){
        count++;
    }
    return count;
}
```
-----------------------------------------

## CHECK PALINDROME

```C++

bool checkPalindrome(char str[]){


  /* Don't write main().
   *  Don't read input, it is passed as function argument.
   *  Return output and don't print it.
   *  Taking input and printing output is handled automatically.
   */
    int count = 0;
    for(int i=0;str[i] != '\0';i++){
        count++;
    }
    int count2 = 0;
    for(int i=0,j=count-1;i<count-1,j>0;i++,j--){
        if(str[i]==str[j]){
            count2++;
        }
    }
    if(count-1==count2)
    {
        return true;
    }
    else
    {
        return false;
    }
}
```
Yeh apan ka code hain.Dekh kya code likha hain 2 for loop iski maa ka.

ABHI ASLI CODE 

```C++
bool checkPalindrome(char str[]){


  /* Don't write main().
   *  Don't read input, it is passed as function argument.
   *  Return output and don't print it.
   *  Taking input and printing output is handled automatically.
   */
    int count = 0;
    for(int i=0;str[i] != '\0';i++){
        count++;
    }
    int count2 = 0;
    for(int i=0,j=count-1;i<count-1,j>0;i++,j--){
        if(str[i]==str[j]){
            count2++;
        }
    }
    if(count-1==count2)
    {
        return true;
    }
    else
    {
        return false;
    }
}
```
-----------------------------------------

### Some more concepts

char input[4];
cin >> input;

* Abh character array ki size 4 hain uska mtlb yah nahin ki apan isme r character store kr skte hain bcoz last mein null charater ko bhi toh jagah chaiye .

* IN case of character array, jab bhi space ya tab ya /n dikhega toh woh wahi stop krdega read krna.
So agar hum "hello world" cin krege toh sirf "hello" cout hoga.

* Toh agar humme multiple words daalne hain jisme spaces ho toh toh hum cin use hi nahin kr paayege toh kya kare ?
* So we have 
### cin.getline
It takes 2 compulsory and one optional arguments i.e 3 total arguments.


```C++
#include <iostream>
using namespace std;

int main(){
    char input[100];
    // cin >> input;
    cin.getline(input,100);
    cout << input << endl;
}
```

## So cin.getLine reads till the newline.So it reads space and tabs but jaise hi newline aata hain woh stop kr deta hain reading.

Now,
char a[10];
cin.getline(a,10); -> 9 character hi read krega
cin.getline(a,4); -> 3 character hi read krega,bcoz last is null.

```C++
#include <iostream>
using namespace std;

int main(){
    char input[100];
    // cin >> input;
    cin.getline(input,4);
    cout << input << endl;
}
```

### MORE DETAILZZZ:
char a[10];
cin.geline(a,len);

len -> yeh array se zyada nahin ho skta.yaha par 10 se zyada nahin ho skta.

Ab cin.getline ka third argument hain delimiter -> yeh jab bhi aaya toh stop ho jaayega.

```C++
#include <iostream>
using namespace std;

int main(){
    char input[100];
    // cin >> input;
    cin.getline(input,4,'$');
    cout << input << endl;
}
```
Ab jab bhi $ aaya uske baad ke input ko ignore krdega.

SO NOW WE KNOW HOW TO TAKE MULTIPLE WORDS AS INPUT FROM THE USER.

----------------------------------

Program to reverse a string

```C++
#include <iostream>
using namespace std;

int main(){
    char input[100];
    // cin >> input;
    cin.getline(input,100);
    int count = 0;
    for(int i=0;input[i]!='\0';i++){
        count++;
    }
    // cout << count;
    int j = count - 1;
    for(int i=0;i<j;i++){
        int temp = input[i];
        input[i] = input[j];
        input[j] = temp;
        j--;
    }
    cout << input;

}
```
Yeh upar wala khud ka code hain see the forloop condition important hain.See also length itna hi count kiya jisse null character ko fuck off boldiya.

```C++
#include <iostream>
using namespace std;

int length(char input[]) {
	int count = 0;
	for(int i = 0; input[i] != '\0'; i++) {
		count++;
	}
	return count;
}

void reverseString(char input[]) {
	int len = length(input);
	int i = 0, j = len - 1;
	while(i < j) {
		char temp = input[i];
		input[i] = input[j];
		input[j] = temp;
		i++;
		j--;
	}
}

int main() {
	char input[100];
	//cin >> input;
	cin.getline(input, 100);
	
	reverseString(input);
	cout << input << endl;
}
```
This is real solution

-------------------------------------------------
Given an input string S that contains multiple words, you need to remove all the spaces present in the input string.
There can be multiple spaces present after any word.

Sample Input :
abc def g hi
Sample Output :
abcdefghi


APNA SOLUTION
```C++

void trimSpaces(char input[]) {
  /*  Don't write main().
   *  Don't read input, it is passed as function argument.
   *  Don't print or return the output.
   *  Change in the given input string itself.
   *  Taking input and printing output is handled automatically.
   */
    int count = 0;
    for(int i=0;input[i]!='\0';i++){
        count++;
    }
    char a ='$';
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

REAL SOLUTION
```C++
void trimSpaces(char input[]) {
    int j = 0;
    for(int i =0;input[i] !='\0';i++){
        if(input[i] != ' '){
            input[j] = input[i];
            j++;
        }
    }
    input[j] = '\0';
}
```

---------------------------------------------


## DIFFERENT IN-BUILT STRING FUNCTIONS WHICH ARE ALREADY WRITTEN TO US but first need to include header file <cstring>

* 1)Length of a string -> strlen(string_name)
```C++
#include <iostream>
using namespace std;
#include <cstring>

int main(){
    char input[100];
    cin >> input;

    int len = strlen(input);
    cout << len << endl;
}
```
--------------------------------------------------
* 2)Users se 2 strings milegi, we need to compare and check if 2 strings are equal or not by giving 0 or 1.
equal ->0 

strcmp(input1,input2)

```C++
#include <iostream>
using namespace std;
#include <cstring>
int main(){
    char input[100];
    cin >> input1;
    cin >> input2

    if(strcmp(input1,input2)==0){
        cout << "true" << endl;
    }
    else{
        cout << "false" << endl;
    }
}
```
-------------

* 3)COPY STRINGS:Copy contents from string array 1 to string array2.
strcpy(destination_string,source_string).

Dhyan se dekhe toh input 2 ka content 1 mein copy ho gaya.Now we can do one more thing
strcpy(input1,"hello");

-----------------------------------------------

Ab strcpy poori ki poori string ko ek string array se dusre string array mein copy krdeta tha.But let's say I have two strings input2 string array ke sirf 3 string input1 mein copy krne hain i.e "hello" mein se sirf "hel" copy krna hain.

## strncpy(destination_string,source_string,n)
Toh string array1 jo eg: abcde hain
woh "helde" ho jayega.

-----------------------------------------------

A small examples get all the prefixes
Input: abcd 
Output: 
a
ab
abc
abcd

```C++
#include <iostream>
using namespace std;

void printAllPrefixes(char input[]){
    for(int i=0;input[i]!='\0';i++){
        for(int j=0;j<=i;j++){
            cout <<input[j];
        }
        cout << endl;
    }

}

int main() {
    char input[1000];
    cin >> input;
    printAllPrefixes(input);
}
```

--------------------------------------------
DIFFICULT PROBLEM HAIN BRO KRKE DEKH GAAND FHAT JAAYEGI
Given a String S of length n, print all its substrings.
Substring of a String S is a part of S (of any length from 1 to n), which contains all consecutive characters from S.

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
# 2D ARRAYS

Declaration of 2D array 

int b[5][5];
now declare m and n:let's say m=3 and n=2
so 3 rows and 2 column ki jagah fix ho jaaayegi.

Ab compiler isse 1D array ki tarah hi vizualize krta hain 5*5=25 i.e [25] size ka 1D array would get saved. from 0->24 index.

So :
int b[R][C];
m=3,n=2

a[i][j] -> c*i+j to find location(exact index) -> 

c -> total number of columns that are present in every row
i -> upar waali row mein kitne cell ko skip krna hain
j -> current cellmein kitne cell ko skio krna hain 

-----------------------------------------------------------

## FUNCTION FOR PRINTING 2D ARRAY

We just want that ki humme input milega and humme ussse print krna hain.Toh return type toh void hoga.

```C++
#include <iostream>
using namespace std;

void printArray(int a[][100], int m, int n) {   // 2)
	for(int i = 0; i < m; i++) {
		for(int j = 0;  j < n; j++) {
			cout << a[i][j] << " ";
		}
		cout << endl;	
	}
}

int main(){
    int a[100][100];  // 1)
    int m,n;
    cin >> m>>n;

	// Taking input
	for(int i = 0; i < m; i++) {
		for(int j = 0; j < n; j++) {
			cin>> a[i][j];
		}
	}    
    printArray(a,m,n);
}

```

Yeh dono hi number exactly same hone chaiye.

--------------------------------------------------

AB AGAR HUMME INPUT DENA HAIN TOH :i.e declaration ke time pe hi initialize kaise kr skte hain.

AB HUM IN NORMAL ARRAY CREATE KRNA HAIN TOH
int a[] = {1,2,3} -> toh normal array 3 size ka create ho jata tha.

IN 2D ARRAYS
int b[][] = {{1,2},{3,4},{5,6}} for every row 

1 2
3 4
5 6

aisa print ho jaayega but for this hum dono arrays([][]) ko khali nahin chod skte hain. Column ko specify krna hi hoga.We know column 2 hain toh humme 2 specify krna hi hoga.

i.e. int b[][2] = {{1,2},{3,4},{5,6}} //Yeh 2 is must for us

----------------------------------------------
Ab agar humne declare bada array kiya and values kam daali toh baaki jagah zero aajayega.

Eg in 1 D Array

```C++
int main(){
    int k[10] = {1,2,3};
    for(int i=0;i<10;i++){
        cout << k[i];
    }
}
```
```T
kushal@kushal:~/Desktop/C++/test$ g++ helloworld.cpp -o hello
kushal@kushal:~/Desktop/C++/test$ ./hello
1230000000
```
----------------------------------------------------
Similarly in 2 D array mein bhi same hoga

int b[][5] = {{1,2},{3,4}};

1 2 0 0 0
3 4 0 0 0

--------------------------------------
int b[5][5] = {{1,2},{3,4}};

Ab no of rows bhi 5 hojayege bcoz of 5 likha hua hain

1 2 0 0 0
3 4 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0

------------------------------------------

Wave Print
Send Feedback
For a given two-dimensional integer array/list of size (N x M), print the array/list in a sine wave order, i.e, print the first column top to bottom, next column bottom to top and so on.
Input format :
The first line contains an Integer 't' which denotes the number of test cases or queries to be run. Then the test cases follow.

First line of each test case or query contains two integer values, 'N' and 'M', separated by a single space. They represent the 'rows' and 'columns' respectively, for the two-dimensional array/list.

Second line onwards, the next 'N' lines or rows represent the ith row values.

Each of the ith row constitutes 'M' column values separated by a single space.
Output format :
For each test case, print the elements of the two-dimensional array/list in the sine wave order in a single line, separated by a single space.

Output for every test case will be printed in a seperate line.
Constraints :
1 <= t <= 10^2
0 <= N <= 10^3
0 <= M <= 10^3
Time Limit: 1sec
Sample Input 1:
1
3 4 
1  2  3  4 
5  6  7  8 
9 10 11 12
Sample Output 1:
1 5 9 10 6 2 3 7 11 12 8 4
Sample Input 2:
2
5 3 
1 2 3 
4 5 6 
7 8 9 
10 11 12 
13 14 15
3 3
10 20 30 
40 50 60
70 80 90
Sample Output 2:
1 4 7 10 13 14 11 8 5 2 3 6 9 12 15 
10 40 70 80 50 20 30 60 90 

```C++
void wavePrint(int **input, int nRows, int mCols)
{
    for(int j=0;j<mCols;j++)
		if(j%2==0)
        {
            for(int i=0;i<nRows;i++)
            {
                cout <<input[i][j]<<" ";
            }
        }
		else if(j%2==1)
        {
            for(int i=nRows-1;i>=0;i--)
            {
                cout <<input[i][j]<<" ";
            }
        }
}

```




 int arrayRotateCheck(int *input, int size)
{
    //Write your code here
    for(int i = 0;i<size;i++){
        if(input[i]>input[i+1]){
            return i+1;
        }
    }
    return 0;
}