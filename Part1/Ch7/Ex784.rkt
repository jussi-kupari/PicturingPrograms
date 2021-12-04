;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex784) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.8.4
; Build a rectangle, 100 x 100, which shades smoothly from red
; at the left edge to green at the right edge.
; 
; .


(require picturing-programs)

;red
(define (red-fn x y)
  (real->int (- 250 (* 2.5 x))))

;green
(define (green-fn x y)
  (real->int (* 2.5 x)))

;blue
(define (blue-fn x y) 0)

(build3-image 100 100 red-fn green-fn blue-fn)