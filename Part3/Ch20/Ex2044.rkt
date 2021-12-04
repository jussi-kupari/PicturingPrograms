;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2044) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.4.4
; Develop a function named coordinate-difference which takes in
; a posn and gives back the difference between the coordinates
; (which tells you, in a sense, how far the point is from the diagonal line x = y).
; 
; Hint: The answer should never be negative, so use the built-in abs (absolute-value)
; function to ensure this.


;; coordinate-difference : Posn -> Number
;; Given a position, produces the absolute difference between the x and y
(check-expect (coordinate-difference (make-posn 0 0)) 0)
(check-expect (coordinate-difference (make-posn 100 50)) 50)
(check-expect (coordinate-difference (make-posn 50 100)) 50)

(define (coordinate-difference pos)
  (abs (- (posn-x pos) (posn-y pos))))