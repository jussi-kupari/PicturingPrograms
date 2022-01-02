;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2251) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 22.5.1
; Define a data type list-of-numbers (or lon for short), including a template for
; functions operating on lists of numbers.
 
; Develop a function count-numbers that takes in a list of numbers and returns a number.

;; -- Data Definition

;; LON (ListOfNumbers) is one of:
;; - empty
;; - (cons Number LON)
;; interp. a list of numbers

(define LON1 empty)
(define LON2 (cons 1 empty))
(define LON3 (cons 1 (cons 2 empty)))

;; template
#;
(define (fn-for-lon lon)
  (cond
    [(empty? lon) (...)]
    [else (... (first lon)
          ... (fn-for-lon (rest lon)))]))

;; -- Functions

;; count-numbers : LON -> Number
;; Given a LON, produces the count of numbers
(check-expect (count-numbers empty) 0)
(check-expect (count-numbers (cons 1 empty)) 1)
(check-expect (count-numbers (cons 1 (cons 2 empty))) 2)

(define (count-numbers lon)
  (cond
    [(empty? lon) 0]
    [else (add1 (count-numbers (rest lon)))]))