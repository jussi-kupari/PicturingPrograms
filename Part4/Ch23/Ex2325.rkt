;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2325) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.2.5
; Develop a function fire-over-100K that takes in a list of employee structures and returns a list
; of those who earn at most $100,000/year, leaving out the ones who earn more. The remaining employees
; should be in the same order they were in before.

;; -- Data Definitions

(define-struct employee (name id salary))
;; Empoyee is (make-employee String Natural Number)
;; interp. Employee information with name, ID-number and salary  

;; LOE (List-Of-Employees) is one of:
;; - empty
;; - (cons employee LOE)
;; interp. a list of employees

;; -- Functions
(check-expect (fire-over-100k empty) empty)
(check-expect
 (fire-over-100k
  (cons (make-employee "Mark" 000 101000)
        (cons (make-employee "Amy" 001 99000) empty)))
 (cons (make-employee "Amy" 001 99000) empty))
(check-expect
 (fire-over-100k
  (cons (make-employee "Mark" 000 101000)
        (cons (make-employee "Amy" 001 99000)
              (cons (make-employee "Jack" 002 100000) empty))))
 (cons (make-employee "Amy" 001 99000)
       (cons (make-employee "Jack" 002 100000) empty)))

(define (fire-over-100k loe)
  (cond
    [(empty? loe) empty]
    [else
     (if (> (employee-salary (first loe)) 100000)
         (fire-over-100k (rest loe))
         (cons (first loe) (fire-over-100k (rest loe))))]))