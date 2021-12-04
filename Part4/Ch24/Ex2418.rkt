;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2418) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.1.8
Develop a function factorial that takes in a whole number and
returns the product of all the whole numbers from 1 up to and including it.

Hint: What is the “right answer” for 0? There are at least two possible ways to answer
this: you could decide that the function has no answer at 0 (so the base case is at 1,
not 0), or you could pick an answer for 0 so that the other answers all come out right.
Mathematicians generally choose the latter.|#

;; factorial : Natural -> Nautural
;; produces the product of all the natural numbers from up and including given number
(check-expect (factorial 0) 1)
(check-expect (factorial 1) (* 1 1))
(check-expect (factorial 2) (* 2 1 1))
(check-expect (factorial 3) (* 3 2 1 1))
(check-expect (factorial 4) (* 4 3 2 1 1))
(check-expect (factorial 5) (* 5 4 3 2 1 1))

(define (factorial n)
  (cond
    [(zero? n) 1]
    [else
     (* n (factorial (sub1 n)))]))


