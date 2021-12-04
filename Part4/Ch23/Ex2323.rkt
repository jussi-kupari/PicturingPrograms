;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2323) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.2.3
; Develop a function remove-first that takes in a string and a list of strings, and returns the same list but
; with the first occurrence (if any) of the given string removed.


;; -- Data Definitions

;; LOS (List-Of-Strings) is one of:
;; - empty
;; - (cons String LOS)
;; interp. a list of strings

;; -- Functions

;; remove-first : String LOS -> LOS
;; Given a string and a LOS, produces the LOS with the first instance of the string removed.
(check-expect (remove-first "a" empty) empty)
(check-expect (remove-first "a" (cons "a" (cons "b" (cons "c" empty)))) (cons "b" (cons "c" empty)))
(check-expect (remove-first "b" (cons "a" (cons "b" (cons "c" empty)))) (cons "a" (cons "c" empty)))


(define (remove-first s los)
  (cond
    [(empty? los) los]
    [else (if (string=? (first los) s)
              (rest los)
              (cons (first los) (remove-first s (rest los))))]))