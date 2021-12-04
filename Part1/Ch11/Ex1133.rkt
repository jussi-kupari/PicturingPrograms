;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1133) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 11.3.3
; Develop a function cylinder-area that takes in the radius and
; height of a cylinder, and computes its area.
; 
; Hint: The area includes the vertical sides and both ends.


;; Number Number -> Number
;; Given the radius and height of a cylinder, and computes its area

(define (cyl-area r h)
  (+ (* (circle-area r) 2) (cyl-body-area h r)))


;; Number -> Number
;; Given radius of a circle, produces the area

(define (circle-area r)
  (* r r pi))

;; Number -> Number
;; Given the height and radius of a cylinder, produces the area of its body

(define (cyl-body-area h r)
  (* h (circle-perimeter r)))


;; Number -> Number
;; Given the radius of a circle, produces the perimeter length

(define (circle-perimeter r)
  (* 2 pi r))