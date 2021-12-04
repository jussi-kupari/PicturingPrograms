;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2047) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.4.7
; Develop a function named distance-to-origin that takes in either
; a number or a posn and tells how far it is from the appropriate “origin”.
; For numbers, that’s 0 and for posns, that’s (make-posn 0 0).


;; distance-to-origin : Natural|Posn -> Number
;; Given a number of a position, produces the distance from origin
(check-expect (distance-to-origin 7) 7)
(check-expect (distance-to-origin 0) 0)
(check-expect (distance-to-origin -27) 27)
(check-expect (distance-to-origin (make-posn 0 0)) 0)
(check-within (distance-to-origin (make-posn 10 10)) 14.1 0.05)

(define (distance-to-origin i)
  (cond
    [(posn? i) (abs (sqrt (+ (sqr (posn-x i)) (sqr (posn-y i)))))]
    [else (abs i)]))