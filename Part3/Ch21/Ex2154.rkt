;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2154) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.5.4
; Develop a function change-name-to-match that takes in two person
; structs and returns a person just like the first one, but with the
; last name changed to match the second one.


(define-struct person (first last age))
;; Person is (make-person String String Natural)
;; interp. a persons information



;; change-name-to-match : Person Person -> Person
;; Given two persons, produces the first person with the last name of the second person

(check-expect
 (change-name-to-match (make-person "john"  "smith" 29 )
                       (make-person "rachel"  "timmons" 27 ))
 (make-person "john" "timmons" 29))

(define (change-name-to-match p1 p2)
  (make-person (person-first p1)
               (person-last p2)
               (person-age p1)))