;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex1538) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 15.3.8
Develop a function make-stripes that takes in a width and height
(in pixels), and produces a rectangle that size and shape in which all the even-numbered
rows are red and the odd-numbered rows are blue. The result should be a bunch of narrow
stripes.|#

(require picturing-programs)

;; -- Functions

;; make-stripes : Natural Natural -> Image
;; Given width and height, produces an image that size with red/even and blue/odd stripes

(define (make-stripes x y)
  (build3-image x y red-function green-function blue-function))

;; red-function : Number Number -> Number
;; Given x and y, produces 0 for if y is odd and 255 if even
(check-expect (red-function 0 0) 255)
(check-expect (red-function 0 1) 0)
(check-expect (red-function 0 2) 255)
(check-expect (red-function 0 3) 0)

(define (red-function x y)
  (cond
    [(odd? y) 0]
    [else 255]))

;; green-function : Number Number -> Number
;; Given x and y, produces always zero
(check-expect (green-function 0 2) 0)
(check-expect (green-function 0 3) 0)

(define (green-function x y) 0)

;; blue-function : Number Number -> Number
;; Given x and y, produces 255 for if y is odd and 0 if even
(check-expect (blue-function 0 0) 0)
(check-expect (blue-function 0 1) 255)
(check-expect (blue-function 0 2) 0)
(check-expect (blue-function 0 3) 255)

(define (blue-function x y)
  (cond
    [(odd? y) 255]
    [else 0]))