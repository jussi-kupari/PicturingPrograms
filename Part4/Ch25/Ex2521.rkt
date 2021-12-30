;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2521) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Worked Exercise 25.2.1
Develop a function pay-list that takes in two lists: one specifies the number
of hours worked by each of a bunch of employees, and the other specifies the
corresponding hourly wage for each of those employees. It should produce a list
of the amounts each employee should be paid, in the same order.|#

;; -- Data Definition

;; List-of-Numbers (LON) is one of:
;; - empty
;; - (cons number LON)
;; interp. a list of numbers

#| Template for LON
(define (fn-for-lon lon)
  (cond
    [(empty? lon) ...]
    [else
     ... (fi-for-lon (rest lon))]))|#

;; pay-list : LON LON -> LON
;; Given a list of hours and a list of wages, produces a list of due payments for each employee.
;; ASSUME the two lists are of equal length
(check-error
 (pay-list empty (cons 15 empty))
 "pay-list: The lengths of the two list do not match.")
(check-expect
 (pay-list empty empty)
 empty)
(check-expect
 (pay-list (cons 30 empty) (cons 8 empty))
 (cons 240 empty))
(check-expect
 (pay-list (cons 30 (cons 20 (cons 45 empty))) (cons 8 (cons 10 (cons 10 empty))))
 (cons 240 (cons 200 (cons 450 empty))))

(define (pay-list lon1 lon2)
  (cond
    [(not (equal? (length lon1) (length lon2)))
     (error 'pay-list "The lengths of the two list do not match.")]
    [(empty? lon1) empty]
    [else
     (cons (* (first lon1) (first lon2))
           (pay-list (rest lon1) (rest lon2)))]))