;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2314) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.1.4
; Develop a function salaries that takes in a list of employee structures
; (from Exercise 21.2.1) and returns a list containing only their salaries, in the same
; order.

;; -- Data Definitions

(define-struct employee (name id salary))
;; Empoyee is (make-employee String Natural Number)
;; interp. Employee information with name, ID-number and salary

;; LOE (List-Of-Employees) is one of:
;; - empty
;; - (cons Employee LOE)
;; interp. a list of employees

;; LOS (List-of-numbers) is one of:
;; - empty
;; - (cons Number LON)
;; interp. a list of numbers

;; -- Functions

;; salaries : LOE -> LON
;; Given a List-Of-Employees, produces a corresponding list of their salaries (LON)
(check-expect
 (salaries empty)
 empty)
(check-expect
 (salaries (cons (make-employee "Joe" 0001 10000) empty))
 (cons 10000 empty))
(check-expect
 (salaries (cons (make-employee "Joe" 0001 10000) (cons (make-employee "Amy" 0002 12000) empty)))
 (cons 10000 (cons 12000 empty)))

(define (salaries loe)
  (cond
    [(empty? loe) empty]
    [else
     (cons (employee-salary (first loe))
           (salaries (rest loe)))]))