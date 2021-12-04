;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1715) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 17.1.5
; Develop an animation that cycles among three shapes — a green
; circle, a yellow triangle, and a blue square — every time the
; mouse is moved or clicked.
; 
; Try to make all three shapes approximately the same size.

(require picturing-programs)


;; -- Constants

;circle
(define CIRCLE (circle 30 "solid" "green"))

;triangle
(define TRIANGLE (triangle 60 "solid" "yellow"))

;suqare
(define SQUARE (square 60 "solid" "blue"))



;; -- Data Definition

;; Shape is an image: one of CIRCLE, TRIANGLE, SQUARE


;; -- Functions

;; main : Shape -> Shape
(define (main s)
  (big-bang s
    (check-with image?)
    (on-mouse next-shape)
    (to-draw render-shape)))

;; next-shape : Shape -> Shape
(check-expect (next-shape CIRCLE 0 0 "move") TRIANGLE)
(check-expect (next-shape TRIANGLE 0 0 "move") SQUARE)
(check-expect (next-shape SQUARE 0 0 "move") CIRCLE)

(define (next-shape s x y me)
  (cond
    [(image=? s CIRCLE) TRIANGLE]
    [(image=? s TRIANGLE) SQUARE]
    [(image=? s SQUARE) CIRCLE]))


;; render-shape : Shape -> Shape
(check-expect (render-shape CIRCLE) CIRCLE)
(check-expect (render-shape TRIANGLE) TRIANGLE)
(check-expect (render-shape SQUARE) SQUARE)

(define (render-shape s)
  s)