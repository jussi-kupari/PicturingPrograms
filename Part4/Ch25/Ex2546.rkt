;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2546) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.6
Develop a function union that takes in two lists of strings and returns
a list of the strings that appear in either list, but only once each. You
may assume that no string appears more than once in either list.

This works but feels convoluted...|#

;; -- Data Definition

;; List-of-Strings (LOS) is one of:
;; - empty
;; - (cons String LOS)
;; interp. LOS is a list of strings

;; -- Functions

;; union : LOS LOS -> LOS
;; Given two lists, produces their union
(check-expect (union empty (list "b" "c" "d")) empty)
(check-expect (union (list "a" "b" "c") empty) empty)
(check-expect (union (list "a" "b" "c") (list "b" "c" "d")) (list "a" "b" "c" "d"))
(check-expect (union (list "b" "c" "d" "a") (list "c" "d" "e")) (list "b" "a" "c" "d" "e"))

(define (union los1 los2)
  (cond
    [(or (empty? los1) (empty? los1)) empty]
    [else
     (append
      (set-diff los1 (intersection los1 los2))
      (intersection los1 los2)
      (set-diff los2 (intersection los1 los2)))]))

;; -- Functions

;; intersection : LOS LOS -> LOS
;; Given two lists of strings, produces the intersection of the lists
(check-expect
 (intersection empty empty)
 empty)
(check-expect
 (intersection (cons "a" (cons "b" empty)) empty)
 empty)
(check-expect
 (intersection empty (cons "a" (cons "b" empty)))
 empty)
(check-expect
 (intersection (cons "b" (cons "c" empty)) (cons "a" (cons "b" empty)))
 (cons "b" empty))
(check-expect
 (intersection (cons "b" (cons "c" (cons "d" empty))) (cons "a" (cons "b" (cons "c" empty))))
 (cons "b" (cons "c" empty)))

(define (intersection los1 los2)
  (cond
    [(or (empty? los1) (empty? los1)) empty]
    [(string-in-los? (first los1) los2)
     (cons (first los1) (intersection (rest los1) los2))]
    [else
     (intersection (rest los1) los2)]))

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