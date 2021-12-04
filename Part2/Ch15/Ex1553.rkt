;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1553) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.5.3
; Develop a function named letter-grade that takes in a grade
; average on a 100-point scale and returns one of the strings
; 
; "A", "B", "C", "D", or "F",
; 
; according to the rule
; 
; • An average of 90 or better is an A;
; • An average of at least 80 but less than 90 is a B;
; • An average of at least 70 but less than 80 is a C;
; • An average of at least 60 but less than 70 is a D;
; • An average of less than 60 is an F.


;; Natural -> String
;; Given a number grade (Natural) (0, 100), produces the letter grade
(check-expect (letter-grade 59) "F")
(check-expect (letter-grade 60) "D")
(check-expect (letter-grade 69) "D")
(check-expect (letter-grade 70) "C")
(check-expect (letter-grade 79) "C")
(check-expect (letter-grade 80) "B")
(check-expect (letter-grade 89) "B")
(check-expect (letter-grade 90) "A")

(define (letter-grade g)
  (cond
    [(> g 89) "A"]
    [(> g 79) "B"]
    [(> g 69) "C"]
    [(> g 59) "D"]
    [else "F"]))