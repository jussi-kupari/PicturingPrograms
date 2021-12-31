;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2316) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.1.6
; Develop a function stutter that takes in a list of anything
; (it doesn’t matter whether they’re strings, numbers, or something else) and returns a list twice as
; long, with each element repeated twice in a row.
 
; For example,
; (check-expect (stutter (cons 5 (cons 2 (cons 9 empty))))
; (cons 5 (cons 5 (cons 2 (cons 2 (cons 9 (cons 9 empty)))))))

;; -- Data Definitions

;; LOO (List-Of-Objects) is one of:
;; - empty
;; - (cons Employee LOO)
;; interp. a list of objects

;; -- Functions

;; stutter : LOO -> LOO
;; Given a list-of-obejcts, produces the list with each element repeated twice in a row.
(check-expect (stutter empty) empty)
(check-expect
 (stutter (cons 5 (cons 2 (cons 9 empty))))
 (cons 5 (cons 5 (cons 2 (cons 2 (cons 9 (cons 9 empty)))))))

(define (stutter loo)
  (cond
    [(empty? loo) empty]
    [else
     (cons (first loo) (cons (first loo)
                             (stutter (rest loo))))]))