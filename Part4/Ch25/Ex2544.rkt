;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2544) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.4
Develop a function label-names-2 that takes in a list of strings, and
produces a list of two-element lists, each comprising a different natural number and one
of the strings from the list. The numbers should be in increasing order, starting with 1
and ending with the number of strings in the list, and the strings should be in the order
they were given. For example,
(check-expect (label-names-2 (list "anne" "bob" "charlie"))
(list (list 1 "anne") (list 2 "bob") (list 3 "charlie")))

You will probably need a helper function.

Note: This solution seems like a dirty hack.|#

;; -- Data Definition

;; List-of-Strings (LOS) is one of:
;; - empty
;; - (cons String LOS)
;; interp. LOS is a list of strings

;; -- Functions

;; label-names-2 : LOS -> List-of-Lists
;; Given a LOS, produces a list of two element lists composed of an ascending index and
;; a component of the LOS
(check-expect (label-names-2 empty) empty)
(check-expect (label-names-2 (cons "a" (cons "b" (cons "c" empty))))
              (cons
               (cons 1 (cons "a" empty))
               (cons
                (cons 2 (cons "b" empty))
                (cons
                 (cons 3 (cons "c" empty))
                 empty))))

(define (label-names-2 los)
  (label-names-with-index los 1)) ;This hard-coded 1 bothers me

;; label-names-with-index : LOS Natural -> List-of-Lists
;; Given a LOS and a starting index, produces a list of two element lists composed of
;; an ascending index and an element of the LOS
(check-expect (label-names-with-index empty 1) empty)
(check-expect (label-names-with-index empty 5) empty)
(check-expect (label-names-with-index (cons "a" (cons "b" (cons "c" empty))) 1)
              (cons
               (cons 1 (cons "a" empty))
               (cons
                (cons 2 (cons "b" empty))
                (cons
                 (cons 3 (cons "c" empty))
                 empty))))
(check-expect (label-names-with-index (cons "a" (cons "b" (cons "c" empty))) 5)
              (cons
               (cons 5 (cons "a" empty))
               (cons
                (cons 6 (cons "b" empty))
                (cons
                 (cons 7 (cons "c" empty))
                 empty))))

(define (label-names-with-index los n)
  (cond
    [(empty? los) empty]
    [else (cons (cons n (cons (first los) empty))
                (label-names-with-index (rest los) (add1 n)))]))