;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex22511) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.11
; Develop a function multiply-all that takes in a list of numbers and returns the result
; of multiplying them all together.
; 
; For example,
; (check-expect (multiply-all (cons 3 (cons 5 (cons 4 empty)))) 60)
; 
; Hint: What is the “right answer” for the empty list? It may not be what you think at
; first! <- answer seems to be 1


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

;; multiply-all : LON -> Number
;; Given a LON, produces the total multiplied value of the numbers
(check-expect (multiply-all empty) 1)
(check-expect (multiply-all (cons 1 empty)) 1)
(check-expect (multiply-all (cons 1 (cons 2 empty))) 2)
(check-expect (multiply-all (cons 2 (cons 2 (cons 5 empty)))) 20)
(check-expect (multiply-all (cons 3 (cons 5 (cons 4 empty)))) 60)

(define (multiply-all lon)
  (cond
    [(empty? lon) 1]
    [else (* (first lon) (multiply-all (rest lon)))]))
