;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2155) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.5.5
; Develop a function raise-salary-percent that takes in an employee structure
; and a number, and produces a copy of the employee with the specified percentage
; increase in salary.

(define-struct employee (name id salary))
;; Empoyee is (make-employee String Natural Number)
;; interp. Employee information with name, ID-number and salary  

;; raise-salary-percent : Employee Number -> Employee
;; Given an employee and a percentage, increases the salary by that percentage
(check-expect
 (raise-salary-percent (make-employee "jill" 001 2000) 7)
 (make-employee "jill" 001 (* 1.07 2000)))

(define (raise-salary-percent emp n)
  (make-employee
   (employee-name emp)
   (employee-id emp)
   (* (+ 1 (/ n 100)) (employee-salary emp))))