;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1582) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.8.2
; Define a function named size that takes in a number, a string, or
; an image, and returns “how big it is”. For a number, this means
; the absolute value of the number. For a string, it means the length
; of the string. For an image, it means the number of pixels,
; i.e. the width times the height.

(require picturing-programs)

;; size: Number|String|Image -> number
;; Given a number string or an image
;; produces the absolute value, length or number of pixels, respectively
(check-expect (size 10) 10)
(check-expect (size -145) 145)
(check-expect (size "string") (string-length "string"))
(check-expect (size (square 10 "solid" "red")) 100) 

(define (size i)
  (cond
    [(number? i) (abs i)]
    [(string? i) (string-length i)]
    [(image? i) (* (image-width i) (image-height i))]))