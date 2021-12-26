;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 2446_UNIFINISHED) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
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