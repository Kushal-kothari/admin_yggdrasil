* Important Points
Jo bhi code likhna hain woh default code ke andar hi likhna hain. Usse change nahin krna hain.
After writing the code Type submit. Jo bhi code likha hain woh evaluate hoga  with  predefined test cases
Custom Input ->
Iske liye mere code and expected code ka result kya aaraha hain.

Solution ->
We can check soln what it is .2 format 1> code 2> video .
Dont check the soln either we aren't done with the problem.

Ask doubt to reach out to TA'S 




# Basics Of Problem Solving

### How to approch any given problem and how to structure its solution ?
What to do when we are given to solve any problem

* 1)to analyse what is the input given to me and what is the output !(To analyse our problem kya kya input milne waala hain and what is the desired output).

* 2)Start thinking about the solution but at times hota yeh hain jo problem ki complexity hoti hain uske solution ke baare mein sochna difficult hota hain so what we can break our problems into smaller subparts.
Agar aisa kiya toh solution sochna would be easy for us.

* 3)Now we have a vague idea about how to approach and solve the problem.

* 4)Now in this step what happens is while writng code now we start to introduce a lot of errors along the way in the final code.And at the end we need to invest a lot of time in debugging.

* 5)So to save from step4 we need to structure and write down the solution on the paper.

* 6)Now is also not the right time to write the code.First verify the/your solution.(take 2/3 sample input and check is it giving desired output).

* 7)Now write the code .In this step it is clear we will have very less errors.

# FLOWCHART AND IT'S COMPONENTS 

### we need to know how to structure the solution.Flowchart is one possible way to do that.

## Will be use in writing documentation/proposals etc.

(Start) Start the flowchart
   |
/Read N/   Input(to read values given) and Output(print the value)[It is parralelogrma shaped]
   |
|Calculation| any calculative part will come here 
   |
   /\ 
Is I greater than N?     Decision block (kite)
   \/


### Examples

Eg 1) Add Two Numbers
(Start) ->/ Read a,b/ -> |Sum = a + b| ->/Output Sum/ -> (End).

Eg 2)Read Principal,Rate & Time & Print SI
(Start) ->/ Read P,R,T/ ->|SI = Formula| -> /Output SI/ ->(End).


# DECISION BOX(the work we want to do is dependent on some condition).Diamond shape box based on condition

   /\
Condition ->true
   \/  
   |
   False

Eg: 3 no mein sabse bada kaun?Logi : 1>a>=b and a>=c   
                                    2>b>=a and b>=c
                                    3>c.

Eg: Valid Triangle  sides Logic:     
1> a + b > c
2> a + c > b
3> b + c > a

## LOOPS

We want to  print all the number from 1 to N. how to deal with problem in paper/pen?
Ans: lets sy N = 5 hain to apne ko print krna hain no from 1 to 5.So we want storage of onotoal no and then we will print it and then update it by 1 and then again print it till our condition (decision box) satisfies [No <= N]

* In previous examples we used decision box only once if true do this or do that.uske baad apan decision box ke pass nahin gaye the.But in this problem we will come to decision box everytime to check the condition which is known as  *Loop*


## remember after creating flowchart use sample values and test if the flowchart works properly.

Eg 2)Sum of numbers from 1 to N
First try to make it an infinite loop and then add condition.

#### Jab bhi same set of work baar baar krna hota hain tabh we used loops.

Eg 3)TO chexk no is prime or not condition : div <= N/2
     Best logic: (root of N).

     