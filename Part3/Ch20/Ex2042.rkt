;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2042) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.4.2
; Develop a function named above-diagonal? that takes in a posn
; representing a point on the screen, and tells whether it’s above
; the diagonal line x = y.
; 
; Hint: Remember that in computer graphics, positive y-values are
; usually down, so this diagonal line is from the top-left to bottom-right
; of the window. Pick some specific positions, described in (x, y)
; coordinates, and decide whether they’re above the diagonal or not. Then
; generalize this to a test that tells whether any posn is above the diagonal
; (by looking at its x and y coordinates).

(require picturing-programs)

;; above-diagonal? : Posn -> Boolean
;; Given a position, produces true if position is above diagonal (x > y)
(check-expect (above-diagonal? (make-posn 30 50)) false)
(check-expect (above-diagonal? (make-posn 30 30)) false)
(check-expect (above-diagonal? (make-posn 50 30)) true)


(define (above-diagonal? pos)
  (> (posn-x pos) (posn-y pos)))