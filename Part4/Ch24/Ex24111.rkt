;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex24111) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.1.11
Develop a function named randoms that takes in two whole numbers
how-many and limit and produces a list of how-many numbers, each chosen randomly from
0 up to limit.

Hint: Use the template on how-many, not on limit.|#

;; randoms : Natural Natural -> List-Of-Numbers
;; produces a list of natural numbers length of first number with random numbers
;; between 0 and the second number
(check-expect (randoms 0 0)
              empty)
(check-member-of (randoms 1 0)
                 (cons 0 empty)
                 (cons 1 empty))
(check-member-of (randoms 2 0)
                 (cons 0 (cons 0 empty))
                 (cons 1 (cons 1 empty))
                 (cons 0 (cons 1 empty))
                 (cons 1 (cons 0 empty)))

(define (randoms n1 n2)
  (cond
    [(zero? n1) empty]
    [else
     (cons (random (add1 n2))
           (randoms (sub1 n1) n2))]))