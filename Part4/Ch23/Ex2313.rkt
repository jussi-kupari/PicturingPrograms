;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2313) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.1.3
; Develop a function string-lengths that takes in a list of strings
; and returns a list of their (numeric) lengths, in the same order.


;; -- Data Definition

;; LOS (List-Of-String) is one of:
;; - empty
;; - (cons String LOS)
;; interp. a list of strings


;; -- Functions

;; string-lengths : LOS -> LOS
;; Given a list-of-strings, produces a corresponding list of string lengths
(check-expect (string-lengths empty) empty)
(check-expect (string-lengths (cons "a" empty)) (cons 1 empty))
(check-expect (string-lengths (cons "a" (cons "ab" empty))) (cons 1 (cons 2 empty)))
(check-expect (string-lengths (cons "a" (cons "ab" (cons "abcde" empty)))) (cons 1 (cons 2 (cons 5 empty))))

(define (string-lengths los)
  (cond
    [(empty? los) empty]
    [else
     (cons (string-length (first los))
           (string-lengths (rest los)))]))
