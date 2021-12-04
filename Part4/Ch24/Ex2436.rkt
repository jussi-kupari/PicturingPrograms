;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2436) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.3.6
Develop a function wn-sub which, given two whole numbers m and n, computes m - n.

Hint: In this chapter, we’ve defined whole numbers, but not negative numbers, and
we haven’t promised that sub1 works on anything other than a positive whole number.
There are two ways you can write this function:

The “purist” way uses sub1 only on positive whole numbers, and produces an error
message if you try to subtract a larger number from a smaller (this was actually a
common mathematical practice in the 18th century)

The “pragmatist” way relies on the fact that Racket really does know about negative
numbers, and sub1 really does work on any number, not only positive wholes. This
way you can write wn-sub to work on any two whole numbers. The problem is that
the result may not be a whole number, so code like (wn-sub x (wn-sub y z)) may
not work.|#

;; wn-sub : Natural Natural -> Integer
;; Given two naturals, produces their difference
(check-expect (wn-sub  0  0)   0)
(check-expect (wn-sub  1  0)   1)
(check-expect (wn-sub  1  1)   0)
(check-expect (wn-sub  0  1)  -1)
(check-expect (wn-sub 20 17)   3)
(check-expect (wn-sub 17 20)  -3)

(define (wn-sub m n)
  (cond
    [(zero? n) m]
    [else (wn-sub (sub1 m) (sub1 n))]))    