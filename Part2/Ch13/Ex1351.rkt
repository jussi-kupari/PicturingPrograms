;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1351) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 13.5.1
; Develop a function is-green-triangle? that takes in an image
; and tells whether it is exactly (triangle 10 "solid" "green").

(require picturing-programs)

;; Image -> Boolean
;; Given an image, produces true if the image is exactly (triangle 10 "solid" "green")
(check-expect (is-green-triangle? (circle 0 "solid" "green")) false)
(check-expect (is-green-triangle? (triangle 10 "solid" "green")) true)

(define (is-green-triangle? img)
  (image=? img (triangle 10 "solid" "green")))