;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2437) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.3.7
Develop two functions wn-quotient and wn-remainder which, given
two whole numbers m and n, compute the quotient and remainder of dividing m by n.
Both should produce an error message if n = 0.|#


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
