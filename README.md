# Racket-2
Continuations Programming Excercise 
CSDS 345

For questions 1-7, write Scheme definitions for the following functions using continuation passing style (CPS). The continuation argument should be the last argument.

For full marks, all recursive calls of your function should use only the first stack frame.  You do not have to convert simple scheme built-in non-recursive functions like null?, eq?, list?, number?, car, cons, cdr to CPS, but all other helper functions you create should be in CPS.

For question 8, write the function so that it calls another function in CPS and using an appropriate return continuation.

For questions 9 and 10, write the function using call/cc and a helper function.  The helper function should be the only recursive function, and it should use "normal" recursion instead of tail recursion.

1. dotproduct takes a two vectors (lists of numbers) and computes the dot product of the vectors. If one list is longer than the other, you can ignore the extra numbers of the longer list.

2.removesubsequence takes two lists of atoms. The first list is a subsequence of the second list. The method should return the second list with the first occurrence of the subsequence removed. So, if the first list is '(a b c), the first a if the second list is removed, the first b that appears after the removed a is removed, and the first c that appears after the removed b is removed.

3.squareroot takes two numbers, a value and an iteration. The iteration will be an integer greater than or equal to 0. The method will compute the squareroot of the value using iteration rounds of Newton's method, starting with an initial value equal to the input value.
Newton's method is new = old - ((old * old) - value) / (2 * old)

4. numatoms* takes a nested list and returns the number of atoms (not including the empty list) in the list

5. reverse* takes a nested list and reverses the contents of the list and all nested lists

6. vectormult takes a row vector (a list of numbers) and matrix (a list of lists of numbers) and multiplies the vector times the matrix. The result is a vector where the ith element of the result is the dotproduct of the input vector and the ith column of the matrix. You can assume that the length of the vector matches the number of rows of the matrix.

7. matrixmultiply takes two matrices (a list of lists of numbers) and multiplies them. You can assume the number of columns of the first matrix is equal to the number of rows of the second matrix.
in the same sublist

8. removesubsequence* takes a list of atoms and a general list. The first list is a subsequence of the second list. The method should return the second list with the first occurrence of the subsequence removed. So, if the first list is '(a b c), the first a if the second list is removed, the first b that appears after the removed a is removed, and the first c that appears after the removed b is removed - no matter how deep the atoms are nested.

9. Write the following function using call/cc and a single helper function that uses "normal" recursion instead of tail recursion. You may use letrec to create an internal helper function that uses continuation passing style.
suffix takes an atom and a list and returns a list containing all elements that occur after the last occurrence of the atom.

10. Write the following function using call/cc and a single helper function that uses "normal" recursion instead of tail recursion. 

xindex takes an atom and a list containing sublists. The output list should be the same as the input list except that any sublist (including the main list) that contains the given atom should be emptied of all contents (atoms, lists, etc.), and instead, the only content of that sublist should be the index of the first occurrence of the atom in that list.
