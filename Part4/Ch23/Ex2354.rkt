;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2354) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.5.4
Develop a function named ubby-dubby which translates a given string into “ubby-dubby talk”.
This is defined as follows: insert the letters “ubb” in front of each vowel in the original string.

For example,
(check-expect (ubby-dubby "hello there")
"hubbellubbo thubberubbe")

You may assume for simplicity that all the letters are lower-case. You may find it
useful to write a vowel? helper function.|#

;; ubby-dubby : String -> String
;; Given a string, produces the string with "ubb" placed in the front
(check-expect (ubby-dubby "abc") "ubbabc")

(define (ubby-dubby s)
  (cond
    [(zero? (string-length s)) ""]
    [else
     (string-append (if (vowel? (string-ith s 0))
                        (string-append "ubb" (string-ith s 0))
                        (string-ith s 0))
                    (ubby-dubby (substring s 1)))]))

;; vowel? : 1String -> Boolean
;; Given a string (length of one), produces true if it is a vowel.
(check-expect (vowel? "a") true)
(check-expect (vowel? "r") false)

(define (vowel? s)
  (or (equal? s "a")
      (equal? s "e")
      (equal? s "i")
      (equal? s "o")
      (equal? s "u")
      (equal? s "y")
      (equal? s "ä")
      (equal? s "ö")))