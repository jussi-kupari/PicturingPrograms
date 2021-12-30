;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex24313) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.3.13
Develop a function frac-add that takes in two fracs and returns
their sum, as a frac.|#

(define-struct frac (numerator denominator))
;; Frac is (make-frac Natural Natural)
;; interp. a fraction of numerator over denominator 

(define FRAC1 (make-frac 6 10))

#| Template for frac
(define (fn-for-frac f)
  (... (frac-numerator f)       
       (frac-denominator f)))   
|#

;; frac-add : Frac Frac -> Frac
;; Given two fractions, produces their addition
(check-expect (frac-add (make-frac 1 3) (make-frac 1 6)) (make-frac  1  2))
(check-expect (frac-add (make-frac 2 3) (make-frac 4 6)) (make-frac  4  3))
(check-expect (frac-add (make-frac 2 4) (make-frac 4 5)) (make-frac 13 10))

(define (frac-add f1 f2)
  (reduce-frac
   (make-frac
    (wn-add (wn-mult (frac-numerator f1) (frac-denominator f2))
            (wn-mult (frac-numerator f2) (frac-denominator f1)))
    (wn-mult (frac-denominator f1) (frac-denominator f2)))))

;; reduce-frac : Frac -> Frac
;; Given a fraction, simplifies it to the fullest
(check-expect (reduce-frac (make-frac 1  1)) (make-frac 1 1))
(check-expect (reduce-frac (make-frac 1  2)) (make-frac 1 2))
(check-expect (reduce-frac (make-frac 2  4)) (make-frac 1 2))
(check-expect (reduce-frac (make-frac 2  3)) (make-frac 2 3))
(check-expect (reduce-frac (make-frac 5 25)) (make-frac 1 5))
(check-expect (reduce-frac (make-frac 30 5)) (make-frac 6 1))

(define (reduce-frac f)
  (reduce-with-numbers f 1000)) ;This hard coded parameter is a hack

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

;; wn-mult : Natural Natural -> Natural
;; Given two natural numbers, produces their product
(check-expect (wn-mult 0  0)  0)
(check-expect (wn-mult 1  0)  0)
(check-expect (wn-mult 0  1)  0)
(check-expect (wn-mult 1  1)  1)
(check-expect (wn-mult 1  1)  1)
(check-expect (wn-mult 2  1)  2)
(check-expect (wn-mult 1  2)  2)
(check-expect (wn-mult 2  2)  4)
(check-expect (wn-mult 2  3)  6)
(check-expect (wn-mult 3  5) 15)
(check-expect (wn-mult 7  7) 49)
(check-expect (wn-mult 8 10) 80)

(define (wn-mult m n)
  (cond
    [(or (zero? m) (zero? n)) 0]
    [else (wn-add m (wn-mult m (sub1 n)))]))