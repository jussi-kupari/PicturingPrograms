;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2352) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.5.2
Develop a function string-suffixes that takes in a string and returns a list of all its suffixes.

For example,
(check-expect (string-suffixes "abc")
(list "abc" "bc" "c" ""))|#

;; -- Data Definition

;; LOS (List-Of-Strings) is one of:
;; - empty
;; - (cons String LOS)
;; interp. a list of strings

;; -- Functions

;; string-suffixes : String -> LOS (List-Of-Strings)
(check-expect
 (string-suffixes "abc")
 (cons "abc" (cons "bc" (cons "c" (cons "" empty)))))

(define (string-suffixes s)
  (cond
    [(empty? (string->list s)) (cons "" empty)]
    [else
     (cons s (string-suffixes (substring s 1)))]))

