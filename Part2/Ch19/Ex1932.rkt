;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1932) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 19.3.2
; Modify the solution to Exercise 9.2.3 so that if the input is an empty
; string, it produces the error message
; "chop-first-char: can’t chop from an empty string"
; and never returns.


; Exercise 9.2.3 Develop a function chop-first-char that takes in a string and re-
; turns all but the first character. (For now, you may assume the string is non-empty; we’ll
; drop this assumption later.)


;; chop-first-char : String -> String
;; Given a non-empty string, produces the string without the first character
(check-expect (chop-first-char "jussi") "ussi") 

(define (chop-first-char s)
  (substring s 1))


;; chop-first-char.v2 : String -> String
;; Given a string, produces the string without the first character or a nice error
(check-expect (chop-first-char.v2 "jussi") "ussi") 
(check-error (chop-first-char.v2 "") "chop-first-char.v2: can’t chop from an empty string")

(define (chop-first-char.v2 s)
  (cond
    [(= (string-length s) 0) (error "chop-first-char.v2: can’t chop from an empty string")]
    [else (substring s 1)]))
