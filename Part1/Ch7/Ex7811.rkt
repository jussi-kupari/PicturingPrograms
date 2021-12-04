;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex7811) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.8.11
; Define a function convert-to-gray that takes in an image and returns the
; same image in gray-scale. That is, every pixel should have red, green, and blue
; components equal to one another. However, the total amount of color at each pixel
; should be roughly the same as the total amount of color at that point in the original
; picture.

(require picturing-programs)


;; gray-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the grey at the xy
(check-expect (gray-fn 10 20 30 40 50) (round (/ (+ 50 40 30) 3)))
(check-expect (gray-fn 1000 100 250 125 0) (round (/ (+ 250 125 0) 3)))
(define (gray-fn x y r g b)
  (round (/ (+ r g b) 3)))


;; convert-to-gray : Image -> Image
;; Given an image, produces the image in gray-scale

(define (convert-to-gray img)
  (map3-image gray-fn gray-fn gray-fn img))
