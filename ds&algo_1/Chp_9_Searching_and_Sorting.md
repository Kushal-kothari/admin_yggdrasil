## SEARCHING ALGORITHMS -> we will be given set of elements and we want to figure out if a particular element is present in that set or not.

Starting from index zero,hum ek ek element ko compare krte hain.Iska code nahin milega iss notes mein.Kushal krna tereko MBA hain but kya kare ab iss topic pe naa hi jaaein toh acha hain.

# BINARY SEARCH
First lets discuss how we can use it to search for a particular element.
Pehle iski prerequisite yeh hain ki isko pehle sort karo nahin toh yeh nahin chalega.

Ab in binary search instead of searching in whole array find the middle element if the array is even we will lets say choose 1st waala middle element.

# WHY BINARY SEARCH IS BETTER THAN LINEAR SEARCH
Input mein 1000 numbers hain and dhundna x hain jo hain hi nahin uss mein
Toh linear search mein woh pata krte krte lagg jayega 1000 comparisons
whereas in binary search lagege 1000->500->250->125->63->36->18->9->4->2->1
i.e maximum 10 comparisons

# ALGORITHM OF BINARY SEARCH
```C++
#include <iostream>
using namespace std;

int binarySearch(int arr[], int n, int x) {
	int start = 0, end = n - 1;
	while(start <= end) {
		int mid = (start + end) / 2;
		if(arr[mid] == x) {
			return mid;
		}
		else if(x < arr[mid]) {
			end = mid - 1;   //left mein jaana hain toh start+1
		}
		else {
			start = mid + 1; //right mein jaana hain toh start+1
		}
	}

	return -1;
}

int main() {
	// Take array input from the user
	int n;
	cin >> n;

	int input[100];
	
	for(int i = 0; i < n; i++) {
		cin >> input[i];
	}

	int x;
	cin >> x;

	cout << binarySearch(input, n, x) << endl; 	

} 

```
# We want to arrange an array either in increasing order or decreasing order.Therefore we have different Sorting algorithms.

## SELECTION SORT

Minimum dhundhna hain and array ke sabse pehle index se swap krna hain.Yeh process krni hain (n-1) tak bas phir hogaya.

```C++
#include <iostream>
using namespace std;

void selectionSort(int input[], int n) {
	for(int i = 0; i < n-1; i++ ) {
	// Find min element in the array
	int min = input[i], minIndex = i;
	for(int j = i+1; j < n; j++) {
		if(input[j] < min) {
			min = input[j];
			minIndex = j;
		}
	}
	// Swap
	int temp = input[i];
	input[i] = input[minIndex];
	input[minIndex] = temp;
	}
}

int main() {
	int input[] = {3, 1, 6, 9, 0, 4};
	selectionSort(input, 6);
	for(int i = 0; i < 6; i++) {
		cout << input[i] << " ";	 
	}
	cout << endl;
}
```
# BUBBLE SORT

Unsorted array ko sort krna hain.
Iss sort mein hum 1sr and second element ko compare krte hain.Sahi nahin hain toh swap krte hain aur aage badte rehte hain and har round(iteration) mein last wala element sahi jagah hojata hain array mein.


KHUD SE KIYA TUNE BRO

```C++
void bubbleSort(int *input, int size){
    int n = size;
    //this for loop for all iteration making sure array chota ho raha hain
    for(int j =n-1;j>0;j--)  //yeh imp tha which you did isme kuch nahin array ko chota kiya re niche ka dekh 

    //swap for one iteration if n hota j ki jagah and upar for loop nahin hota toh
        for(int i=0;i<j;i++){
            if(input[i]>input[i+1]){
                int temp = input[i];
                input[i] = input[i+1];
                input[i+1] = temp;
            }
    }

}
int main() {
	int input[] = {3, 1, 6, 9, 0, 4};
	bubbleSort(input, 6);
	for(int i = 0; i < 6; i++) {
		cout << input[i] << " ";
			 
	}
	cout << endl;
}
```

# INSERTION SORT

* Remember insertion sort mein swapping nahin hoti hain elements ki hamesha shifting hoti hain.
* Compare the numbers .Jo number hainn woh Chota hain toh theek hain bada hua toh shift krde. 


## EASY BUT IMP QUESTION

Rotate array
Given a random integer array of size n, write a function that rotates the given array by d elements (towards left)
Change in the input array itself. You don't need to return or print elements.
Input format :
Line 1 : Integer n (Array Size)
Line 2 : Array elements (separated by space)
Line 3 : Integer d
Output Format :
Updated array elements in a single line (separated by space)
Constraints :
0 <= N <= 10^7
0 <= d <= N
Sample Input 1:
7
1 2 3 4 5 6 7
2
Sample Output 1:
3 4 5 6 7 1 2
Sample Input 2:
7
1 2 3 4 5 6 7
0
Sample Output 2:
1 2 3 4 5 6 7


/***************************************************** SOLUTION **************************************************************************/


```C++
#include <iostream>
using namespace std;


void rotate(int *input,int d, int n){
    int i=0;
    while(i<d){
        int temp2 = input[0];
        for(int i=0;i<n-1;i++){
            int temp = input[i+1];
            input[i]=input[i+1];
            
            
        }
        input[n-1] = temp2;
        i++;
    }
}

 
int main() {
	int input[] = {1,2,3,4,5,6,7};
	rotate(input,2, 7);
	for(int i = 0; i < 7; i++) {
		cout << input[i] << " ";			 
	}
	cout << endl;
}

```

# the above pproach is correct but it will exceed the time.Apne ko isko potimize krne ka hain.


# INSERTION SORT

Hum assume kr lete hain jo humara pehla element hain woh hain phir ek ek karke naye element ko pick krte hain and element ko insert kr dte hain.THerefore it is known as Insertion sort.

We need to do comparison and shifting 



# MERGE TWO SORTED ARRAY INTO ONE SORTED ARRAY FULL

a[] = {1,9,10,12}
b[] = {2,6,15,20,40}

OUTPUT -> c[] = {1,2,6,9,10,12,15,20,40}

----------------------------------------------------

APPROACH 1) ek array lo dono ko merge karo and phir apne ko sorting toh aati hain usse sort krdo
But the problem is ki isme apan bohot faltu ka energy waste ho rahi hain.
ISS APPROACH KO HUM AUR ACHA KR SKTE HAIN LETS SEE AND KAAM COMPLETE KR SKTE HAIN
KASAM SE BHAI LAVDE LAGE HAIN ZINDAGI KE BUT KOI NAA OUTREACHY TOH PHODNA HAIN.

Remember -> agar humare paas unsorted arrays hote toh and phir yeh krna hota toh above solution is perfect but abhi toh sorted haina bc

So if we are able to efficiently use their sorted properties toh mazaa hi aajayega .Isi ka paisa hain


-------------------
APPROACH 2)







