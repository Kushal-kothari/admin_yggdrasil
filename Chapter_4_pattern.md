i |  ,,  j ->
for printing
# PATTERN

How to print patterns?logic build krna aasan hojayega.

PATTERN AAYA TOH USKE BAARE MEIN SOCHNA KAISE HAIN.WHAT ARE THE STEPS

* 1>NUMBER OF ROWS JO NORMALLY N USER SE LETE HAIN
* 2> i'th ROW MEIN KYA HO RAHA HAIN USKE HISAAB SE LOGIC.i'th row agar print krna aagaya toh i ko 1 rakh dege phir i se N yak print kr lege aur print hota jaayega. 
* 3>What to print? star or number etc.It mainly depends upon i-> row no. j -> column no  and it can depend upon N.

Example:
****
****
****
****

1> N rows 2>each row is having equal no of columns i.e 4 3>print '*'

Solution:
```C++
#include<iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int i = 1;
    while(i<=n){
        int j = 1;
        while(j<=n){
            cout << '*';
            j++;
        }
        cout <<endl;
        i++;
    }	
}
```
-----------------------------------------------
we are going to print 3 different patterns.

1111    1234    4321
2222    1234    4321
3333    1234    4321
4444    1234    4321

there is common in all of them.sab mein rows N hain and all of them have ith rows have 4 colums.Print ? krna hain.

## PRINT KYA KRNA HAIN IS GENERALLY A FUNCTION OF N,i and j.
## N -> no of rows. i -> row number. j -> column number

in first case:1st row mein all 1s .2nd row mein all 2's etc that means humein i(jo row hain woh print krdege) print krna hain.

in second case:humein j print krna hain

```C++
#include<iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int i = 1;
    while(i<=n){
        int j = 1;
        while(j<=n){
            cout << i;(for second pattern idhar j daalde.)
            j++;
        }
        cout <<endl;
        i++;
    }	
}
```

4321
4321
4321
4321

Abhi 3rd case dekhe toh pata chala ki har ek row same hain.Toh i pe toh dependency nahin hogi. 
N pe dependency hogi bcoz 3 ka agr pattern hota toh aisa hota
321
321
321

now on j?column? ->haa bcoz change ho raha hain.
jab j increase ho raha hain toh column ka test decrease ho raha hain.So lets try (N-j) but isse 3210 hoga so try (N-j+1)

Solution 
```C++
#include<iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int i = 1;
    while(i<=n){
        int j = 1;
        while(j<=n){
            cout << n+1-j;
            j++;
        }
        cout <<endl;
        i++;
    }	
}
```

## TRIANGULAR PATTERNS

1       1       1
12      23      23
123     345     456
1234    4567    78910

Step 1: N rows(N=4)
Step 2: ith row mein i columns hain 
Step 3: print toh j hi krna hain

```C++
#include<iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int i = 1;
    while(i<=n){
        int j = 1;
        while(j<=i){
            cout << j);
            j++;
        }
        cout <<endl;
        i++;
    }	
}
```
For pattern 2:
No of rows toh N hain
ith row has i columns .So 2 cheezein toh ame hain.
Difference yeh hain ki saare column mein kuch alag alag print ho raha hain.i aur j toh nahin hain.Kuch comination ka formula nikalna padega 
i'th row starts with i and bada bada ke i numbers print krdo



```C++
#include<iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int i = 1;
    while(i<=n){
        int j = 1;
        while(j<=i){
            cout << i+j-1;
            j++;
        }
        cout <<endl;
        i++;
    }	
}
```

For pattern 3;
```C++
#include<iostream>
using namespace std;

int main() {
    int n;
    cin >> n;
    int i = 1;
    int k = 1;
    while(i<=n){
        int j = 1;        
        while(j<=i){
            cout << k;
            j++;
            k++;          
        }
        cout <<endl;
        i++;
    }	
}
```
## CHARACTER PATTERN
ABCD
ABCD
ABCD
ABCD

```C++
#include<iostream>
using namespace std;
int main(){
    int i,j,n;
    cin >> n;
    i = 1;
    while(i<=n){
        j = 1;
        while(j<=n){
            cout <<char('A' +j-1); //char ch = 'A'+j-1;cout << ch;
            j = j+1;
        }
        cout << endl;
        i=i+1;
    }
}
```
ABCD
BCDE
CDEF
DEFG


## CHARACTER PATTERNS

ABCD
ABCD
ABCD
ABCD

no of rows = n
ith rows mein N columns
what to print? ->charcter ,i pe independent hain bcoz har ek row mein same thing is getting printed.j pe depend kr rha hain.jaise j badh raha hainwaise character badh raha hain

1st column ->'A' 
2nd column ->'A' + 1
3rd column ->'A' + 2
4th column ->'A' + 3


Eg:
A
BC
CDE
DEFG

```C++
#include<iostream>
using namespace std;

int main() {
    int n,k=1;

    cin >> n;
    int i = 1;
    while(i<=n){
        int j = 1;
        while(j<=i){
            cout << char('A'+i+j-2);
            j++;
        }
        cout <<endl;
        i++;
    }	
}
```

E
DE
CDE
BCDE
ABCDE

```C++
#include<iostream>
using namespace std;

int main() {
    int n,k=1;

    cin >> n;
    int i = 1;
    while(i<=n){
        int j = 1;
        while(j<=i){
            cout << char(('A'+n-i+j-1));
            j++;
        }
        cout <<endl;
        i++;
    }	
}
```

## MIRROR IMAGE OF A PATTERN
*       *
**     **
***   ***  
**** ****

2nd pattern consist of some space and some stars.abhi apan yeh nahin bol skte hain ki ek loop hoga usme 10 column print krne hain.loop lagaya hogaya.bcoz this row consist of some spces and some stars
Therefore we will require a loop for spaces and another loop for stars.

Now to figure out how many spaces and how many stars !
How many star is pretty staightforward !
1sr row has one star.2nd row has 2 star 3rd row has 3 star and so on.So i'th row  will have i stars.

1st row has 3 spaces.2nd row has 2 spaces.3rd row has 1 spaces So ith row will have (n-i) spaces.

SO in a pattern you will ned to break into multiple pieces.Abhi 2pieces mein kiya hain.

Toh 3 while loop.1) N ka .2)spaces ke liye 3)stars ke liye


# **Look at the code and the logic.its the best example for pattern**

```C++
#include<iostream>
using namespace std;

int main(){
    int i = 1,n;
    cin >> n;
    while(i<=n){
        int spaces = 1;
        while(spaces <= n-i){
            cout << ' ';
            spaces = spaces + 1;
        }
        int stars = 1;
        while(stars <= i){
            cout << '*';
            stars = stars + 1;
        }
    cout << endl;
    i++;	
}
}
```
    1
   23
  345
 4567

we again need 3 while loops.1)for N 2)for spaces 3)for printing no's

1) toh ho gaya
2)1st row mein 3 spaces hain.2nd row mein 2 spaces hain .3rd row mein 1 spaces hain .So ith row mein (N-i) spaces hain.
3) abhi column mein i se chalu ho raha hain see.

```C++
#include<iostream>
using namespace std;

int main(){
    int i = 1,n;
    cin >> n;
    
    while(i<=n){
        int stars = 1;
        int spaces = 1;
        while(spaces <= n-i){
            cout << ' ';
            spaces = spaces + 1;
        }
        
        while(stars <= i){
            cout << i+stars-1;
            stars = stars + 1;
        }
    cout << endl;
    i++;	
}
}
```


   1
  12
 123
1234

```C++
#include<iostream>
using namespace std;

int main(){
    int i = 1,n;
    cin >> n;
    
    while(i<=n){
        int stars = 1;
        int spaces = 1;
        while(spaces <= n-i){
            cout << ' ';
            spaces = spaces + 1;
        }
        
        while(stars <= i){
            cout << stars;
            stars = stars + 1;
        }
    cout << endl;
    i++;	
}
}
```
## INVERTED PATTERNS


****
***
**
*

3 questions ke answer:
1>N 2> row 4 hain 3>column is decreasing as i is increasing
SO each row will have (n-i+1) column

```C++
#include<iostream>
using namespace std;

int main(){
    int i = 1,n;
    cin >> n;
    while(i<=n){
        int j = 1;
        while(j<=n-i+1){
            cout << '*';
            j++;
        }

        cout << endl;
        i++;
    }
}
```
So n rows hain har row mein n-i+1 column hain aur star print krna hain.


4444
333
22
1

```C++
#include<iostream>
using namespace std;

int main(){
    int i = 1,n;

    cin >> n;
    int k = n;
    while(i<=n){
        int j = 1;
   
        while(j<=n-i+1){
            
            cout << k;
            j++;
            
        }
        k--;

        cout << endl;
        i++;
    }
}
```
## ISOSCELES TRIANGLE

        1
       121
      12321
     1234321 

Iske 3 part hain har row mein pehle SPACES AAYE NUMBER INCREASE KIYE FHIR NUMBER DECREASE HUYE.

So pehle apan code krege aadha phir decreasing ka dekhlege
    1
   12
  123
 1234 

```C++
#include<iostream>
using namespace std;

int main(){
    int i = 1,n;

    cin >> n;
    while(i<=n){
        int j = 1;
        while(j<n-i+1){
            cout<<" ";
            j++;
        }
        j = 1;
        while(j<=i){
            cout <<j;
            j++;
        }

        
        cout << endl;
        i++;
}}
```

Abhi decreasing wala sequence lagana hain
decreasing mein humein (j <- i-1)
bcoz 3rd row  mein 2 se start ho rahi hain.4th row mein 3 se start ho rahi hain

(i-1 -> j -> 1) aisa humara while loop jaayega in decreasing pattern.
i-1 se shuru krege aur reduce kr krke 1 tak leke jaayege.Jaise hi zero ho ga rukh jaayege.

For eg:1st row mein j start hoga 1-1=0 hoga
4th row mein 4-1=3 so 321

```C++
#include<iostream>
using namespace std;

int main(){
    int i = 1,n;

    cin >> n;
    while(i<=n){
        int j = 1;
        while(j<n-i+1){
            cout<<" ";
            j++;
        }
        j = 1;
        while(j<=i){
            cout <<j;
            j++;
        }
        j = i-1;
        while(j>=1){
            cout <<j;
            j--;
        }

        cout << endl;
        i++;
}}
```

### MOST DIFFICULT PATTERN

   1
  232
 34543
4567654


```C++
#include<iostream>
using namespace std;
// currRow = i
int main(){
    int i = 1,n;
    cin >> n;
   
    while(i<=n){
        
        int spaces = 1;
        while(spaces <= n-i){
            cout << ' ';
            spaces = spaces + 1;
        }
        int num = 1;
        while(num <= i){
            cout << i+num-1;
            num = num + 1;
        }
        int val = 2*(i-1);
        while(val>=i){
            cout << val;
            val--;
        }
    cout << endl;
    i++;	
}
}
```

## VERY IMPORTANT

   *
  ***
 *****
*******
 *****
  ***
   *

Pehle row aur column banaya toh malum pada N = 7 hain
pehle spaces hain phir * hain and phir spaces hain.last ke spaces pe dhyan nahin dena hain.It can be dealt automatically.

Row no      no of spaces        no of stars
1           3                   1
2           2                   3
3           1                   5
4           0                   7

5           1                   5
6           2                   3
7           3                   1

pattern 2 mein divide hoga .
for any odd no eg:7 toh 4 and 3
eg:9 toh 5 and 4, 11 toh 6 and 5

so n1 = (n+1)/2 , n2 = N/2 or (n1-1)

n1 represent rows in first half .n2 represent rows in second half.


```C++
#include<iostream>
using namespace std;
int main(){
    int i = 1,n,n1,n2;
    cin >> n;
    n1=(n+1)/2;
    n2=n/2;
    while(i<=n1){
        
        int spaces = 1;
        while(spaces <= n1-i){
            cout << ' ';
            spaces = spaces + 1;
        }
        int num = 1;
        while(num <= i){
            cout << '*';
            num = num + 1;
        }
        int num2 = 1;
        while(num2<=i-1){
            cout << '*';
            num2=num2+1;
        }	

    cout << endl;
    i++;
    }
    int j=1;
    while(j<=n2){
        int l =1;
        while(l<=j){
            cout <<' ';
            l++;
        }
        int y = 1;
        while(y<=n2-j+1){
            cout << '*';
            y++;
        }
        int g = 1;
        while(g<=n2-j){
            cout <<'*';
            g++;
        }

        cout << endl;
        j++;
    }	
}
```
bro this question was solved by you.draw the rectangle of rows and columns.

Eg:pehle khaali space chaiye phir stars chaiye.
toh pehle chess type rectangle bana phir usse "n" ki value milegi
Ab likh i=1 mein kitni khaali space hain .Similarly for i = 2 toh usse i ka logic mil jayega.Fhir stars and so on.

watch star pattern.