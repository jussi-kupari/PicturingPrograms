;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex7810) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.8.10
; Define a function swap-red-blue that takes in an image and returns
; the same image with the red and blue components reversed: wherever
; there was a lot of red, there should be a lot of blue, and vice versa.

(require picturing-programs)


;; red-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the red at the xy
(check-expect (red-fn 10 20 30 40 50) 50)
(check-expect (red-fn 1000 100 250 125 0) 0)
(define (red-fn x y r g b) b)


;; green-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the green at the xy
(check-expect (green-fn 10 20 30 40 50) 40)
(check-expect (green-fn 1000 100 250 125 0) 125)
(define (green-fn x y r g b) g)


;; blue-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the blue at the xy
(check-expect (blue-fn 10 20 30 40 50) 30)
(check-expect (blue-fn 1000 100 250 125 0) 250)
(define (blue-fn x y r g b) r)

;; remove-red : Image -> Image
;; Given an image, produces the image with all red and blue color swapped
(check-expect (swap-red-blue (circle 50 "solid" "red")) (circle 50 "solid" "blue"))
(check-expect (swap-red-blue (circle 50 "solid" "blue")) (circle 50 "solid" "red"))

(define (swap-red-blue img)
  (map3-image red-fn green-fn blue-fn img))
