;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2315) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.1.5
; Develop a function give-10%-raises that takes in a list of employee structures and returns
; a list of the same employees, but each earning 10% more than before.

;; -- Data Definitions

(define-struct employee (name id salary))
;; Empoyee is (make-employee String Natural Number)
;; interp. Employee information with name, ID-number and salary

;; LOE (List-Of-Employees) is one of:
;; - empty
;; - (cons Employee LOE)
;; interp. a list of employees

;; -- Functions

;; give-10%-raises : LOE -> LOE
;; Given a list-of-employees, produces the list with 10% raise in each employee's salary
(check-expect (give-10%-raises empty) empty)
(check-expect
 (give-10%-raises (cons (make-employee "Joe" 0001 10000)
                        (cons (make-employee "Amy" 0002 12000) empty)))
 (cons (make-employee "Joe" 0001 11000)
       (cons (make-employee "Amy" 0002 13200) empty)))

(define (give-10%-raises loe)
  (cond
    [(empty? loe) empty]
    [else
     (cons (make-employee (employee-name (first loe))
                          (employee-id (first loe))
                          (* 1.1 (employee-salary (first loe))))
           (give-10%-raises (rest loe)))]))