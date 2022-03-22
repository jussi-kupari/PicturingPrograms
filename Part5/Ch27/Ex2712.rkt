;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2712) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 27.1.2
Re-write the copies function from Exercise 24.4.2 or 24.4.6 by using
local to call itself only once. Does it work properly? Is it significantly faster?|#

#|Exercise 24.4.6
Re-write the copies function of Exercise 24.4.2 so that it takes in an
ordinary whole number, but is still written using the binary template.|#

#| From the book

Racket already knows about numbers and arithmetic, so instead of the structures
zer0 and 0ne, we might use
(define (ZER0 x) (* x 2))
(define (0NE x) (+ 1 (* x 2)))
(define (half x) (quotient x 2))

Template (rbw is "real binary whole")

(define (fn-for-rbw n) 
  (cond [(zero? n) ...]
        [(even? n) ...]
        [(odd? n) ...]))
|#

;; -- Functions

(define (half x) (quotient x 2))

;; copies : String Natural -> LOS
(check-expect (copies "spam" 0) empty)
(check-expect (copies "spam" 1) (cons "spam" empty))
(check-expect (copies "spam" 2) (cons "spam" (cons "spam" empty)))
(check-expect (copies "spam" 3) (cons "spam" (cons "spam" (cons "spam" empty))))
(check-expect (copies "spam" 6) (list "spam" "spam" "spam" "spam" "spam" "spam"))
(check-expect (copies "spam" 7) (list "spam" "spam" "spam" "spam" "spam" "spam" "spam"))

(define (copies s n)
  (cond [(zero? n) empty]
        [(even? n)
         (append (copies s (half n)) (copies s (half n)))]
        [(odd? n)
         (cons s (append (copies s (half n)) (copies s (half n))))]))

;; copies.v2 : String Natural -> LOS
(check-expect (copies.v2 "spam" 0) empty)
(check-expect (copies.v2 "spam" 1) (cons "spam" empty))
(check-expect (copies.v2 "spam" 2) (cons "spam" (cons "spam" empty)))
(check-expect (copies.v2 "spam" 3) (cons "spam" (cons "spam" (cons "spam" empty))))
(check-expect (copies.v2 "spam" 6) (list "spam" "spam" "spam" "spam" "spam" "spam"))
(check-expect (copies.v2 "spam" 7) (list "spam" "spam" "spam" "spam" "spam" "spam" "spam"))

(define (copies.v2 s n)
  (cond
    [(zero? n) empty]
    [else
     (local [(define ready-copies (copies.v2 s (half n)))]
       (if (even? n)
           (append ready-copies ready-copies)
           (cons s (append ready-copies ready-copies))))]))

;(time (copies "spam" 37568)) =>cpu time: 31 real time: 28 gc time: 15
;(time (copies.v2 "spam" 37568)) =>cpu time: 0 real time: 0 gc time: 0