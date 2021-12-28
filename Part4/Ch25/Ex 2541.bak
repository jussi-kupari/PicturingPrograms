;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Ex 2541_WOP|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.1
Develop a function cart-prod (short for “Cartesian product”) that
takes in two lists and returns a list of two-element lists, each with an
element from the first input list and an element from the second in that order.
The result should include all possible pairs of elements. You may assume that
there are no duplicate elements in the first list, and no duplicate elements
in the second list (although there might be things that are in both input lists.)

Hint: You’ll need a helper function.

Note: I am woring with strings here.|#

;; -- Data Definitions

;; List-of-String (LOS) is one of:
;; - empty
;; - (cons String LOS)
;; interp. a list of strings

;; List-of-LOS (LOLOS) is one of:
;; - empty
;; - (cons LOS LOLOS)
;; interp. a list of List-of-Strings

;; -- Functions

;; cart-prod : LOS LOS -> LOLOS
;; Given two List-of-Strings, produces a list of lists
;; that together produce all possible pairs from the elements of the two lists
(check-expect (cart-prod empty (list "c" "d")) empty)
(check-expect (cart-prod (list "a" "b") empty) empty)
(check-expect
 (cart-prod (list "a" "b") (list "c" "d"))
 (list (list "a" "c") (list "a" "d") (list "b" "c") (list "b" "d")))

(define (cart-prod los1 los2)
  (cond
    [(or (empty? los1) (empty? los2)) empty]
    [else
     (append (all-combinations (first los1) los2)
             (cart-prod (rest los1) los2))]))

;; all-combinations : String LOS -> LOLOS
;; Given a string and a LOS, produces all the two element combinations as a LOLOS
(check-expect (all-combinations "a" empty) empty)
(check-expect (all-combinations "a" (list "b" "c" "d"))
              (list (list "a" "b") (list "a" "c") (list "a" "d")))

(define (all-combinations s los)
  (cond
    [(empty? los) empty]
    [else
     (cons (cons s (cons (first los) empty))
           (all-combinations s (rest los)))]))