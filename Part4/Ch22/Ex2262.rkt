;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2262) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.6.2
; Develop a function any-over-100K? that takes in a list of employee
; structures (from Exercise 21.2.1) and tells whether any of them earn over $100,000 per
; year.

;; -- Data Definitions

(define-struct employee (name id salary))
;; Empoyee is (make-employee String Natural Number)
;; interp. Employee information with name, ID-number and salary

;; LOE (ListOfEmployees) is one of:
;; - empty
;; (cons employee LOE)
;; interp. a list of employees

;; -- Functions

;; any-over-100K? : LOE -> Boolean
;; Given a LOE, produces true if any of the employees earn >100K USD
(check-expect
 (any-over-100K? empty)
 false)
(check-expect
 (any-over-100K? (cons
                  (make-employee "john connor" 0000 99000) empty))
 false)
(check-expect
 (any-over-100K? (cons (make-employee "john connor" 0000 99000)
                       (cons (make-employee "tina turner" 0001 100000) empty)))
 false)
(check-expect
 (any-over-100K? (cons (make-employee "john connor" 0000 99000)
                       (cons (make-employee "tina turner" 0001 100000)
                             (cons (make-employee "mike weir" 0005 110000) empty))))
 true)

(define (any-over-100K? loe)
  (cond
    [(empty? loe) false]
    [else (if (> (employee-salary (first loe)) 100000)
              true
              (any-over-100K? (rest loe)))]))