# Racket-2
Continuations Programming Excercise 
CSDS 345

For questions 1-7, write Scheme definitions for the following functions using continuation passing style (CPS). The continuation argument should be the last argument. For example, if you were asked to write factorial, the ''normal'' recursive function is:

```(define factorial
  (lambda (n)
    (if (zero? n)
        1
        (* n (factorial (- n 1))))))```
and so your answer should be

```(define factorial-cps
  (lambda (n return)
    (if (zero? n)
        (return 1)
        (factorial-cps (- n 1) (lambda (v) (return (* n v)))))))```
For full marks, all recursive calls of your function should use only the first stack frame.  You do not have to convert simple scheme built-in non-recursive functions like null?, eq?, list?, number?, car, cons, cdr to CPS, but all other helper functions you create should be in CPS.

For question 8, write the function so that it calls another function in CPS and using an appropriate return continuation.

For questions 9 and 10, write the function using call/cc and a helper function.  The helper function should be the only recursive function, and it should use "normal" recursion instead of tail recursion.

dotproduct takes a two vectors (lists of numbers) and computes the dot product of the vectors. If one list is longer than the other, you can ignore the extra numbers of the longer list.
> (dotproduct '(1 2 3) '(-2 1 5))
15
removesubsequence takes two lists of atoms. The first list is a subsequence of the second list. The method should return the second list with the first occurrence of the subsequence removed. So, if the first list is '(a b c), the first a if the second list is removed, the first b that appears after the removed a is removed, and the first c that appears after the removed b is removed.
> (removesubsequence '(1 3 5) '(0 1 2 3 4 5 6))
(0 2 4 6)
> (removesubsequence '(1 3 5) '(5 4 3 2 1 2 3 4 5))
(5 4 3 2 2 4)
> (removesubsequence '(a b c) '(d b c a c b a b c))
(d b c c a b)
squareroot takes two numbers, a value and an iteration. The iteration will be an integer greater than or equal to 0. The method will compute the squareroot of the value using iteration rounds of Newton's method, starting with an initial value equal to the input value.
Newton's method is new = old - ((old * old) - value) / (2 * old)
> (squareroot 5.0 0)
5.0
> (squareroot 5.0 1)
3.0
> (squareroot 5.0 5)
2.236067977499978
> (squareroot 5 5)
2 514229/2178309
numatoms* takes a nested list and returns the number of atoms (not including the empty list) in the list
> (numatoms* '(a (a (a b) c) a))
6
reverse* takes a nested list and reverses the contents of the list and all nested lists
> (reverse* '(a b (c (d e ((f) g)) h)))
((h ((g (f)) e d) c) b a)
vectormult takes a row vector (a list of numbers) and matrix (a list of lists of numbers) and multiplies the vector times the matrix. The result is a vector where the ith element of the result is the dotproduct of the input vector and the ith column of the matrix. You can assume that the length of the vector matches the number of rows of the matrix.
> (vectormult '(1 2 -1) '((0 2 3) (1 2 0) (1 0 3)))
(1 6 0)
matrixmultiply takes two matrices (a list of lists of numbers) and multiplies them. You can assume the number of columns of the first matrix is equal to the number of rows of the second matrix.
in the same sublist
> (matrixmultiply '((1 0 1) (1 1 1) (0 1 1)) '((2 3 4) (-1 1 2) (3 1 -2)))
((5 4 2) (4 5 4) (2 2 0))
removesubsequence* takes a list of atoms and a general list. The first list is a subsequence of the second list. The method should return the second list with the first occurrence of the subsequence removed. So, if the first list is '(a b c), the first a if the second list is removed, the first b that appears after the removed a is removed, and the first c that appears after the removed b is removed - no matter how deep the atoms are nested.
> (removesubsequence* '(a b) '(w (x b) ((a) ((y z))) b))
(w (x b) (() ((y z))))
As a hint, you need to keep track of two values between recursive calls. So use two values in the continuation function.

Write the following function using call/cc and a single helper function that uses "normal" recursion instead of tail recursion. You may use letrec to create an internal helper function that uses continuation passing style.
suffix takes an atom and a list and returns a list containing all elements that occur after the last occurrence of the atom.
> (suffix 'x '(a b c))
(a b c)
> (suffix 'x '(a b x c d x e f))
(e f)
Write the following function using call/cc and a single helper function that uses "normal" recursion instead of tail recursion. 

xindex takes an atom and a list containing sublists. The output list should be the same as the input list except that any sublist (including the main list) that contains the given atom should be emptied of all contents (atoms, lists, etc.), and instead, the only content of that sublist should be the index of the first occurrence of the atom in that list.
> (xindex 'x '((a b c) (d e x f) (((g h) i) j) k (((l m x o)))))
'((a b c) (3) (((g h) i) j) k (((3))))
> (xindex 'x '((a b c) (d e x g) (((h i) x) j) x k (((l m x o)))))
'(4)
> (xindex 'x '((a b c) (d e x g) (((h i) x) j k ((l m x o)))))
'((a b c) (3) ((2) j k ((3))))
