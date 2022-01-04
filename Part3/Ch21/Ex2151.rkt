;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2151) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 21.5.1
; Define a function change-salary that takes in an employee
; (from Exercise 21.2.1) and a number, and produces a new employee just like the old one
; but with the salary changed to the specified number.
(require picturing-programs)

(define-struct employee (name id salary))
;; Empoyee is (make-employee String Natural Number)
;; interp. Employee information with name, ID-number and salary  

;; change-salary : Employee Number -> Employee
;; Given Employee and a Salary, produces the employee-ifo with the new salary
(check-expect
 (change-salary (make-employee "John Connor" 0000 3400) 3600)
 (make-employee "John Connor" 0000 3600))

(define (change-salary emp n)
  (make-employee (employee-name emp) (employee-id emp) n))
