;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1573) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.7.3
; Develop a function make-shape that takes in three strings: a shape
; (either "circle" or "triangle"), a size (either "small", "medium", or "large"), and
; a color (any color that DrRacket recognizes), and produces an appropriate image.
; 
; Note: Make sure that a “medium circle” and a “medium triangle” are about the same
; size.

(require picturing-programs)

;; make-shape: String String String -> Image
;; Given the shape ("circle" or "triangle")
;; size ("small", "medium", or "large")
;; and color (any color)
;; produces the appropriate image


(define (make-shape shape size color)
  (cond
    [(string=? shape "circle")
     (cond
       [(string=? size "small") (circle 10 "solid" color)]
       [(string=? size "medium") (circle 50 "solid" color)]
       [(string=? size "large") (circle 250 "solid" color)])]
    [(string=? shape "triangle")
     (cond
       [(string=? size "small") (triangle 20 "solid" color)]
       [(string=? size "medium") (triangle 100 "solid" color)]
       [(string=? size "large") (triangle 500 "solid" color)])]))