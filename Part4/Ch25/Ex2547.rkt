;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2547) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.7
Develop a function set-diff that takes in two lists of strings and returns
 a list of the strings that appear in the first but not the second. You
may assume that no string appears more than once in either list.

I alredy made this function for the previous problem|#

;; -- Data Definition

;; List-of-Strings (LOS) is one of:
;; - empty
;; - (cons String LOS)
;; interp. LOS is a list of strings

;; -- Functions

;; set-diff : LOS LOS -> LOS
;; Given two lists, find elements missing in the second list
(check-expect (set-diff empty (list "b" "c" "d")) empty)
(check-expect (set-diff (list "a" "b" "c") empty) empty)
(check-expect (set-diff (list "a" "b" "c") (list "b" "c" "d")) (list "a"))
(define (set-diff los1 los2)
  (cond
    [(or (empty? los1) (empty? los2)) empty]
    [else
     (if (not (string-in-los? (first los1) los2))
         (cons (first los1) (set-diff (rest los1) los2))
         (set-diff (rest los1) los2))]))

;; string-in-los? : String LOS -> Boolean
;; Given a string and a LOS, produces true if the string is in the LOS
(check-expect (string-in-los? "a" empty) false)
(check-expect (string-in-los? "a" (cons "b" (cons "c" (cons "d" empty)))) false)
(check-expect (string-in-los? "a" (cons "a" (cons "b" (cons "c" empty)))) true)

(define (string-in-los? s los)
  (cond
    [(empty? los) false]
    [else
     (if (equal? s (first los))
         true
         (string-in-los? s (rest los)))]))
