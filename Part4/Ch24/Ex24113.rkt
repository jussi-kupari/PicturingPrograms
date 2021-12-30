;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex24113) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.1.13
Develop a function named table-of-squares that takes in a whole
number and returns a list of posns representing a table of numbers and their squares from
the given number down to 0. For example,

(check-expect (table-of-squares 4)
(list (make-posn 4 16)
(make-posn 3 9)
(make-posn 2 4)
(make-posn 1 1)
(make-posn 0 0)))

Note: I’ve put these in descending order because it’s easier to write the function that
way. It would be nice to produce the table in increasing order instead. We’ll see how to
do that in the next section.|#

;; -- Data Definition

;; LOPosn (List-Of-Posns) is one of:
;; -empty
;; - (cons Posn LOPosn)
;; interp. a list of Posns

;; -- Functions

;; table-of-squares : Natural -> LOPosn
;; Given a Natural, produces a list of posns representing a table of numbers
;; and their squares from the given number down to 0
(check-expect
 (table-of-squares 0)
 (cons (make-posn 0 0) empty))
(check-expect
 (table-of-squares 1)
 (cons (make-posn 1 1) (cons (make-posn 0 0) empty)))
(check-expect
 (table-of-squares 2)
 (cons (make-posn 2 4) (cons (make-posn 1 1) (cons (make-posn 0 0) empty))))

(define (table-of-squares n)
  (cond
    [(zero? n) (cons (make-posn 0 0) empty)]
    [else
     (cons (make-posn n (sqr n))
           (table-of-squares (sub1 n)))]))