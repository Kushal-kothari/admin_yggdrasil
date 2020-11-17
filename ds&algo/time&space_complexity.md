Agar humme koi question mila toh hum usska solution likhege.Now we want to check how good our solution is on the basis of time and space complexity.
We dont want humare algorithm mein bohot zyada time lagg jaye and usse bohot zyada memory ki zaroorat ho.
Time -> we dont just want that computer can solve our problem but we also want it to be fast.We wont like the website eg facebook ko 2 min lagte hain newsfeed ko upload krne mein toh hum usse use krna band kr dege.
That is the main reason why we use multiple solutions to the main problem(Sorting).

Abhi ke liye we focus on time.Space ke baare mein baadmein baat krege

Big O notation : algorithm A is called O(f(n)) if time taken by algorithm A for input n <= k*f(n).[Isse zyada time nahin lega isse kam lega].

Eg: Agar insertion sort bole ki mujhe lagega time 5n^2 + 10n + 1000 so yeh definately kam hoga 6n^2 se
i.e. 5n^2 + 10n + 1000 <= 6n^2

Eg : Largest Element In an Array. -> O(n).

Eg : INSERTION SORT:
IN Insertion sort,pehla element toh sort hi hot hain.
Ab we will insert th second element and agar number chot hua toh hum sort krdege woh part ko.So k element sort hogaye hoge.

Ab firse ek element ko sort krna padega

Lets talk about worst case:
5 4 3 2 1
-> 4 5 3 2 1
-> 4 3 5 2 1 
-> 4 3 2 5 1
-> 4 3 2 1 5

Aisa har element ke liye hoga.

k+2k+3k+4k+- - - + (n-1)k
k(1+2+3+- - -+ n-1) = k(n)(n-1)/2 = kn^2/2 -kn/2
The worst case scenario is O(n^2).
In best case we would do only kn i.e. O(n).
bubble sort,selection sort and insertion sort ka TC O(n^2) hota hain.


TIME COMPLEXITY OF SELECTION SORT:

Selection sort says, go to each element and find the minimum 
Har ek element ke liye lets say -> K work kiya
and element says n hain
So Kn hua and and phir array ka zeroth index fix hogaya and and humari ek iteration mein humne Kn kaam kiya and hum aage badh gaye
Ab hum we will go to each and every element and find the next minimum but this time (n-1) element hain so k(n-1)

So kn + k(n-1) + k(n-2) + k(n-3) + _ _ _ + k
So k common liya,
k(1+2+3+4+ ____+ n)

kn(n+1)/2 = kn^2/2 + kn/2 = O(n^2).

TIME COMPLEXITY OF RECURSION:
pplease go through pdf

Binary search ki time complexity -> O(log n) hain.
yeh dekh bohot zyada imoortant hain. 

TIME COMPLEXITY OF MERGE SORT

Merge sort is a typical recursive example.We are going to apply the same method and try and figure out recurance relation 

In merge sort,
hum pehle array ka size check krte hain -> constant k work
ab usko hum aadha todte hain phir un dono in english we say that we call on first half and call on second half

it is same as saying - call on first half -> T(n/2)
and call on second half -> T(n/2)

Phir hum dono part ko sort krte hain.
Hum naya array lete hain and compare the first element of array1 and first element of array2 and jo chotu usko daalte hain naye array mein.
So hum comparison kre hain aur ek chotu ko naye array mein daalte rehte hain.
So each of this ,we have to compare two elements and humme answer mil jata hain -> ek ko laga k1 so n ke liye laga k1n
Phir humme isse original array mein phirse fill krna hain -> k2n

So 2 half kan sort hoke aagaye i.e. T(n/2) + T(n/2) toh k1n + k2n

Total work T(n) = k + T(n/2) + T(n/2) + K1n + K2n
           T(n) = k + 2T(n/2) + Kn(kn = k1n + k2n)
           T(n) = 2T(n/2) + Kn(Ignore kiya constant k ko in terms ko kn)

Therefore, T(n) = 2T(n/2) + Kn      ->(1)   

[T(n/2) = 2T(n/4) + Kn/2]*2
T(n/4) = 2T(n/8) + Kn/4
T(1) = k

So finally -> n -> n/2 -> n/4 -> ----- -> n/2^x

n/2^x = 1

So, x = logn

So hum logn baar mein 1 ppe pohoch jaayege.Har equation se humme Kn milega 
Total time is Knlogn

Therefore time complexity of Merge Sort is : O(nlogn).