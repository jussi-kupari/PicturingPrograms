;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex7812) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.8.12
; Define a function apply-blue-gradient that takes in an image and returns an image
; with the same red and green components, but with the blue component equal to
; the y coordinate (so none at the top and the most at the bottom).
; 
; Hint: Test your program with images of a variety of sizes, including some that
; are more than 255 pixels high. (It would be nice to have this function always
; reach full blue just at the bottom of the image, regardless of image height, but
; that requires some techniques you don’t know yet; we’ll see how in Chapters 27 and 28.)

(require picturing-programs)


;; red-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the red at the xy
(check-expect (red-fn 10 20 30 40 50) 30)
(check-expect (red-fn 1000 100 250 125 0) 250)
(define (red-fn x y r g b) r)


;; green-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the green at the xy
(check-expect (green-fn 10 20 30 40 50) 40)
(check-expect (green-fn 1000 100 250 125 0) 125)
(define (green-fn x y r g b) g)


;; blue-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the blue at the xy equal to the y (max 255)
(check-expect (blue-fn 10 20 30 40 50) 20)
(check-expect (blue-fn 1000 100 250 125 0) 100)
(check-expect (blue-fn 1000 300 250 125 0) 255)
(define (blue-fn x y r g b) (min 255 y))

;; remove-red : Image -> Image

(define (apply-blue-gradient img)
  (map3-image red-fn green-fn blue-fn img))



