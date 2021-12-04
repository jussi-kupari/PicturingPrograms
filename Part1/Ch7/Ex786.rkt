;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex786) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.8.6
; Build a rectangle, 100 x 100, which is yellow (i.e. red plus
; green) in the top-right and bottom-left corners, and black along
; the diagonal from top-left to bottom-right.
; 
; .


(require picturing-programs)

;red
(define (red-fn x y)
  (real->int (abs (* 2.55 (- x y)))))

;green
(define (green-fn x y)
  (real->int (abs (* 2.55 (- x y)))))

;blue
(define (blue-fn x y) 0)

(build3-image 100 100 red-fn green-fn blue-fn)