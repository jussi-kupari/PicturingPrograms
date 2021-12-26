;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex24410_UNFINISHED) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 24.4.10
Re-write the random-posns function of Exercise 24.1.12 by using the binary template.

Exercise 24.1.12
Develop a function named random-posns that takes in three whole
numbers how-many, max-x, and max-y and produces a list of how-many posns, each with
x chosen randomly between 0 and max-x, and y chosen randomly between 0 and max-y.

|#

;; -- Data Definition

;; LOPosn (List-Of-Posns) is one of:
;; -empty
;; - (cons Posn LOPosn)
;; interp. a list of Posns

;; random-posns : Natural Natural Natural -> LOPosn
;; produces a list of how-many posns, each with x chosen randomly between 0 and max-x,
;; and y chosen randomly between 0 and max-y.
(check-expect
 (random-posns 0 0 0)
 empty)
(check-expect
 (random-posns 0 10 10)
 empty)
(check-member-of
 (random-posns 1 1 1) (cons (make-posn 0 0) empty)
 (cons (make-posn 1 0) empty)
 (cons (make-posn 0 1) empty)
 (cons (make-posn 1 1) empty))

(define (random-posns hm maxx maxy)
  (cond
    [(zero? hm) empty]
    [else
     (cons (make-posn (random (binary-add1 maxx)) (random (binary-add1 maxy)))
           (random-posns (binary-sub1 hm) maxx maxy))]))

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
