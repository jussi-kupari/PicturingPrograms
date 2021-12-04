;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2043) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 20.4.3
; Write a function named distance-to-top-left that takes
; in a posn representing a point on the screen, and computes
; the straight-line distance from this point to the top-left
; corner (i.e. coordinates (0, 0)) of the screen, in pixels.
; 
; Hint: The formula for the distance is:
; .


;; distance-to-top-left : Posn -> Number
;; Given a posn, produces the distance to the top left corner (0, 0)
(check-expect (distance-to-top-left (make-posn 0 0)) 0)
(check-within (distance-to-top-left (make-posn 5 5)) (sqrt 50) 0.01)

(define (distance-to-top-left pos)
  (sqrt
   (+ (sqr (posn-x pos))
      (sqr (posn-y pos)))))