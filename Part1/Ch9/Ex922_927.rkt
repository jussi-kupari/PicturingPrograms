;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex922_927) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 9.2.2 Develop a function named repeat that takes in a string and
; returns that string appended to itself
; (i.e. the resulting string is twice as long).

(require picturing-programs)

;; String -> String
;; Given a string, produces the string appended to itself
(check-expect (repeat "") "")
(check-expect (repeat " ") "  ")
(check-expect (repeat "jussi") "jussijussi")

(define (repeat s)
  (string-append s s))

; Exercise 9.2.3 Develop a function chop-first-char that takes in a string
; and returns all but the first character. (For now, you may assume the
; string is non-empty we’ll drop this assumption later.)

;; String -> String
;; Given a non-empty string, produces the string without the first character
(check-expect (chop-first-char "jussi") "ussi") 

(define (chop-first-char s)
  (substring s 1))

; Exercise 9.2.4 Develop a function first-char that takes in a string and
; returns a string of length 1, containing just the first character of the
; given string. (For now, you may assume the string is non-empty. We’ll
; drop this assumption later.)

;; String -> String
;; Given a string, produces the first character of the string
(check-expect (first-char "jussi") "j")

(define (first-char s)
  (substring s 0 1))

; Exercise 9.2.5 Develop a function named last-half that takes in a string
; and returns the last half of it.
; Hint: Be sure to test your program on both even-length and odd-length
; strings. Also try some special cases like the empty string, "".

;; String -> String
;; Given a String, produces a string of the last half of it.
(check-expect (last-half "abc") "c")
(check-expect (last-half "abcd") "cd")

(define (last-half s)
  (substring s (round (/(string-length s) 2))))

; Exercise 9.2.6 Develop a function named first-half that takes in a string
; and returns the first half of it. What happens if you concatenate the
; first-half of a string to the last-half of the same string? What should
; happen? Again, be sure to test this on both even-length and odd-length
; strings, and on the empty string.

;; String -> String
;; Given a String, produces a string of the first half of it.
(check-expect (first-half "abcabc") "abc")
(check-expect (first-half "abcabcd") "abca")

(define (first-half s)
  (substring s 0 (round (/(string-length s) 2))))

(string-append (first-half "jussi")
               (last-half "jussi"))

; Exercise 9.2.7 Develop a function named number->image that takes in a
; number and returns an image of that number in (say) 18-point blue font.
; Hint: Combine the built-in functions text and number->string.

;; Number -> Image
;; Given a number, produces a text-image of that string

(define (number->image n)
  (text (number->string n) 18 "blue"))
