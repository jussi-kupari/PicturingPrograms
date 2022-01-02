;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2254) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.4
; Develop a function any-matches? that takes in a string and a list of strings and tells
; whether any of the strings in the list is the same as the given string.
 
; For example,
; (check-expect
; (any-matches? "fnord" (cons "snark" (cons "boojum" empty)))
; false)
; (check-expect
; (any-matches? "fnord" (cons "snark" (cons "fnord" empty)))
; true)
 
; Hint: The templates for operating on lists use a conditional to decide whether you’ve
; got an empty or a non-empty list. This function needs to make another decision: does
; the current string match the target or not? You can do this with another conditional,
; or (since this function returns a boolean), you can do it more simply without the extra
; conditional.

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

;; any-matches? : String LOS -> Boolean
;; Given a String and a LOS, produces true if the string is found in the LOS
(check-expect (any-matches? "empty" empty) false)
(check-expect (any-matches? "empty" (cons "half-full" empty)) false)
(check-expect (any-matches? "empty" (cons "half-full" (cons "half-empty" empty))) false)
(check-expect (any-matches? "empty" (cons "half-full" (cons "empty" empty))) true)
(check-expect (any-matches? "empty" (cons "empty" (cons "full" empty))) true)
(check-expect (any-matches? "empty" (cons "empty" empty)) true)

(define
  (any-matches? s los)
  (cond
    [(empty? los) false]
    [else (if (string=? s (first los))
              true
              (any-matches? s (rest los)))]))