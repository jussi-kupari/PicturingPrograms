;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2351) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.5.1
Develop a function string-reverse that takes in a string and re-
turns a string of the same characters in reverse order.|#

;; string-reverse : String -> String
;; Given a string, produces the string in reverse order of characters
(check-expect (string-reverse "abcdefg") "gfedcba")

(define (string-reverse s)
  (list->string
   (reverse
    (string->list s))))
