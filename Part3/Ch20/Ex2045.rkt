;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2045) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.4.5
; Develop a function named distance that takes in two posns
; (call them here and there), and computes the straight-line
; distance between them.
; 
; The formula is:
; .
; 


;; distance : Posn Posn -> Number
;; Given two positions, produces the distance between the positions
(check-expect (distance (make-posn 0 0) (make-posn 0 0)) 0)
(check-within (distance (make-posn 10 10) (make-posn -50 -40)) 78 0.15)

(define (distance here there)
  (sqrt
   (+
    (sqr (- (posn-x here) (posn-x there)))
    (sqr (- (posn-y here) (posn-y there))))))