;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex22513) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.13
; Develop a function all-match? that takes in a string and a list of strings, and tells
; whether all the strings in the list match the given string.

; For example,
; (check-expect
; (all-match? "cat" (cons "cat" (cons "dog" (cons "cat" empty))))
; false)
; (check-expect
; (all-match? "cat" (cons "cat" (cons "cat" empty)))
; true)

;; -- Data Definitions

;; LOS (ListOfStrings) is one of:
;; - empty
;; - (cons String LOS)
;; interp. a list of strings

(define LOS1 empty)
(define LOS2 (cons "a" empty))
(define LOS3 (cons "a" (cons "b" empty)))

;; template
#;
(define (fn-for-los los)
  (cond
    [(empty? los) false]
    [else (... (first los)
               (fn-for-los (rest los)))]))

;; -- Functions

;; all-match? : String LOS -> Boolean
;; Given a string and a LOS,
;; produces true if all the strings in the list match with the specific string 
(check-expect
(all-match? "cat" (cons "cat" (cons "dog" (cons "cat" empty))))
false)
(check-expect
(all-match? "cat" (cons "cat" (cons "cat" empty)))
true)

(define (all-match? string los)
  (cond
    [(empty? los) true]
    [else (if (string=? string (first los))
              (all-match? string (rest los))
              false)]))