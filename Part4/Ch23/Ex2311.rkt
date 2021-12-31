;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2311) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 23.1.1
; Develop a function add1-each that takes in a list of numbers and returns a list of numbers
; of the same length, with each element of the answer equal to 1 more than the corresponding
; element of the input. For example,
 
; (check-expect (add1-each (cons 3 (cons -12 (cons 7 empty))))
; (cons 4 (cons -11 (cons 8 empty))))

;; -- Data Definition

;; LOS (List-of-numbers) is one of:
;; - empty
;; - (cons Number LON)
;; interp. a list of numbers

;; -- Functions

;; add-each : LON -> LON
;; Given a list-of-numbers, produces the list with 1 added to each element
(check-expect
 (add1-each (cons 3 (cons -12 (cons 7 empty))))
 (cons 4 (cons -11 (cons 8 empty))))

(define (add1-each lon)
  (cond
    [(empty? lon) empty]
    [else
     (cons (add1 (first lon))
           (add1-each (rest lon)))]))