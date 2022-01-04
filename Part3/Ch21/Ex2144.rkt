;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2144) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.4.4
; Develop a function older? that takes in two person structs and tells
; whether the first is older than the second.
(require picturing-programs)

;; -- Data Definition

(define-struct person (name age))
;; Person is (make-person String Natural)
;; interp. a person with name and age

;; -- Functions

;; older? : Person Person -> Boolean
;; Given two persons, produces true if the first is older

(check-expect (older? (make-person "john" 45) (make-person "mike" 45)) false)
(check-expect (older? (make-person "john" 45) (make-person "mike" 44)) true)
(check-expect (older? (make-person "john" 45) (make-person "mike" 46)) false)

(define (older? p1 p2)
  (> (person-age  p1) (person-age  p2)))