;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2312) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.1.2
; Develop a function square-each that takes in a list of numbers and returns a
; list of their squares, in the same order.

;; -- Data Definition

;; LOS (List-of-numbers) is one of:
;; - empty
;; - (cons Number LON)
;; interp. a list of numbers

;; -- Functions

;; square-each : LON -> LON
;; Given a list-of-numbers, produces the list with the elements squared
(check-expect (square-each empty) empty)
(check-expect (square-each (cons 2 empty)) (cons 4 empty))
(check-expect (square-each (cons 2 (cons 3 empty))) (cons 4 (cons 9 empty)))

(define (square-each lon)
  (cond
    [(empty? lon) empty]
    [else
     (cons (sqr (first lon))
           (square-each (rest lon)))]))