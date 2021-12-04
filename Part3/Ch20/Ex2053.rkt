;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2053) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.5.3 Develop a function named scale-posn that takes in a number and
; a posn, and returns a posn formed by multiplying the number by each of the coordinates
; of the input posn.
; 
; For example,
; (check-expect (scale-posn 3 (make-posn 2 5)) (make-posn 6 15))


;; scale-posn : Number Posn -> Posn
;; Given number and Posn, produces a Posn with the x and y multiplied by the number
(check-expect (scale-posn 5 (make-posn 5 5)) (make-posn 25 25))
(check-expect (scale-posn 0 (make-posn 5 5)) (make-posn 0 0))
(check-expect (scale-posn -5 (make-posn 5 5)) (make-posn -25 -25))

(define (scale-posn n pos)
  (make-posn
   (* n (posn-x pos)) (* n (posn-y pos))))