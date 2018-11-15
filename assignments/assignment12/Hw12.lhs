Brian Liebe
Assignment 12 - CS471

> module Hw12
>     where

Rename this file to "hw12.lhs".
Add your code to this file in the positions indicated with "Problem N Answer:".
You will need to remove the spaces before ">" for the types to become part of
your code.

The names of the functions SHOULD NOT BE CHANGED. I will be grading these with
a script - if your code doesn't define the functions with the exact names
specified, they will be assumed skipped.

Once you've finished editing this file, submit it in a tar.gz directory
as usual.


Problem 1:

Write a function "prodAll" that takes a list of numbers and returns their sum.
This must be a recursive solution.
Example:
...> prodALL [2,7,4]
56

Problem 1 Answer:

> prodALL :: Num a => [a] -> a
> prodALL [] = 1
> prodALL (x : t) = x * prodALL t


Problem 2:

Write a function "binOpALL op lst" that takes an arbitrary binary operator and
a list of numbers and returns the result of applying the 'op' to the values in
list. To make things easy use the prefix notation for the operators,
e.g. (*) 3 2 evaluates to 6.
Example:
...> binOpALL (+) [2,7,4]
13

Problem 2 Answer:

> binOpALL :: Num a => (a -> a -> a) -> [a] -> a
> binOpALL op [x]   = x
> binOpALL op (x:t) = x `op` (binOpALL op t)

Problem 3:  Write a function prodALLC that behaves like probALL (problem 2)
            Your definition must use a partial evaluation of probALL.
Example:
...> prodALLC [2,7,4]
56

Problem 3 Answer:

> prodALLC :: Num a => [a] -> a
> prodALLC x = prodALL x

Problem 4:
Write a recursive function "insertAt v p lst" that inserts a value v at
position p in list lst. If p is greater than the length of lst, simply
insert it at the end.
Example:
...> insertAt 12 1 [1,2,3]
[1,12,2,3]
...> insertAt 12 10 [1,2,3]
[1,2,3,12]

Remember, Haskell is "pure", so you can not modify lst. Instead, you should
recurse and build a new list from lst with v inserted. 

Problem 4 Answer:

> insertAt :: (Eq a, Num a) => b -> a -> [b] -> [b]
> insertAt v p [] = [v]
> insertAt v p (x:t) = if (p == 0) then v:x:t else x:(insertAt v (p-1) t)

Problem 5. Thompson 10.3
Define a function composeList which composes a list of unary functions into a 
single function. You may assume the list of functions is not empty.
Define composeList using primitive recursion.
Example:
...> composeList [ (*) 2, (*) 2] 2
8
...> composeList [ (-) 3 , (*) 2, (+)5 ] 7 
-21
Notice how in the above example, the output of composeList [ (-) 3, (*) 2, (+) 5]
is the function f(x) = (3 - (2 * (5 + x))).


Problem 5 Answer:

> composeList :: Num a => [(a -> a)] -> a -> a
> composeList [] x = x
> composeList (op:t) x = op (composeList t x)


Problem 6: (from http://en.wikipedia.org/wiki/Thue%E2%80%93Morse_sequence )
"In mathematics, the Thue-Morse sequence, or Prouhet-Thue-Morse sequence, is a 
binary sequence that begins:

  0 01 0110 01101001 0110100110010110 01101001100101101001011001101001 ...

(or if the sequence started with 1...)
    1 10 1001 10010110 1001011001101001 ...

"Characterization using bitwise negation

The Thue–Morse sequence in the form given above, as a sequence of bits, 
can be defined recursively using the operation of bitwise negation. So, the 
first element is 0. Then once the first 2n elements have been specified, 
forming a string s, then the next 2n elements must form the bitwise negation of 
s. Now we have defined the first 2n+1 elements, and we recurse.

Spelling out the first few steps in detail:

    * We start with 0.
    * The bitwise negation of 0 is 1.
    * Combining these, the first 2 elements are 01.
    * The bitwise negation of 01 is 10.
    * Combining these, the first 4 elements are 0110.
    * The bitwise negation of 0110 is 1001.
    * Combining these, the first 8 elements are 01101001.
    * And so on.
So the sequence is
    * T0 = 0
    * T1 = 01
    * T2 = 0110
	...
    
Define a primitive recursive function 'thue' given the nth thue element returns
the next thue element.  The elements will be represented as a list of 0s and 1s.
Example:
...> thue [0,1,1,0]
[0,1,1,0,1,0,0,1]


Problem 6 Answer:

  > thue :: (Eq a, Num a, Num a1) => [a] -> [a1]
  > thue2 :: (Eq a, Num a, Num a1) => [a] -> [a1]

> thue x = x ++ (thue2 x)
> thue2 [x] = if (x == 0) then [1] else [0]
> thue2 (x:t) = if (x == 0) then [1]++(thue2 t) else [0]++(thue2 t)


Problem 7:
Define a function replicate' which given a list of numbers returns a 
list with each number duplicated its value. The ' is not a typo - this is to
avoid the existing replicate.
Use primitive recursion in your definition.
You may use a nested helper definition.
Example:
...> replicate' [2, 4, 1]
[2,2,4,4,4,4,1]

Problem 7 Answer:

  > replicate' :: (Eq a, Num a) => [a] -> [a]



Problem 8:
In homework 1 you were introduced to the Ackermann Numbers.
The definition we used in the assignment is:

	ack( m,n ) =	n + 1			    if m = 0
	ack( m,n ) =	ack(m - 1, 1)		    if n = 0 and m > 0 
	ack( m,n ) =	ack( m-1, ack( m, n-1 ) )   if n >0 and m > 0

Define the ack function in Haskell.
Example:
...> ack 0 3
4
...> ack 3 2
29

Problem 8 Answer:


Problem 9:
A Define sumHarmonic using a simple recursive style:

The harmonic series is the following infinite series:
                1   1   1   1             1
            1 + - + - + - + - + ... + ... - ...
                2   3   4   5             i
(http://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
Write a function sumHarmonic such that sumHarmonic i is the sum of the first i
terms of this series. For example, sumHarmonic 4 ~> 1 + 1 + 1 + 1 ~> 2.08333...
                                                        2   3   4
Example:
...> sumHarmonic 4
2.08333...

Problem 9 Answer:
Note: this type is not required; you may have a slightly different type
depending on your solution.

  > sumH :: (Eq a, Fractional a) => a -> a

Problem 10: 
Implement Newton's method for calculating the square root of N.
Your definition should use primitive recursive style.
See (http://bingweb.binghamton.edu/~head/CS471/HW/Haskell2F18.html) webpage for
a definition of Newton method for the approximation of roots. 
Your definition should include a user defined (input) "guess" value and a user 
defined "nearEnough" value.  
"nearEnough" is use to determine when the guess is close enough to the square root. 
You should use locally defined helper functions to make your code more readable. 

Example: 
...> newtonAppr 144 1 0.1             
12.000545730742438 
...> newtonAppr 144 1 0.0001
12.0000000124087
...> newtonAppr 144 1 0.000000000000001
12.0
...> newtonAppr 5e+30 1 1000000000000000000000000000000  
2.317148867384728e15
...> newtonAppr 5e+30 1 100000000000000000000000000    
2.2360684271923805e15

Problem 10 Answer:
Note: again, you may have a slightly different type depending on your
solution.

   > newtonAppr :: (Fractional a, Ord a) => a -> a -> a -> a

