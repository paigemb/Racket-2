#lang racket

; Paige Biggs pmb66

; TODO:

; 0 - /tail recursion/
; 1 - Done
; 2 - Done
; 3 - Done
; 4 - Done
; 5 - Done
; 6 - Done
; 7 - Done
; 8 - Done
; 9 - Done
; 10 - xindex


; dotproduct
; adds zero and stops recursion when either of the lists become empty
; adds the product of the first two numbers of the lists
; recurses on next elements of the lists 

(define dotproduct-cps
  (lambda (lisA lisB return)
    (if (or (null? lisA) (null? lisB))
       (return 0)
        (dotproduct-cps (cdr lisA) (cdr lisB) (lambda (v) (return (+ (* (car lisA) (car lisB)) v)))))))

; removesubsequence

(define removesubsequence-cps
  (lambda (s l return)
    (cond
      ((null? l) (return l))
      ((null? s) (return l))
      ((eq? (car s) (car l)) (removesubsequence-cps (cdr s) (cdr l) return))
      (else (removesubsequence-cps s (cdr l) (lambda (v) (return (cons (car l) v))))))))

; squareroot
; new = old - ((old * old) - value) / (2 * old)

(define squareroot-cps
  (lambda (n k return)
    (if (or (zero? k) (zero? n))
        (return n)
        (squareroot-cps n (- k 1) (lambda (v) (return (- v (/ (- (* v v) n) (* 2 v)))))))))


; numatoms*
(define numatoms*-cps
  (lambda (lis return)
    (cond
      ((null? lis ) (return 0))
      ((not (pair? (car lis))) (numatoms*-cps (cdr lis) (lambda (v) (return (+ 1 v)))))
      (else (numatoms*-cps (car lis) (lambda (v1) (numatoms*-cps (cdr lis) (lambda (v2) (return (+ v1 v2))))))))))


; helper function for reverse 
(define append-cps
  (lambda (l1 l2 return)
    (if (null? l1)
        (return l2)
        (append-cps (cdr l1) l2 (lambda (v) (return (cons (car l1) v)))))))
; reverse*-cps
(define reverse*-cps 
  (lambda (lis return)
    (cond
      ((null? lis) (return '()))
      ((pair? (car lis)) (reverse*-cps (cdr lis) (lambda (v1) (reverse*-cps (car lis) (lambda (v2)  (append-cps v1 (cons v2 '()) return))))))
      (else (reverse*-cps (cdr lis) (lambda (v3) (append-cps v3 (cons (car lis) '() ) return )))))))

;vectormult
(define vectormult-cps
  (lambda (v m return)
    (if (null? (car m))
         (return '())
         ; dot product of v and the first column of m  cons that onto the recursive call
         (vectormult-cps v (mymap-cps cdr m (lambda (v) v)) (lambda (v1) (dotproduct-cps v (mymap-cps car m (lambda (v) v)) (lambda (v2) (return (cons v2 v1)))))))))

; apply f to every element of the list
(define mymap-cps
  (lambda (f lis return)
    (if (null? lis)
        (return '())
        (mymap-cps f (cdr lis) (lambda (v) (return (cons (f (car lis)) v)))))))

; matrixmultiply
(define matrixmultiply-cps
  (lambda (m1 m2 return)
    (if (null? m1)
        (return '())
        (matrixmultiply-cps (cdr m1) m2 (lambda (v) (return (cons (vectormult-cps (car m1) m2 (lambda (v) v)) v)))))))

;removesubsequence
;use two values in the continuation function --> use two parameters with return

(define removesubsequence*-cps
  (lambda (s l return)
    (cond
      ((null? l) (return s l))
      ((null? s) (return s l))
      ((list? (car l)) (removesubsequence*-cps s (car l) (lambda (s1 l1) (removesubsequence*-cps s1 (cdr l) (lambda (s2 l2) (return s2 (cons l1 l2)))))))
      ((eq? (car s) (car l)) (removesubsequence*-cps (cdr s) (cdr l) (lambda (s3 l3) (return s3 l3))))
      (else (removesubsequence*-cps s (cdr l) (lambda (s4 l4) (return s4 (cons (car l) l4))))))))


;suffix takes an atom and a list and returns a list containing all elements that occur after the last occurrence of the atom.

(define suffix-break
  (lambda (x lis break)
    (cond
      ((null? lis) lis)
      ((eq? (car lis) x) (break (suffix-break x (cdr lis) break)))
      (else (cons (car lis) (suffix-break x (cdr lis) break))))))

(define suffix
  (lambda (x lis)
    (call/cc
     (lambda (k)
       (suffix-break x lis k)))))

;xindex

(define xindex
  (lambda (x lis)
  (call/cc
   (lambda (break)
     (xindex-break x lis break)))))

(define xindex-break
  (lambda (x lis break)
    (cond
      ((null? lis) lis);'((a b c) (3) (((g h) i) j) k (((3))))) lol 
      ((list? (car lis)) (call/cc (lambda (return) (xindex (cdr lis) return)))) ;(xindex x (cdr lis)))) returns null case 
      ((eq? x (car lis)) (break (lis))); (call/cc (lambda (return) (xindex (cdr lis) return)))))
      (else (xindex-break x (cdr lis) break)))))
      ;(else (xindex x (cdr lis) (break + 1)))))) 