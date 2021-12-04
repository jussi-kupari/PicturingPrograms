;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex22510) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.10
; Develop a function convert-reversed that takes in a list of numbers. You may assume that
; all the numbers are integers in the range 0-9, i.e. decimal digits. The function should
; interpret them as digits in a decimal number, ones place first
; (trust me, this actually makes the problem easier!), and returns the number they represent.
; For example,
; (check-expect
; (convert-reversed (cons 3 (cons 0 (cons 2 (cons 5 empty)))))
; 5203)
; 
; Do not use the built-in string->number function for this exercise.


;; -- Data Definition

;; LON (ListOfNumbers) is one of:
;; - empty
;; - (cons Number LON)
;; interp. a list of numbers

(define LON1 empty)
(define LON2 (cons 1 empty))
(define LON3 (cons 1 (cons 2 empty)))

;; template
#;
(define (fn-for-lon lon)
  (cond
    [(empty? lon) (...)]
    [else (... (first lon)
               ... (fn-for-lon (rest lon)))]))

;; -- Functions

;; convert-reversed : LON -> Natural
;; Given a LON, produces a natural number by summing multiples of the numbers
(check-expect
 (convert-reversed (cons 3 (cons 0 (cons 2 (cons 5 empty))))) 5203)

(define (convert-reversed lon)
  (cond
    [(empty? lon) 0]
    [else
     (+ (first lon) (* 10 (convert-reversed (rest lon))))]))

(convert-reversed (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 empty))))))






