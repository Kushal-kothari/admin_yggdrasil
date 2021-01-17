# OPERATORS AND FOR LOOP

We previously have studied about operators.which were Relational Operators.We learned arithmetic/logical and relational operators.We left one operators which were **Bitwise Operators**. 

Eg: Abhi apan 2+3 krte hain toh answer aata hain 5.Compiler isse binary mein convert krta hain 1010010 + 1001011 and phir addition krke apne ko result deta hain.

But now we want to work on BIT LEVEL

* 1) & [Bitwise AND] (single & not double && )
Eg: 2 & 3 ka bitwise 1 hoga
2 -> 0010 & 3 -> 0011 
ab 0&1 toh 0 and 1 & 1 toh 1 
2 & 4 ka answer 0 hoga

* 2) | [SINGLE PIPE WHICH IS BITWISE OR]
eg : 2 | 4 -> 6 is the answer.

* 3) NOT Gate -> " ~ " zero ko one krega and vice versa

* 4)EX OR -> which is Exclusive OR dono same yaa different hue toh bilkul nahin chalega i.e 0 dono different hue toh 1.that is why it is known as exclusive OR. We use -> " ^ "

### There are two more operators Left Shift and Right shift.

Eg :2 << 1
toh abhi 0000....10 yrhshift hoha left by 1 toh aage ka number jaayega aur piche zero lagg jaayega
0000....100 which is 4

15 << 2 -> answer is 30.

THIS IS KNOWN AS LEFT SHIFT,BCOZ HUMNE LEFT MEIN CHEEZO KO SHIFT KR DIYA.

GENERALLY LEFT SHIFT 1 SE KIYA TOH MULTIPLY BY 2 HOTA HAIN.
LEFT SHIFT 2 SE KIYA TOH MULTIPLY BY 4 HOTA HAIN ETC

normally saare number *2,*4 se ho jaate hain bas number agar bada ho ekdum toh dhyan dena padta hain.

sO BITWISE LEFT BOLTA HAIN LEFT MEIN SHIFT KARO END MEIN ZERO LAGA DO.

--------------------------------------------------

Similarly RIGHT SHIFT
15 >> 1
Yeh 2 se divide krta hain

logic last no ghir jaayega and sabse aage 0 aajayega.

```C++
#include <iostream>
using namespace std;

int main() {
	int ror = 15 | 30;
	int rand = 15 & 30;
	int rnot = ~15;
	int rxor = 15 ^ 30;
	int rls = 15 << 2;
	int rrs = 15 >> 2;

	cout << ror << endl;
	cout << rand << endl;
	cout << rnot << endl;
	cout << rxor << endl;
	cout << rls << endl;
	cout << rrs << endl;
}

```
## FEW OPERATORS WHICH ARE NOT NECESSARY BUT GREAT SHORTCUTS

* 1>Instead of a=a+1 use -> a++ similarly a--;
 a++ isko kehte hain post increment
 ++a isko kehte hain pre increment(pehle increment hoga phir result milega).

a=a+3 -> ko a+=3 likh do which means a ke andar 3 add krdo.
Similarly a-=3 ,a*=3-> a ko muliply kro a*3 se

### NOW THERE IS ALSO PRECENDENCY AND ASSOCIATIVITY OF OPERATORS BUT WE TRY TO USE EVERYTHING IN BRACKET MAIN CALCULATION FOR READABILITY STILL GO TO THE CHART FOR ORDERING

## FOR LOOP

generally jo humara while loop hota tha woh kuch aisa hota tha, 1 to N numbers print krne hain toh we have i = 0  while likhe ge kuch condition hogi.At the end we were incrementing to move toterminate the while loop.

FOR USING FOR LOOP we can write teeno condition ek saath.

## for(int i = 0;i<=N;i++){
##	cout << i << endl;
## }

## THEREFORE for(initialixation,condition,change){
##	
## }

check whether number is prime or not

```C++
#include <iostream>
using namespace std;
int main(){
   int n;
   cin >> n;
   bool divided = false;
   for(int i =2;i<=n-1;i++){
      if (n%i == 0){
         divided = true;
      }
      }
   if (divided == true) {
      cout << "not prime" << endl;
   }else{
         cout << " a prime";
   }
} 
```
## inside information about for loop
1)multiple initialization,(int i =0,int j=0)
2)condition bhi multile hoti hain by using conditional operators like &&,|| (AND/OR) etc
3)increment,decrement multiple times aur ek saath bhi kr skte hain eg: i++,j-- etc

# BREAK AND CONTINUE KEYWORD

CONDITION SE PEHLE AGAR BREAK KRNA HAIN IF OUR ONDITION SATISFIES TOH WE USE "BREAK" for FOR AND WHILE LOOP.

Eg : Lets say we want to check if 21 is prime or not.So we checked 2 .then 3 it got divided but aage bhi apan check krte hain till (n-1) which is not at all required once the condition satisfies.So we use break.

```C++
#include <iostream>
using namespace std;

int main() {
        int n;
        cin >> n;
        bool divided = false;
        for (int d = 2; d < n; d++) {
                if (n % d == 0) {
                        divided = true;
                        break;//LOOK HERE
                }
        }
        if (divided) {
                cout << "Not Prime" << endl;
        } else {
                cout << "Prime" << endl;
        }
}
```
JAISI HI HUMARA CONDITION TRUE HOGA HUM LOOP SE NIKAL JAAYEGE.
## SO BREAK KYA KREGA JO BHI FOR YAA WHILE LOOP HOTA HAIN WOH USKO BREAK KRKE NICHE AAJAYEGA.

SO IN SHORT BREAK LOOP KO BREAK KR DETA HAIN AND LOOP SE BAHAR AAJATA HAIN.

## CONTINUE
kisi cheez ko skip krna hain.lets say 1 to 10 mein 7 ko skip krna hain. 

```C++
#include <iostream>
using namespace std;

int main(){
        int i = 1;
        while(i < 10){
                if(i == 7){
                        i++;
                        continue;
                }
        }
        cout << i << endl;
        i++;
}

}


 PERFECT EXAMPLE OF WHEN TO USE WHILE AND FOR LOOP
 ```c++
 #include <iostream>

using namespace std;

int main()
{
    int number1, number2 = 4;
    cin>>number1;
      int count =0; 
      int i=1; 
      while(count<number1) 
      {

        int num = (3*i)+2;
        i++;
        if((num%number2)==0)
        {

        }
        else
        {
            cout<<num<<" ";
            count++;
        }

      }
}
```
## SMALL THINGS ABOUT TAKING INPUT FROM THE USER.

### DIFFERENCE BETWEEN cin and cin.get()

below given program tabh tak chalega jab tak dollar sign nahin aajata.jab aaya toh rukh jaayega.ab humne ek counter bhi fit kiy to count the character.input mein space aur tab bhi dena

```C++
#include <iostream>
using namespace std;

int main() {
	char c;
	cin >> c;
	int count = 0;
	while (c != '$') {
		count++;
		cin >> c;
	}
	cout << count << endl;
}
```
OUTPUT
```
kushal@kushal:~/Desktop/C++/test$ ./hello
1
s
d
f
 (THIS IS SPACE)
       (TAB) 
f
$
5
```

cin makes you very restricted output which is good normally.But when you need control on our side use cin.get()
bcoz it counts tab spaces and other things.
```C++
#include <iostream>
using namespace std;

int main() {
	char c;
	c = cin.get();
	int count = 0;
	while (c != '$') {
		count++;
		c = cin.get();
	}
	cout << count << endl;
}
```



