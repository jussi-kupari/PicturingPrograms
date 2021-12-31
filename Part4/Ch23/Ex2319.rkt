;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2319) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.1.9
; Recall the built-in string-append function, which takes in two strings and produces
; a single string by combining them end to end. Develop a function list-append that
; takes in two lists (of numbers, strings, it doesn’t matter) and combines them end-to-end
; into one list. For example,

; (check-expect
; (list-append (cons "a" (cons "b" (cons "c" empty)))
; (cons "d" (cons "e" empty)))
; (cons "a" (cons "b" (cons "c" (cons "d" (cons "e" empty))))))
; 
; Hint: This function takes in two lists, so one might wonder what template to use. We’ll
; discuss this more fully in Chapter 25, but for now, use the template on the first of the
; two lists, treating the second as just a simple variable.
; There’s a built-in function append that does this, but you are not allowed to use
; append in writing your function; the point is that if append weren’t built in, you could
; have written it yourself. After you’ve finished this exercise, feel free to use append in the
; rest of the book.

;; -- Data Definitions

;; LOO (List-Of-Objects) is one of:
;; - empty
;; - (cons Employee LOO)
;; interp. a list of objects

;; -- Functions

;; list-append : LOO LOO -> LOO
;; Given a list-of-objects, appends them like string-append does for strings
(check-expect
 (list-append empty (cons "a" (cons "b" empty))) (cons "a" (cons "b" empty)))
(check-expect
 (list-append (cons "a" (cons "b" (cons "c" empty)))
              (cons "d" (cons "e" empty)))
 (cons "a" (cons "b" (cons "c" (cons "d" (cons "e" empty))))))

(define (list-append loo1 loo2)
  (cond
    [(empty? loo1) loo2]
    [else (cons (first loo1)
                (list-append (rest loo1) loo2))]))