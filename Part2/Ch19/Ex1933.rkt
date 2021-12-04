;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1933) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 19.3.3
; Modify the solution to Exercise 9.2.4 so that if the input is an empty
; string, it produces the error message
; "first-char: can’t get first character of an empty string"
; and never returns.



; Exercise 9.2.4 Develop a function first-char that takes in a string and returns a
; string of length 1, containing just the first character of the given string. (For now, you
; may assume the string is non-empty; we’ll drop this assumption later.)


;; first-char : String -> String
;; Given a string, produces the first character of the string
(check-expect (first-char "jussi") "j")

(define (first-char s)
  (substring s 0 1))

;; first-char.v2 : String -> String
;; Given a string, produces the first character of the string
(check-expect
 (first-char.v2 "jussi") "j")
(check-error
 (first-char.v2 "") "first-char: can’t get first character of an empty string")

(define (first-char.v2 s)
  (cond
    [(= (string-length s) 0)
     (error "first-char: can’t get first character of an empty string")]
    [else (substring s 0 1)]))