# Racket-2
Continuations Programming Excercise 
CSDS 345

For questions 1-7, write Scheme definitions for the following functions using continuation passing style (CPS). The continuation argument should be the last argument. 

For full marks, all recursive calls of your function should use only the first stack frame.  You do not have to convert simple scheme built-in non-recursive functions like null?, eq?, list?, number?, car, cons, cdr to CPS, but all other helper functions you create should be in CPS.

For question 8, write the function so that it calls another function in CPS and using an appropriate return continuation.

For questions 9 and 10, write the function using call/cc and a helper function.  The helper function should be the only recursive function, and it should use "normal" recursion instead of tail recursion.
