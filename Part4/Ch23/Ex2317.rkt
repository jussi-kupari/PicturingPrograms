;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2317) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.1.7
; Develop a function list-each that takes in a list (of numbers, strings, it doesn’t matter)
; and returns a list of one-element lists, each containing a different one of the elements in
; the original list. For example,
; 
; (check-expect (list-each (cons "a" (cons "b" empty)))
; (cons (cons "a" empty) (cons (cons "b" empty) empty)))



;; -- Data Definitions

;; LOO (List-Of-Objects) is one of:
;; - empty
;; - (cons Employee LOO)
;; interp. a list of objects

;; LOLOO (List-of-LOO) is one of:
;; - empty
;; - (cons LOO LOLOO)

;; -- Functions

;; list-each : LOO -> LOLOO
;; Given a list-of-objects, produces the list with each element in its own list.
(check-expect (list-each empty) empty)
(check-expect (list-each (cons "a" (cons "b" empty)))
              (cons (cons "a" empty) (cons (cons "b" empty) empty)))

(define (list-each loo)
  (cond
    [(empty? loo) empty]
    [else
     (cons (cons (first loo) empty)
           (list-each (rest loo)))]))
