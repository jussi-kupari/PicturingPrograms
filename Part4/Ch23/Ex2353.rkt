;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2353) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.5.3
Develop a function replace-char that takes in a character and two
strings (replacement and target). It returns a string formed by replacing each occurrence
of the character in target with the entire string replacement.

For example,
(check-expect (replace-char #\r "fnord" "reference librarian")
"fnordefefnordence libfnordafnordian")|#

;; replace-char : Character String String -> String
;; Given a character and two strings, produces the string with
;; all specified characters replaced with replacement-string
(check-expect (replace-char #\a "A" "") "")
(check-expect (replace-char #\a "A" "acdca") "AcdcA")
(check-expect (replace-char #\r "fnord" "reference librarian")
              "fnordefefnordence libfnordafnordian")

(define (replace-char c rep tar)
  (cond
    [(zero? (string-length tar)) ""]
    [else
     (string-append
      (if (equal? c (first (string->list tar)))
          rep
          (string-ith tar 0))
      (replace-char c rep (substring tar 1)))]))