;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2074) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.7.4
; Extend the function my-color=? so that each argument can be either
; a color or a string (color name). You’ll need at least eight test cases:
; the first argument can be a string or a color, the second argument can be
; a string or a color, and the right answer can be true or false. Your function
; should also not crash if it’s given a string that isn’t a recognized color name:
; 
; (check-expect (color=? "forest green" (make-color 34 139 34))
; true)
; (check-expect (color=? (make-color 58 72 14) (make-color 58 72 14))
; true)
; (check-expect (color=? "plaid" "orange")
; false)
; 

(require picturing-programs)

;; my-color=? : Color|String Color|String -> Boolean
(check-expect (my-color=? (make-color 0 255 0) (make-color 0 255 0)) true)
(check-expect (my-color=? (make-color 0 255 0) (make-color 255 0 0)) false)
(check-expect (my-color=? (make-color 0 255 0) "green") true)
(check-expect (my-color=? "green" (make-color 0 255 0)) true)
(check-expect (my-color=? "green" "green") true)

(check-expect (my-color=? "forest green" (make-color 34 139 34)) true)
(check-expect (my-color=? (make-color 58 72 14) (make-color 58 72 14)) true)
(check-expect (my-color=? "plaid" "orange") false)

(define (my-color=? c1 c2)
  (cond
    [(not (and (image-color? c1) (image-color? c2))) false]
    ; using an image to test if colors are the same
    [(image=? (circle 10 "solid" c1) (circle 10 "solid" c2)) true]
    [else false]))