;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2113) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 21.1.3
; Define a structure to represent a person, with first and last
; names and age.

(define-struct person (first last age))
;; Person is (make-person String String Natural)
;; interp. a person with first-name, last-name and age  

(define PERSON (make-person "John" "Connor" 42))

(person-first PERSON) ;"John"
(person-last PERSON)  ;"Connor"
(person-age PERSON)   ;42
(person? PERSON)      ;true