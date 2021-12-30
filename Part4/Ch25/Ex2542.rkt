;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2542) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.2
Develop a function make-posns that takes in two lists of numbers, the
same length, and produces a list of posns with x coordinates taken from the first list, in
order, and y coordinates from the corresponding elements of the second list.|#

;; -- Data Definition

;; List-of-Numbers (LON) is one of:
;; - empty
;; - (cons number LON)
;; interp. LON is a list of numbers

;; -- Functions

;; make-posns : LON LON -> List-of-Posns
;; Given two lists of numbers, produces a list of posns
(check-expect (make-posns empty empty)
              empty)
(check-expect (make-posns (cons 1 (cons 2 empty)) (cons 3 (cons 4 empty)))
              (cons (make-posn 1 3) (cons (make-posn 2 4) empty)))
(check-error (make-posns (cons 1 (cons 2 empty)) (cons 3 empty))
              "make-posns: Given lists are not the same length.")

(define (make-posns lon1 lon2)
  (cond
    [(not (equal? (length lon1) (length lon2)))
     (error 'make-posns "Given lists are not the same length.")]
    [(empty? lon1) empty]
    [else
     (cons (make-posn (first lon1) (first lon2))
           (make-posns (rest lon1) (rest lon2)))])) 