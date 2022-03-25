;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex15310_wip) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 15.3.10
Develop a function make-diag-stripes that takes in a width and
height (in pixels), and produces a rectangle that size and shape filled with stripes running
from upper-right to lower-left.

I can't figure out how to write the red-function to produce the stripes. My brain is fried.

|#

(require picturing-programs)

;; make-stripes : Natural Natural -> Image
;; Given width and height, produces an image that size with red/even and blue/odd stripes

(define (make-diag-stripes x y)
  (build3-image x y red-function green-function blue-function))

;; red-function : Number Number -> Number
;; Given x and y, produces 255 if y is within 5 above of a number divisible by ten, else 0 

(define (red-function x y)
  (cond
    [(or 
         (= x (- 20 y))
         (= x (- 40 y))
         (= x (- 60 y))
         (= x (- 80 y))
         (= y (- 100 x))
         (= y (- 120 x))
         (= y (- 140 x))
         (= y (- 160 x))
         (= y (- 180 x))
         (= y (- 200 x))
         (= y (- 220 x))
         (= y (- 240 x))) 255]
    [else 0]))

;; green-function : Number Number -> Number
;; Given x and y, produces always zero

(define (green-function x y) 0)

;; blue-function : Number Number -> Number

(define (blue-function x y) 0)

(make-diag-stripes 100 100)