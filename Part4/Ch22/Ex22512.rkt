;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex22512) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.12
; A “dollar store” used to mean a store where everything cost less than a dollar.
; Develop a function dollar-store? that takes in a list of numbers (the prices
; of various items), and tells whether the store qualifies as a “dollar store”.

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

;; dollar-store? : LON -> Boolean
;; Given a LON, produces true if all numbers are < 1 (USD)
(check-expect (dollar-store? empty) true)
(check-expect (dollar-store? (cons 1 empty)) false)
(check-expect (dollar-store? (cons 0.99 empty)) true)
(check-expect (dollar-store? (cons 0.99 (cons 0.5 (cons 0.7 empty)))) true)
(check-expect (dollar-store? (cons 0.99 (cons 0.5 (cons 1 empty)))) false)

(define (dollar-store? lon)
  (cond
    [(empty? lon) true]
    [else (if (< 0 (first lon) 1)
              (dollar-store? (rest lon))
              false)]))