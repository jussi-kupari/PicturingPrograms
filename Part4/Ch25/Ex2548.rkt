;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2548) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 25.4.8
Re-do exercises 25.4.5, 25.4.6, and 25.4.7 without the assumption that
there are no duplicates in the inputs.

I handled this by using a 'keep-unique' helper function that keeps
the last one of duplicated elements|#

;; -- Data Definition

;; List-of-Strings (LOS) is one of:
;; - empty
;; - (cons String LOS)
;; interp. LOS is a list of strings

;; -- Functions

;; intersection.v2 : LOS LOS -> LOS
;; Given two lists of strings, produces the unique intersection of the lists
;; (keeps the last of any multiple elements)
(check-expect
 (intersection.v2 (list "a" "a" "b" "c" "c") (list "a" "a" "b" "c" "c" "d" "e"))
 (list "a" "b" "c"))

(define (intersection.v2 los1 los2)
  (keep-unique (intersection los1 los2)))

;; union.v2 : LOS LOS -> LOS
;; Given two lists, produces their uinque union
(check-expect
 (union empty (list "b" "b" "c" "d")) empty)
(check-expect
 (union (list "a" "a" "b" "c") empty) empty)
(check-expect
 (union (list "a" "a" "b" "c") (list "b" "c" "c" "d")) (list "a" "b" "c" "d"))

;; set-diff.v2 : LOS LOS -> LOS
;; Given two lists, find unique elements missing in the second list
(check-expect (set-diff.v2 empty (list "b" "c" "d")) empty)
(check-expect (set-diff.v2 (list "a" "b" "c") empty) empty)
(check-expect (set-diff.v2 (list "a" "a" "b" "c") (list "b" "c" "d" "d")) (list "a"))

(define (set-diff.v2 los1 los2)
  (keep-unique (set-diff los1 los2)))

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

(define (union los1 los2)
  (cond
    [(or (empty? los1) (empty? los1)) empty]
    [else
     (keep-unique
      (append
      (set-diff los1 (intersection los1 los2))
      (intersection los1 los2)
      (set-diff los2 (intersection los1 los2))))]))

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

;; keep-unique : LOS -> LOS
;; Given a list, produces a list of the unique values
(check-expect (keep-unique (list "a" "b" "b" "c" "c" "d")) (list "a" "b" "c" "d"))
(define (keep-unique los)
  (cond
    [(empty? los) empty]
    [else (if (string-in-los? (first los) (rest los))
              (keep-unique (rest los))
              (cons (first los) (keep-unique (rest los))))]))