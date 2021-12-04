;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2414) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.1.4
Re-write the spams function of Exercise 24.1.1 to work on
ordinary, built-in whole numbers.

Exercise 24.1.1
Develop a function spams that takes in a built-whole and
returns a list with that many copies of the string "spam".|#

;; -- Data Definitions

;; LOS (List-Of-String) is one of:
;; - empty
;; (cons String LOS)
;; interp. a list of strings


;; -- Functions

;; copies : String Natural -> LOS
;; produces a LOS where the string is copied the times of the given natural
(check-expect (copies 0) empty)
(check-expect (copies 1) (cons "spam" empty))
(check-expect (copies 2) (cons "spam" (cons "spam" empty)))
(check-expect (copies 3) (cons "spam" (cons "spam" (cons "spam" empty))))

(define (copies n)
  (cond
    [(zero? n) empty]
    [else
     (cons "spam" (copies (sub1 n)))]))