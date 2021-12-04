;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2415) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.1.5
Re-write the copies function of Exercise 24.1.2 to take in a string
and an (ordinary) whole number.

Exercise 24.1.2
Develop a function copies that takes in a string and a built-whole,
and produces a list of that many copies of the string.|#

;; -- Data Definitions

;; LOS (List-Of-String) is one of:
;; - empty
;; (cons String LOS)
;; interp. a list of strings


;; -- Functions

;; copies : String Natural -> LOS
;; produces a LOS where the string is copied the times of the given natural
(check-expect (copies "a" 0) empty)
(check-expect (copies "a" 1) (cons "a" empty))
(check-expect (copies "a" 2) (cons "a" (cons "a" empty)))
(check-expect (copies "a" 3) (cons "a" (cons "a" (cons "a" empty))))

(define (copies s n)
  (cond
    [(zero? n) empty]
    [else
     (cons s (copies s (sub1 n)))]))