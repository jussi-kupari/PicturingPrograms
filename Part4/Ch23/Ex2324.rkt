;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2324) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.2.4
; Develop a function unique that takes in a list of objects and returns
; a list of the same objects, but each appearing only once each.
; 
; Hint: There are several ways to do this. Probably the easiest way, given what you’ve
; seen so far, produces a result in the order in which each string last appeared in the input;
; for example,
; 
; (check-expect (unique (cons "a" (cons "b" (cons "a" empty))))
; (cons "b" (cons "a" empty)))
; ; not (cons "a" (cons "b" empty)))
; (check-expect
; (unique (cons 3 (cons 8 (cons 5 (cons 5 (cons 8 empty))))))
; (cons 3 (cons 5 (cons 8 empty))))
; ; not (cons 3 (cons 8 (cons 5 empty)))
; We’ll discuss other approaches in later chapters.
; Since you don’t know what kind of objects you’re dealing with, you’ll need to use
; equal? to compare them.

;; -- Data Definitions

;; LOO (List-Of-Objects) is one of:
;; - empty
;; - (cons String LOO)
;; interp. a list of objects

;; -- Functions

;; unique : LOO -> LOO
;; Given a LOO, prodices the LOO with only unique elements (last instance is saved).
(check-expect
 (unique (cons "a" (cons "b" (cons "a" empty))))
 (cons "b" (cons "a" empty)))
(check-expect
 (unique (cons 3 (cons 8 (cons 5 (cons 5 (cons 8 empty))))))
 (cons 3 (cons 5 (cons 8 empty))))

(define (unique loo)
  (cond
    [(empty? loo) loo]
    [else (if (exists-further-in-list? (first loo) (rest loo))
              (unique (rest loo))
              (cons (first loo) (unique (rest loo))))]))

;; exists-further-in-list? : Object LOO -> Boolean
;; Given an object and a LOO, produces true if the obejct is in the list
(check-expect (exists-further-in-list? "a" empty) false)
(check-expect (exists-further-in-list? "a" (cons "b"
                                                 (cons "c"
                                                       (cons "a"
                                                             (cons "d" empty))))) true)
(check-expect (exists-further-in-list? "a" (cons "b"
                                                 (cons "c"
                                                       (cons "e"
                                                             (cons "d" empty))))) false)

(define (exists-further-in-list? s loo)
  (cond
    [(empty? loo) false]
    [else (if (equal? s (first loo))
              true
              (exists-further-in-list? s (rest loo)))]))