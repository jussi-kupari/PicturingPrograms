;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex25411) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.11
Develop a function binary-raise that takes in two natural num-
bers m and n and returns m^n, using the binary template (and not using the built-in +, *,
or expt functions).

These are horribly inneficient!!|#

;; -- Functions

(define (ZER0 x) (* x 2))
(define (0NE x) (+ 1 (* x 2)))
(define (half x) (quotient x 2))

;; binary-raise : Natural Natural -> Natural
;; Given two naturals, raises the first to the power of the second using the binary
(check-expect (binary-raise  0  0)    1)
(check-expect (binary-raise  1  0)    1)
(check-expect (binary-raise  0  7)    0)
(check-expect (binary-raise  7  0)    1)
(check-expect (binary-raise  7  1)    7)
(check-expect (binary-raise  7  2)   49)
(check-expect (binary-raise  7  3)  343)

(define (binary-raise m n)
  (cond
    [(zero? n) 1]
    [else (binary-mult m (binary-raise m (binary-sub1 n)))]))


;; binary-mult : Natural Natural -> Natural
;; Given two naturals, produces their product using the binary template
(check-expect (binary-mult  0  0)   0)
(check-expect (binary-mult  1  0)   0)
(check-expect (binary-mult  0  1)   0)
(check-expect (binary-mult  7  1)   7)
(check-expect (binary-mult  7  2)  14)
(check-expect (binary-mult  5  4)  20)
(check-expect (binary-mult 10 44) 440)

(define (binary-mult m n)
  (cond
    [(or (zero? m) (zero? n)) 0]
    [(equal? 1 n) m]
    [else (binary-add m (binary-mult m (binary-sub1 n)))]))

;; binary-add : Natural Natural -> Natural
;; Given two naturals, produces their sum using the binary template
(check-expect (binary-add  0  0)  0)
(check-expect (binary-add  1  0)  1)
(check-expect (binary-add  0  1)  1)
(check-expect (binary-add  5  4)  9)
(check-expect (binary-add 10 44) 54)

(define (binary-add m n)
  (cond
    [(and (zero? m) (zero? n)) 0]
    [(zero? n) m]
    [(zero? m) n]
    [else (binary-add (binary-add1 m) (binary-sub1 n))]))


;; binary-add1 : Natural -> Natural
;; Given a Natural, produces the next larger Natural
(check-expect (binary-add1 0)   1)
(check-expect (binary-add1 1)   2)
(check-expect (binary-add1 2)   3)
(check-expect (binary-add1 3)   4)
(check-expect (binary-add1 4)   5)
(check-expect (binary-add1 10) 11)
(check-expect (binary-add1 30) 31)
(check-expect (binary-add1 41) 42)
(check-expect (binary-add1 98) 99)

(define (binary-add1 n) 
  (cond [(zero? n) 1]
        [(even? n) (0NE (half n))]
        [(odd? n) (ZER0 (binary-add1 (half n)))]))

;; binary-sub1 : Natural -> Natural
;; Given a natural, produces the natural that is one smaller
(check-expect (binary-sub1   0)   0)
(check-expect (binary-sub1   9)   8)
(check-expect (binary-sub1  10)   9)
(check-expect (binary-sub1 123) 122)

(define (binary-sub1 n)
  (find-one-smaller n (half n)))

;; find-one-smaller : Natural Natural -> Natural
;; Given two naturals, starting from the second natural
;; finds the natural that is one smaller than the first
(check-expect (find-one-smaller   0  0)   0)
(check-expect (find-one-smaller  10  0)   9)
(check-expect (find-one-smaller  10  6)   9)
(check-expect (find-one-smaller 111 70) 110)
(define (find-one-smaller n m)
  (cond
    [(zero? n) 0]
    [(equal? (binary-add1 m) n) m]
    [else (find-one-smaller n (binary-add1 m))]))