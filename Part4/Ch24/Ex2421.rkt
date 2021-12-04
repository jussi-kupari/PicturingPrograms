;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2421) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.2.1
Develop a function add-up-from-10 that takes in a whole number n ≥ 10 and returns
the sum 10 + 11 + . . . + n. Generalize this to a function add-up-between that takes
in two whole numbers m and n and returns the sum m + (m + 1) + . . . + n.|#


;; add-up-from-10 : Natural -> Natural
;; Given a Natural[10, ], produces the sum of all Naturals up from 10 to specified number

(check-error (add-up-from-10 0) "Given number must be equal or greater than 10.")
(check-expect (add-up-from-10 10) 10)
(check-expect (add-up-from-10 11) (+ 11 10))
(check-expect (add-up-from-10 12) (+ 12 11 10))

(define (add-up-from-10 n)
  (cond
    [(< n 10) (error "Given number must be equal or greater than 10.")]
    [(= n 10) n]
    [else
     (+ n (add-up-from-10 (sub1 n)))]))


;; add-up-between : Natural Natural -> Natural
;; Given two Naturals, produces the sum of naturals between them (inclusive)
(check-expect (add-up-between 0 0) 0)
(check-expect (add-up-between 5 5) 5)
(check-expect (add-up-between 0 1) (+ 1 0))
(check-expect (add-up-between 1 2) (+ 2 1))
(check-expect (add-up-between 3 6) (+ 6 5 4 3))


(define (add-up-between m n)
  (cond
    [(= m n) n]
    [else
     (+ n (add-up-between m (sub1 n)))]))
