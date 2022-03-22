;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2714) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 27.1.4
Re-write the randoms function from Exercise 24.4.9 using local to
call itself only once. Does it work correctly? Is it significantly faster?|#

#|Exercise 24.4.9
Re-write the randoms function of Exercise 24.1.11 by using the binary template.

Exercise 24.1.11
Develop a function named randoms that takes in two whole numbers
how-many and limit and produces a list of how-many numbers, each chosen randomly from
0 up to limit.

Hint: Use the template on how-many, not on limit.

I replaced all 'add1' and 'sub1' calls with their binary counterparts|#

;; randoms : Natural Natural -> List-Of-Numbers
;; produces a list of natural numbers length of first number with random numbers
;; between 0 and the second number
(check-expect (randoms.v2 0 0)
              empty)
(check-member-of (randoms.v2 1 0)
                 (cons 0 empty)
                 (cons 1 empty))
(check-member-of (randoms.v2 2 0)
                 (cons 0 (cons 0 empty))
                 (cons 1 (cons 1 empty))
                 (cons 0 (cons 1 empty))
                 (cons 1 (cons 0 empty)))

(define (randoms.v2 n1 n2)
  (cond
    [(zero? n1) empty]
    [else
     (local [(define ready-randoms
               (cons (random (binary-add1 n2))
                     (randoms.v2 (binary-sub1 n1) n2)))]
       ready-randoms)]))


;; randoms : Natural Natural -> List-Of-Numbers
;; produces a list of natural numbers length of first number with random numbers
;; between 0 and the second number
(check-expect (randoms 0 0)
              empty)
(check-member-of (randoms 1 0)
                 (cons 0 empty)
                 (cons 1 empty))
(check-member-of (randoms 2 0)
                 (cons 0 (cons 0 empty))
                 (cons 1 (cons 1 empty))
                 (cons 0 (cons 1 empty))
                 (cons 1 (cons 0 empty)))

(define (randoms n1 n2)
  (cond
    [(zero? n1) empty]
    [else
     (cons (random (binary-add1 n2))
           (randoms (binary-sub1 n1) n2))]))

;; Binary helpers
(define (ZER0 x) (* x 2))
(define (0NE x) (+ 1 (* x 2)))
(define (half x) (quotient x 2))

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
;; Given two naturals, finds the natural that is one smaller than the first natural
(check-expect (find-one-smaller   0  0)   0)
(check-expect (find-one-smaller  10  0)   9)
(check-expect (find-one-smaller  10  6)   9)
(check-expect (find-one-smaller 111 70) 110)
(define (find-one-smaller n m)
  (cond
    [(zero? n) 0]
    [(equal? (binary-add1 m) n) m]
    [else (find-one-smaller n (binary-add1 m))]))

;(time (randoms 500 500)) =>cpu time: 31 real time: 31 gc time: 0
;(time (randoms.v2 500 500)) =>cpu time: 31 real time: 34 gc time: 0