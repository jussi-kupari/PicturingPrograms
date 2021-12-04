;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2263) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.6.3
; Develop a function lookup-by-name that takes in a string and a list of employee structures
; (from Exercise 21.2.1) and returns the first one whose name matches the string.
; If there is none, it should return false.


;; -- Data Definitions

(define-struct employee (name id salary))
;; Empoyee is (make-employee String Natural Number)
;; interp. Employee information with name, ID-number and salary

;; LOE (ListOfEmployees) is one of:
;; - empty
;; (cons employee LOE)
;; interp. a list of employees


;; -- Functions

;; lookup-by-name : String LOE -> Employee
;; Given a name and a LOE, produces the first employee that matches the name (if no match, false)
(check-expect
 (lookup-by-name "john connor" empty)
 false)
(check-expect
 (lookup-by-name "john connor" (cons (make-employee "john connor" 0000 99000)
                                     (cons (make-employee "tina turner" 0001 100000) empty))) (make-employee "john connor" 0000 99000))
(check-expect
 (lookup-by-name "tina turner" (cons (make-employee "john connor" 0000 99000)
                                     (cons (make-employee "tina turner" 0001 100000) empty))) (make-employee "tina turner" 0001 100000))
(check-expect
 (lookup-by-name "robert smith" (cons (make-employee "john connor" 0000 99000)
                                      (cons (make-employee "tina turner" 0001 100000) empty))) false)

(define (lookup-by-name name loe)
  (cond
    [(empty? loe) false]
    [else (if (string=? name (employee-name (first loe)))
              (first loe)
              (lookup-by-name name (rest loe)))]))