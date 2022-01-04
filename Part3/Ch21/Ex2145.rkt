;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2145) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.4.5
; Develop a function person=? that takes in two person structs and tells
; whether they have the exact same name and age. You may not use the built-in equal?
; function to solve this problem.
(require picturing-programs)

;; -- Data Definition

(define-struct person (name age))
;; Person is (make-person String Natural)
;; interp. a person with name and age

;; -- Functions

;; person=? : Person Person -> Boolean
;; Given two persons, produces true if the first is older

(check-expect (person=? (make-person "john" 45) (make-person "john" 45)) true)
(check-expect (person=? (make-person "john" 45) (make-person "mike" 45)) false)
(check-expect (person=? (make-person "john" 45) (make-person "john" 44)) false)
(check-expect (person=? (make-person "john" 45) (make-person "mike" 46)) false)

(define (person=? p1 p2)
  (and
   (string=? (person-name p1) (person-name p2))
   (= (person-age p1) (person-age p2))))