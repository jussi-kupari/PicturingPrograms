;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2073) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.7.3
; Suppose the color=? function weren’t already provided. How could you
; write it yourself? Develop a function my-color=? that takes in two color structs and
; tells whether they’re the same.

(require picturing-programs)

;; my-color=? : Color Color -> Boolean
;; Given two Colors, produces true if they are the same
(check-expect (my-color=? (make-color 0 0 0) (make-color 0 0 0)) true)
(check-expect (my-color=? (make-color 0 0 0) (make-color 0 1 0)) false)

(define (my-color=? c1 c2)
  (and
   (= (color-red c1) (color-red c2))
   (= (color-green c1) (color-green c2))
   (= (color-blue c1) (color-blue c2))))