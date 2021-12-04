;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1134) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 11.3.4
; Develop a function pipe-area that takes in the inner radius of a
; pipe, the length of the pipe, and the thickness of the walls, and computes its area.
; 
; Hint: The area includes the inner surface, the outer surface, and the narrow top and
; bottom.



;; Number Number Number -> Number
;; Given the inner radius, length, and the thickness of the walls of a pipe
;; computess the area area

(define (area-of-pipe r l t)
  (+ (* (area-of-ring r t) 2) (pipe-body-area r t l)))

;; Number Number -> Number
;; Given the inner radius and thickness of a pipe and its length
;; produces the area of its body

(define (pipe-body-area r t l)
  (+ (cyl-body-area r l) (cyl-body-area (+ r t) l)))

;; Number -> Number
;; Given the inner radius and thickness of a circle, produces the area of the circle

(define (area-of-ring r t)
  (- (circle-area (+ r t)) (circle-area r)))


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