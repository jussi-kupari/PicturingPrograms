;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2121) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 21.2.1
; Define a data type to represent an employee of a business,
; including the employee’s name (we won’t bother with first and last names), ID number,
; and salary.

(define-struct employee (name id salary))
;; Empoyee is (make-employee String Natural Number)
;; interp. Employee information with name, ID-number and salary  

(define EMP (make-employee "John Connor" 42321 55000))
(make-employee "Joe" 348 42995)
(make-employee "Mary" 214 49500)
(define emp1 (make-employee "Bob" 470 36000))
(define emp2 (make-employee "Chris" 471 41000))
(check-expect (employee-name emp1) "Bob")
(check-expect (employee-id emp2) 471)
(check-expect (employee-salary emp2) 41000)
(check-expect (employee-salary (make-employee "Mary" 214 49500)) 49500)
(check-expect (employee? emp1) true)
(check-expect (employee? "Mary") false)

#;
(define (fn-for-employee b)
  (... (employee-name b)     ;String
       (employee-id b)       ;Natural
       (employee-salary b))) ;Number

;; Template rules used:
;;  - compound: 3 fields

;; The input template is
#|
(check-expect (function-on-employee emp1) ...)
(check-expect (function-on-employee
(make-employee "Joe" 348 42995))
...)
(define (function-on-employee emp)
; emp an employee
; (employee-name emp) a string
; (employee-id emp) a number
; (employee-salary emp) a number
...)
|#

;; and the output template
#|
(check-expect (function-returning-employee ...) emp1)
(check-expect (function-returning-employee ...)
(make-employee "Joe" 348 42995))
(define (function-returning-employee ...)
(make-employee ... ... ...) ; name, id, salary
)
|#