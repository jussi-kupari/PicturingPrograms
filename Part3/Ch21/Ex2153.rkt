;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2153) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.5.3
; Develop a function birthday that takes in a person struct and returns
; a person with the same first and last name, but one year older.


(define-struct person (first last age))
;; Person is (make-person String String Natural)
;; interp. a persons information


;; bithday : Person -> Person
;; Given a person, updates the age to +1 year older
(check-expect (birthday (make-person "john" "connor" 29))
              (make-person "john" "connor" 30))

(define (birthday p)
  (make-person (person-first p)
               (person-last p)
               (add1 (person-age p))))