;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1537_wip) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 15.3.7
Using build3-image, build a rectangular image 150 pixels wide by
100 pixels high which is yellow above the diagonal (from top-left to bottom-right corner)
and blue below the diagonal.|#

(require picturing-programs)

;; red-function : Number Number -> Number
;; Given x and y, produces the red component accordingly
(define (red-function x y)
  (cond
    [(<= x (* 1.5 y)) 0]
    [else 255]))

;; green-function : Number Number -> Number
;; Given x and y, produces the green component accordingly
(define (green-function x y)
  (cond
    [(<= x (* 1.5 y)) 0]
    [else 255]))

;; blue-function : Number Number -> Number
;; Given x and y, produces the blue component accordingly
(define (blue-function x y)
  (cond
    [(<= x (* 1.5 y)) 255]
    [else 0]))

(build3-image 150 100 red-function green-function blue-function)