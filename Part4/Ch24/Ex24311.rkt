;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex24311) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.3.11
Develop a function reduce-frac that takes in a frac and returns
an equivalent frac in lowest terms, i.e. with no common factors between numerator and
denominator.|#

(define-struct frac (numerator denominator))
;; Frac is (make-frac Natural Natural)
;; interp. a fraction of numerator over denominator 

(define FRAC1 (make-frac 6 10))

#| Template for frac
(define (fn-for-frac f)
  (... (frac-numerator f)       
       (frac-denominator f)))   
|#

;; reduce-frac : Frac -> Frac
;; Given a fraction, simplifies it to the fullest
(check-expect (reduce-frac (make-frac 1  1)) (make-frac 1 1))
(check-expect (reduce-frac (make-frac 1  2)) (make-frac 1 2))
(check-expect (reduce-frac (make-frac 2  4)) (make-frac 1 2))
(check-expect (reduce-frac (make-frac 2  3)) (make-frac 2 3))
(check-expect (reduce-frac (make-frac 5 25)) (make-frac 1 5))
(check-expect (reduce-frac (make-frac 30 5)) (make-frac 6 1))

(define (reduce-frac f)
  (reduce-with-numbers f 1000))

;; reduce-with-numbers : Frac Natural -> Frac
;; Given a fraction and a natural to start form, returns the most simple fraction
(check-expect (reduce-with-numbers (make-frac   1    1) 1000) (make-frac   1    1))
(check-expect (reduce-with-numbers (make-frac   1    5) 1000) (make-frac   1    5))
(check-expect (reduce-with-numbers (make-frac 333  999) 1000) (make-frac   1    3))
(check-expect (reduce-with-numbers (make-frac 555 9699) 1000) (make-frac 185 3233))

(define (reduce-with-numbers f n)
  (cond
    [(and (zero? (wn-remainder (frac-numerator f) n))
          (zero? (wn-remainder (frac-denominator f) n)))
     (make-frac (wn-quotient (frac-numerator f) n)
                (wn-quotient (frac-denominator f) n))]
    [else (reduce-with-numbers f (sub1 n))]))  

;; wn-quotient : Natural Natural -> Natural
;; Given two naturals, produces the quotient of dividing the first with the second.
(check-error (wn-quotient 0 0) "You can't divide with a zero.")
(check-error (wn-quotient 1 0) "You can't divide with a zero.")
(check-expect (wn-quotient 0 1) 0)
(check-expect (wn-quotient 0 5) 0)
(check-expect (wn-quotient 1 2) 0)
(check-expect (wn-quotient 2 1) 2)
(check-expect (wn-quotient 5 1) 5)
(check-expect (wn-quotient 5 5) 1)
(check-expect (wn-quotient 6 5) 1)
(check-expect (wn-quotient 9 5) 1)

(define (wn-quotient m n)
  (cond
    [(zero? n) (error "You can't divide with a zero.")]
    [(or (zero? m) (< m n)) 0]
    [else (add1 (wn-quotient (wn-sub m n) n))]))

;; wn-remainder : Natural Natural -> Natural
;; Given two naturals, produces the remainder of dividing the first with the second.
(check-error (wn-remainder 0 0) "You can't divide with a zero.")
(check-error (wn-remainder 1 0) "You can't divide with a zero.")
(check-expect (wn-remainder 0 1) 0)
(check-expect (wn-remainder 0 5) 0)
(check-expect (wn-remainder 5 5) 0)
(check-expect (wn-remainder 6 5) 1)
(check-expect (wn-remainder 5 6) 5)
(check-expect (wn-remainder 9 5) 4)

(define (wn-remainder m n)
  (cond
    [(zero? n) (error "You can't divide with a zero.")]
    [(equal? m n) 0]
    [(< m n) m]
    [else (wn-remainder (wn-sub m n) n)]))

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