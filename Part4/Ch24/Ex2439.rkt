;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2439) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.3.9
Define a struct frac that represents a fraction in terms of whole
numbers (as we’ve defined them).|#

(define-struct frac (numerator denominator))
;; Frac is (make-frac Natural Natural)
;; interp. a fraction of numerator over denominator 

(define FRAC1 (make-frac 6 10))

#| Template for frac
(define (fn-for-frac f)
  (... (frac-numerator f)       
       (frac-denominator f)))   
|#

