;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2041) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 20.4.1 Develop a function named right-of-100? that takes in a
; posn representing a point on the screen, and tells whether it is to the right
; of the vertical line x = 100. (For example, we might have a 200-pixel-wide
; window, and want to do one thing for positions in the right half and something
; else for positions in the left half.)


;; right-of-100? : Posn -> Boolean
;; Given a posn, produces true if the x-coordinate is >100
(check-expect (right-of-100? (make-posn 90 120)) false)
(check-expect (right-of-100? (make-posn 100 120)) false)
(check-expect (right-of-100? (make-posn 190 120)) true)

(define (right-of-100? pos)
  (> (posn-x pos) 100))