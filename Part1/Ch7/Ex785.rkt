;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex785) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.8.5
; Build a rectangle, 100 x 100, which shades smoothly from black
; at the top-left corner to yellow (i.e. red plus green) at the bottom-
; right corner. Every point along the diagonal from top-right to
; bottom-left should be the same color.
; 
; .


(require picturing-programs)

;red
(define (red-fn x y)
  (real->int (+ (* x 1.25) (* y 1.25))))

;green
(define (green-fn x y)
  (real->int (+ (* x 1.25) (* y 1.25))))

;blue
(define (blue-fn x y) 0)

(build3-image 100 100 red-fn green-fn blue-fn)