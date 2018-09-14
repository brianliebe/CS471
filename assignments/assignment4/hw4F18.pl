/* 
   BRIAN LIEBE
   CS471 Assignment 4
   Programming Languages
   CS471, Fall 2018
   Binghamton University */

/* Instructions */

/* 

After you change the filename to 'hw4F18.pl', You will be able to code
in and run this file in the Prolog interpreter directly.

We will be using swipl for our Prolog environment: To load/reload this file,
cd to its directory and run swipl. Then, in the prompt, type [hw4F18].

From then on you may execute queries (goals) in the prompt. As usual, you
should provide your answers in the designated spot. Once you have added some
code to the file, rerun [hw4F18]. in the swipl prompt to reload.

In addition, there are "unit tests" provided for each problem. These are 
there to help you better understand what the question asks for, as well as
check your code. They are included in our knowledge base as queries
and are initially commented out (% denotes a Prolog line comment).

%:- member_times(4,[3,3,2,3],0). 		% This test succeeds if
						% member_times(4, [3,3,2,3], 0)
						% unifies (and returns true).
%:- member_times(4,[1,2,3],3) -> fail ; true.   % This test succeeds if
						% member_times(4,[1,2,3],3)
						% fails to unify (false).

After you have finished a problem and are ready to test, remove the
initial % for each test for the associated problem and reload the
assignment file ([hw4F18].).
If any of the tests do not pass, you will get a warning.
If you pass the tests there is a good chance that your code
is correct, but not guaranteed; the tests are meant as guided feedback
and are not a check for 100% correctness.
*/
/* Submission */

/* For this assignment -- and the remaining Prolog assignments -- your
submission should only include this source file -- there is no need
to add an additional text file with answers. Please tar and gzip
this file as normal with a name like eway1_hw4.tar.gz. */

/* Homework 4 */

/* Due: Tuesday, 9/18 at 11:59 PM */

/* Purpose: To get comfortable with backtracking, recursion,
   become familar with reflective mechanism of Prolog,
   and Prolog as a symbolic programming language.
*/

my_append([],Ys,Ys).
my_append([X|Xs],Ys,[X|Zs]) :- my_append(Xs,Ys,Zs).

my_prefix(_,[]).
my_prefix([X|Xs], [X|Ys]) :- my_prefix(Xs,Ys).


/* Problem 0A (NOT GRADED)
Using the preceding predicates, draw the execution trees for the following
queries (goals). You should also enter the queries in swipl to test.

my_append([a,b],[c],Z).
my_append(Xs,[c],[a,b,c]).
my_append(Xs,Ys,[a,b,c]).
my_prefix([a,b,c],Z).

After drawing the execution trees, enable tracking on my_append and my_prefix
by running (two separate queries)

trace(my_append).
trace(my_prefix).

in swipl. Now, execute the above queries and try and match what you drew to
the way the actual query is executed in swipl. To turn off 'trace', type the
query 'nodebug'.

If you prefer a graphical debugger/trace, enter the query 'manpce.' . You will
see a small XPCE manual window. Under the 'Tools' menu select: "Prolog
graphical tracer".

*/

/* Problem 0B (NOT GRADED)
   Each line is an individual Prolog query; it's a good idea type them in your
   prompt (not the file itself) to get a feel for the way Prolog works. You
   should think about whether or not each query will succeed, and if so how the
   variables will be initialized (unified). It will help in doing some of the
   problems.

?- number(A), A = 5.6.
?- A = 5.6, number(A).
?- integer(4).
?- help(max).
?- A = 5, B = 10, max(A,B).
?- A = 5, B = 10, M is  max(A,B).
?- A = 5, B = 10, A < B, S is A+B.
?- A = 5, B = 10, A > B, S is A+B.
?- help(functor).
?- functor(foo(a,b,c),F,N).
?- functor(T,foo,3).
?- clause(ack(M,0,B),C).
?- clause(H,(B is 2*0)).
*/


/* Problem 1
   A) What is the mathematical definition of:
     a) a relation?
     b) a function?
   B) Is every function a relation? If false, give a counter example.
   C) Is every relation a function? If false, give a counter example.

   (Please write your answer in a comment in the next section.)
*/

/* Problem 1 Answer

   A)
     a) The relationship between two sets
     b) A relation that associates each element of a set X (domain), to a single 
        element of another set Y (codomain).
   B) Yes.
   C) No, for example x = y^2 

*/

/* Problem 2
   Define homoiconic.
   Is Prolog homoiconic?
   What does it mean to say a language is fully reflective?
   Is Prolog fully reflective?
   See page 584 and Chapter 12
   Please write your answer in a comment in the next section.
*/

/* Problem 2 Answer

   A) If a language is homoiconic, the language treats code as data.
   B) Yes.
   C) This means the program can modify its own structure at runtime.
   D) Not fully reflective, but it is reflective in some ways.

*/

/* Problem 3
   Write a predicate insert_at(X,Y,N,Z) that succeeds if Z is the list Y with X 
   inserted at index N -- Insert X at index N in Y.

   NOTE: Don't worry about the error cases: i.e, N greater than the length of Y.  
*/

/* Problem 3 Answer: */

insert_at(_, [], _, []).
insert_at(X, [Y|Ys], N, [Z|Zs]) :- N < 0, Y = Z, insert_at(X, Ys, N, Zs).
insert_at(X, [Y|Ys], N, [Z|Zs]) :- N > 0, Y = Z, M is N-1, insert_at(X, Ys, M, Zs).
insert_at(X, Ys, N, [X|Zs]) :- N = 0, M is N-1, insert_at(X, Ys, M, Zs).

/* Problem 3 Test: */
:- insert_at(3,[1,2,3],2,[1,2,3,3]).  % SUCCEED
:- insert_at(1,[1,2,3],0,[1,1,2,3]).  % SUCCEED
:- insert_at(a,[1,2,3],1,[1,a,2,3]).  % SUCCEED

:- insert_at(1,[1,2,3],0,[1,2,3])-> fail ; true.    % FAIL


/* Problem 4:
Write a predicate merge(A,B,M) that succeeds if the list M has all the items from 
lists A and B in decreasing order.  Assume that A and B are sorted in decreasing
order.  Items do not need to be unique.

For example:
merge([10,3,2], [11,5,2], M) should give M =[11,10,5,3,2,2].

*/

/* Problem 4 Answer: */

merge(A, [], A).
merge([], A, A).
merge([X|A], [Y|B], [X|C]) :- X > Y, merge(A, [Y|B], C).
merge([X|A], [Y|B], [Y|C]) :- merge([X|A], B, C). 

/* Problem 4 Test: */
:- merge([10,3,2],[11,5,2],[11,10,5,3,2,2]) .       % SUCCEED
:- merge([0],[],[0]).                               % SUCCEED
:- merge([],[3],[3]).                               % SUCCEED

:- merge([4,3],[3],[3]) -> fail ; true.            % FAIL

/* Problem 5
   Write a predicate prodlist(List,Prod) which succeeds if Prod is the total 
   product of all the elements of List. This will be a top down recursion.
   The recursion clause will add the current value to the result of the prod
   of the rest of the list.
   We have already provided the base case for this predicate underneath
   'Problem 5 Answer'. You just need to add the recursive clause.
*/

/* Problem 5 Answer */

prodlist([], 1).
prodlist([A|B], N) :- prodlist(B, M), N is M * A.

/* Problem 5 Test */
/* There should be no warnings when compiling,
   tests which are supposed to fail are written as such */

:- prodlist([], 1).
:- prodlist([], 0) -> fail ; true.
:- prodlist([1,2,3,4],24).
:- prodlist([0], 0).


/* Problem 6
   Write the predicate prodlist2(List,Prod) which succeeds if Prod is the prod 
   total of all the elements of List. Instead of multiplying the current value 
   to the result of the prod of the tail, you will calculate the partial product
   of the all the elements you have reached so far. You will need an extra 
   argument to store the partial product, so you will write an auxilitary 
   predicate prodlist2/3 to handle the extra argument.

   Underneath 'Problem 4 Answer' we have provided prodlist2/2, which calls the
   auxiliary predicate prodlist2/3. We have also provided the base case for the
   auxiliary predicate. You just need to add the recursive clause for
   prodlist2/3.

*/

/* Problem 6 Answer */

prodlist2(List,Prod) :- prodlist2(List, 1, Prod).
prodlist2([], Prod, Prod).
prodlist2([A|B], N, Prod) :- M is N * A, prodlist2(B, M, Prod). 

/* Problem 6 Test */

:- prodlist2([], 1).
:- prodlist2([], 0) -> fail ; true.
:- prodlist2([1,2,3,4], 24).
:- prodlist2([0], 0).


/* Problem 7
   (From Learn Prolog NOW!) Binary trees are trees where all internal nodes have 
   exactly two children. The smallest binary trees consist of only one leaf node.
   We will represent leaf nodes as leaf(Label). For instance, leaf(3) and leaf(7)
   are leaf nodes, and therefore small binary trees. Given two binary trees B1 
   and B2 we can combine them into one binary tree using the predicate tree: 
   tree(B1,B2). So, from the leaves leaf(1) and leaf(2) we can build the binary
   tree tree(leaf(1), leaf(2)). And from the binary trees tree(leaf(1), leaf(2)) 
   and leaf(4) we can build the binary tree
   tree(tree(leaf(1), leaf(2)), leaf(4)).

   Now define a predicate isBinaryTree(+BT) which succeeds if BT is a binary tree. 
   The "+" indicates that it is assumed BT is instantiated in the query.
   For example:
   If BT = tree( leaf(1), tree( leaf(2),leaf(4)) ), then isBinaryTree(BT) succeeds.
*/

/* Problem 7 Answer: */

isBinaryTree(leaf(_)).
isBinaryTree(tree(A, B)) :- isBinaryTree(A), isBinaryTree(B).

/* Problem 7 Test: */
:- isBinaryTree(leaf(1)).                                           %SUCCEED
:- isBinaryTree(tree(leaf(a),leaf(b))).                             %SUCCEED
:- BT = tree( leaf(b), tree( leaf(x),leaf(y)) ), isBinaryTree(BT).  %SUCCEED
:- BT = tree(tree(leaf(9), leaf(2)), tree(leaf(3), tree(leaf(3), leaf(1)))), isBinaryTree(BT). %SUCCEED
:- isBinaryTree( tree(leaf(1)) ) -> fail ; true.                    % FAIL
:- isBinaryTree( tree() )  -> fail ; true.                          % FAIL

/* Problem 8
   (Exercise 3.5 from Learn Prolog Now!)
   Problem 8 uses binary tree definition from problem 7.
   Define a predicate swap/2 , which produces the mirror image of the binary
   tree that is its first argument. For example:

   ?- swap( tree( tree(leaf(1), leaf(2)), leaf(4)), T).
   T = tree( leaf(4), tree(leaf(2), leaf(1))).
*/

/* Problem 8 Answer: */

swap(leaf(X), T) :- T = leaf(X).
swap(tree(X, Y), T) :- swap(X, T1), swap(Y, T2), T = tree(T2, T1).

/* Problem 8 Test: */
:- swap( tree( tree(leaf(1), leaf(2)), leaf(4)), T), T  =  tree( leaf(4), tree(leaf(2), leaf(1))).  %SUCCEED
:- swap(leaf(1), leaf(1)).  %SUCCEED
:- swap(tree(leaf(1), leaf(2)), tree(leaf(1), leaf(2))) -> fail ; true.  % FAIL


/* Problem 9:
   Problem 9 uses the binary tree definition from problem 7.  Assume all the 
   leaf labels are integer numbers.  Define a predicate maxV(+Bt, Max) which
   succeeds if Max is the maximum value found in valid binary tree, Bt.

   You may use either the builtin predicate 'max/2' or define your own 
   predicate max/3 using the relational operators.
*/

/* Problem 9 Answer: */

maxV(leaf(X), X).
maxV(tree(X, Y), Z) :- maxV(X, X1), maxV(Y, Y1), Z is max(X1, Y1).

/* Problem 9 Test: */
:- maxV( tree( tree(leaf(1), leaf(2)), leaf(4)), M), M=4.   %SUCCEED
:- BT = tree(tree(leaf(2), leaf(9)), tree(leaf(3), tree(leaf(4), leaf(1)))), maxV(BT, M), M=9.  %SUCCEED
:- BT = tree(tree(leaf(3), leaf(2)), tree(leaf(5), tree(leaf(9), leaf(1)))), maxV(BT, M), M=9.  %SUCCEED
:- maxV(tree(leaf(1), leaf(2)), 3) -> fail ; true.  % FAIL


