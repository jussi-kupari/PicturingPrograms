;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2543) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.3
Develop a function label-names that takes in a list of strings and a
natural number, which should be how many strings there are. It produces a list of two-
element lists, each comprising a different natural number and one of the strings from
the list. The numbers should be in decreasing order, starting with the given number and
ending with 1, and the strings should be in the order they were given. For example,
(check-expect (label-names (list "anne" "bob" "charlie") 3)
(list (list 3 "anne") (list 2 "bob") (list 1 "charlie")))|#

;; -- Data Definition

;; List-of-Strings (LOS) is one of:
;; - empty
;; - (cons String LOS)
;; interp. LOS is a list of strings

;; -- Functions

;; label-names : LOS Natural -> List-of-lists
;; Given a LOS and length of the LOS (natural), produces a list of 
;; two element lists with a string and a corresponding index (descending)
(check-expect (label-names (cons "a" (cons "b" (cons "c" empty))) 3)
              (cons
               (cons 3 (cons "a" empty))
               (cons
                (cons 2 (cons "b" empty))
                (cons
                 (cons 1 (cons "c" empty))
                 empty))))
(check-expect (label-names (list "anne" "bob" "charlie") 3)
(list (list 3 "anne") (list 2 "bob") (list 1 "charlie")))

(define (label-names los n)
  (cond
    [(empty? los) empty]
    [else (cons (cons n (cons (first los) empty))
                (label-names (rest los) (sub1 n)))]))