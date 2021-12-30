;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex24112) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.1.12
Develop a function named random-posns that takes in three whole
numbers how-many, max-x, and max-y and produces a list of how-many posns, each with
x chosen randomly between 0 and max-x, and y chosen randomly between 0 and max-y.|#

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
     (cons (make-posn (random (add1 maxx)) (random (add1 maxy)))
           (random-posns (sub1 hm) maxx maxy))]))