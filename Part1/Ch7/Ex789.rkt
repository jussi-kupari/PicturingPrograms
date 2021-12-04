;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex789) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.8.9
; Define a function remove-red that takes in an image and returns the
; same image with all the red removed.
; 
; Hint: For this exercise, and most of the exercises in this section,
; there is no easy way to build “the right answer” other than the function
; itself. So I suggest describing the right answer in English, rather than
; using check-expect. You still need to write test cases, you just need to
; check them by eye rather than relying on check-expect.

(require picturing-programs)


;; red-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the red at the xy
(check-expect (red-fn 10 20 30 40 50) 0)
(check-expect (red-fn 1000 100 250 125 0) 0)
(define (red-fn x y r g b) 0)


;; green-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the green at the xy
(check-expect (green-fn 10 20 30 40 50) 40)
(check-expect (green-fn 1000 100 250 125 0) 125)
(define (green-fn x y r g b) g)


;; blue-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the blue at the xy
(check-expect (blue-fn 10 20 30 40 50) 50)
(check-expect (blue-fn 1000 100 250 125 0) 0)
(define (blue-fn x y r g b) b)

;; remove-red : Image -> Image
;; Given an image, produces the image with all red color removed
(check-expect (remove-red (circle 50 "solid" "red")) (circle 50 "solid" "black"))
(check-expect (remove-red (circle 50 "solid" "blue")) (circle 50 "solid" "blue"))

(define (remove-red img)
  (map3-image red-fn green-fn blue-fn img))