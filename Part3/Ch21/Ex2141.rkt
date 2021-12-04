;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2141) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise
; 21.4.1 Define a function that takes in an employee (from Exercise 21.2.1)
; and tells whether or not the employee earns over $100,000 per year.


(define-struct employee (name id salary))
;; Empoyee is (make-employee String Natural Number)
;; interp. Employee information with name, ID-number and salary


;; more-than-100k? : Employee -> Boolean
;; Given employee, produces true if mothly salary yields over 100,000$ in a year

(check-expect (more-than-100k? (make-employee "james may" 0000 3200)) false)
(check-expect (more-than-100k? (make-employee "james brown" 0001 8333.3333)) false)
(check-expect (more-than-100k? (make-employee "james hetfield" 0001 8333.34)) true)
(check-expect (more-than-100k? (make-employee "prince" 0002 8500)) true)

(define (more-than-100k? emp)
  (> (* (employee-salary emp) 12) 100000))