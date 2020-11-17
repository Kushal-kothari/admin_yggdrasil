# function are very important topic

Eg: we need to do nCr.Example 5 mein se 2 cheez select krne ke kitne tarike hain
```C++
#include<iostream>
using namepace std;
int main(){
        int fact_n = 1;
        int i = 1;
        while (i <= n) {
                fact_n = fact_n * i;
                i++;
        }

        int fact_r = 1;
        i = 1;
        while (i <= r) {
                fact_r = fact_r * i;
                i++;
        }

        int fact_n_r = 1;
        i = 1;
        while (i <= n - r) {
                fact_n_r = fact_n_r * i;
                i++;
        }
        cout << fact_n/(fact_r * fact_n_r) << endl;
}
```
Abhi if we see humne same code ko 3 baar copy kiya hain.Code copy krne mein kya problem hain ! .Code copy krne mein bohot saari problem hain.Sabse bada problem yeh hain ki code bulky hota jaa raha hain for no reason.Second problem is jo initial code mein chota sa bhi bug tha woh repeat hota jaa raha hain.
JAb koi iss code ko read kr raha hain usse 3 baar ek hi cheez repeat krni padegi which affect readability. 

Humme kuch aisa code chaiye jo sirf factorial laake de hum fhir usse value dege woh answer leke aayega.

### rescue ke liye we have function.

## WHAT IS FUNCTION ->a block of code which tells you mujhe input kya chaiye and then woh output laake dega.Ab jab jab iss function ko use krna hain iska naam lo bas and input dedo woh output laake dega.

* jab bhi function ko likhte hain toh int main() ke bahar likhte hain.
* function ko naam dena zarori hain 
* function ko input dena hain woh bracket mein jaayega 
* function ka output kya rahega (Eg: int/char/bool etc woh bahar dena padega eg  int name(in1,in2) .
* return function ke output ko return krta hain.

```C++
int factorial(int n){
        int ans = 1;
        int i =1;
        while(i<=n){
                ans=ans*i;
                i++;
        }
        return ans;
}

```
Ab humein apne upar waale function ko use krna hain.So kisi bhi function ko call krne ke liye uska naam likhna padta hain and usko integer chaiye tha toh humme usse integer dena padega.Eg agar humne factorial(5) diya toh woh humme lakar dega uska answer jisse hum store kr skte hain apne lets say ek integer mein.Integerr kyu?bcoz woh integer hain.

```C++
int output = factorial(5);
cout << output << endl;
```

So coming to the actual problem

```C++
#include<iostream>
using namespace std;
int main(){
        int fact_n = factorial(n);
        int fact_r = factorial(r);
        int fact_n_r = factorial(n-r);
        int ans = fact_n/(fact_r*fact_n_r);
        cout << ans << endl;        
}


int factorial(int n){
        int ans = 1;
        int i =1;
        while(i<=n){
                ans=ans*i;
                i++;
        }
        return ans;
}
```
The code is much better.Code ko baarbar use kr paa rahe hain.Thats exactly what happened when we were using cin.get().
Similarly cin, kisine likha tha apan reuse kr rahe hain.

# POWER OF RETURN

## function kya value return krega uske hisaab se uska return type hoga
## jabh bhi return pe pohocha code toh woh function stop krdega and jo value return krni hain woh krdega. 

```C++
#include <iostream>
using namespace std;

bool isPrime(int n) {
        int d = 2;
        while (d < n) {
                if (n % d == 0) {
                        return false;
                }
                d++;
        }
        return true;
}

int main() {
        bool ans = isPrime(31);
        cout << ans << endl;
        ans = isPrime(85);
        cout << ans << endl;
}

```

NOW THERE IS GOING TO BE TIMES JABH HUMME KUCH RETURN NAHIN CHAIYE LETS SAY 1 to N TOH WOH TOH HUMME PRINT CHAIYE RETURN THODI KUCH CHAIYE TABH HUMM **void** use krege
```C++
#include <iostream>
using namespace std;

void print_1_to_n(int n) {
        for(int i = 1; i<=n; i++) {
                cout << i << endl;
        }
}

int main() {
        print_1_to_n(10);
}
```


## ab void ki main baat isko store nahin kr skte error aayega bcoz function kuch return nahin krta kuch bhi toh store kya krege
so int a = print_1_to_n(10); will give an error.
Humme sirf call krdena hain.

## DISCUSSION ABOUT YEH POORI CHEEZ CHALTI KAISE HAIN

lets take one more code where we need to print all prime no's upto given n.

```C++
#include <iostream>
using namespace std;

bool isPrime(int n) {
        int d = 2;
        while (d < n) {
                if (n % d == 0) {
                        return false;
                }
                d++;
        }
        return true;
}

int main() {
        int n;
        cin >> n;
        for (int x = 2; x <= n; x++) {
                if (isPrime(x)) {
                        cout << x << endl;
                }
        }
}
```

Remember main humara start block hota hain.Waha se hi sabh start and end hota hain.

# VERY IMPORTANT : CALL STACK


```C++
#include <iostream>
using namespace std;

void B() {
        cout << 5 << endl;
}

void A(int a) {
        cout << 1 << endl;
        B();
        cout << 2 << endl;
}

int main() {
        int n = 10;
        cout << 3 << endl;
        A(n);
        cout << n << endl;
        cout << 4 << endl;
}
```
## Ab when we trace this we rlz stack -> (  main ->(A) -> (B) )
## main sabse pehle andar gaya sabse last mein bahar aaayega and B sabse last toh sabse pehle khatam hoga.

------------------------------------------------------------

## SCOPE OF VARIABLES wrt FUNCTIONS

function ka bracket jaise khatam hota hain variable ka scope bhi khatam hota hain.

## IMPORTANT CONCEPT : PASS BY VALUE

```C++
#include <iostream>
using namespace std;

void increment(int a) {
	a = a + 1;
}

int main() {
	int a = 10;
	increment(a);
	cout << a << endl;
}
```

cout mein 10 hi print hoga.Bcoz pehle main stack mein gaya phir uske upar increment function aaya uske liye alag partition bana memory ka ab increment ka jo bhi tha udhar hi hua.usme main ke stack mein koi changes nahin hue therefore a==10 hi rahega.





