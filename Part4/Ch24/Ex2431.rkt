;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2431) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Worked Exercise 24.3.1
Develop a function wn-add to add two whole numbers,
without using any built-in arithmetic operators except add1, sub1, zero?, and positive?.|#


;; wn-add : Natural Natural -> Natural
;; Given two naural numbers, produces their sum
(check-expect (wn-add 0 0) 0)
(check-expect (wn-add 0 1) 1)
(check-expect (wn-add 0 3) 3)
(check-expect (wn-add 1 0) 1)
(check-expect (wn-add 3 0) 3)
(check-expect (wn-add 3 8) 11)

(define (wn-add m n)
  (cond
    [(zero? n) m]
    [else (wn-add (add1 m) (sub1 n))]))
