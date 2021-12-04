;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex782) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.8.2
; Build a rectangle, 50 x 50, which shades smoothly from black at the top-
; left corner to purple (i.e. red plus blue) in the bottom-right corner. The top-right corner
; should be blue, and the bottom-left corner red.

(require picturing-programs)

;red
(check-expect (red-fn 0 50) 250)
(check-expect (red-fn 50 20) 100)

(define (red-fn x y)
  (* 5 y))

;green
(check-expect (green-fn 200 50) 0)
(check-expect (green-fn 50 20) 0)

(define (green-fn x y) 0)

;blue
(check-expect (blue-fn 50 0) 250)
(check-expect (blue-fn 20 20) 100)

(define (blue-fn x y)
  (* 5 x))

(build3-image 50 50 red-fn green-fn blue-fn)