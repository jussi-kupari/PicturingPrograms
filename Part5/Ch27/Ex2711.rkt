;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2711_WOP) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 27.1.1
Re-write the spams function from Exercise 24.4.5 using local to call
itself only once. Does it work correctly? Is it significantly faster?|#

#|Worked Exercise 24.4.5
Re-write the spams function to take in an ordinary whole
number, using the binary template.|#

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

;; binary-spams : Natural -> LOS
(check-expect (binary-spams 0) empty)
(check-expect (binary-spams 1) (cons "spam" empty))
(check-expect (binary-spams 2) (cons "spam" (cons "spam" empty)))
(check-expect (binary-spams 3) (cons "spam" (cons "spam" (cons "spam" empty))))
(check-expect (binary-spams 6) (list "spam" "spam" "spam" "spam" "spam" "spam"))
(check-expect (binary-spams 7) (list "spam" "spam" "spam" "spam" "spam" "spam" "spam"))

(define (binary-spams n)
  (cond [(zero? n) empty]
        [(even? n)
         (append (binary-spams (half n)) (binary-spams (half n)))]
        [(odd? n)
         (cons "spam" (append (binary-spams (half n)) (binary-spams (half n))))]))

;; binary-spams.v2 : Natural -> LOS
(check-expect (binary-spams.v2 0) empty)
(check-expect (binary-spams.v2 1) (cons "spam" empty))
(check-expect (binary-spams.v2 2) (cons "spam" (cons "spam" empty)))
(check-expect (binary-spams.v2 3) (cons "spam" (cons "spam" (cons "spam" empty))))
(check-expect (binary-spams.v2 6) (list "spam" "spam" "spam" "spam" "spam" "spam"))
(check-expect (binary-spams.v2 7) (list "spam" "spam" "spam" "spam" "spam" "spam" "spam"))

(define (binary-spams.v2 n)
  (cond [(zero? n) empty]
        [else
         (local [(define ready-spams (binary-spams.v2 (half n)))]
           (cond
             [(even? n)
              (append ready-spams ready-spams)]
             [else
              (cons "spam" (append ready-spams ready-spams))]))]))

;(time (binary-spams 398545)) =>cpu time: 218 real time: 216 gc time: 78
;(time (binary-spams.v2 398545)) =>cpu time: 0 real time: 4 gc time: 0