Brian Liebe
CS471 - Assignment 11

1) ----------------------------------------

I promise I did this in GHCi

2) ----------------------------------------

> module Hw11
>     where

Define factorial. Let Haskell infer the type of factorial.

> factorial n = if n == 0 then 1 else n * factorial (n - 1)

factorial 5 gives me 5! which is 120

3) ----------------------------------------

> fact1 :: Int -> Int
> fact1 n = if n == 0 then 1 else n * fact1 (n - 1)
> fact2 :: Integer -> Integer 
> fact2 n = if n == 0 then 1 else n * fact2 (n - 1)

4) ----------------------------------------
 
When the factorial number gets to 500, 500! is too large to be stored
as an Int, so it just fails and goes to 0. However Integers can store
a number that large, so fact2 doesn't fail. factorial also doesn't 
fail because it just uses an Integer because type isn't defined.

5) ----------------------------------------

When you type 'factorial (-2)', the program just stalls because it
doesn't have a case for negative numbers. So it just keeps calling 
factorial over and over again with no way to stop. When you type
'facotrial -2' the program crashes because it's expecting another 
argument, due to the fact that '-' expects two operators. When you 
put it in ( ), it knows that it's being used as a negative.

6) ----------------------------------------

> factP :: Integer -> Integer
> factP 0 = 1
> factP n = n * factP (n - 1)

This factP does the same thing as factorial or fact2.

7) ----------------------------------------

> factG x
>     | x < 0     = error "neg x"
>     | x == 0    = 1
>     | otherwise = x * factG (x - 1)

Now we have a good check for negative values, so it will throw an
error rather than just running forever.

8) ----------------------------------------

> factG2 :: Integer -> Integer
> factG2 n
>     | n < 0     = error "neg n"
>     | n == 0    = 1
>     | otherwise = n * factG2 (n -1 )
> factE :: Integer -> Integer
> factE n
>     | n < 0     = error "neg n"
>     | n == 0    = 1
>     | otherwise = n * factE n - 1

'factorial 5.1' runs forever because it allows floats, but it never
hits 0, it jumps past it into negatives.
'factG 5.1' fails because it becomes negative
'factG2 5.1' fails because it requires Integers.

'factG2 5' works fine because this is normal behavior
'factE 5' runs forever because it's interpreting the last line as
'(factE n) - 1' which causes it to run forever. Obviously if ( ) 
were used then this would work as expected
