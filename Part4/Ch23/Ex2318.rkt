;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2318) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.1.8
Develop a function suffixes that takes in a list (of numbers, strings, it doesn’t matter)
and returns a list of lists comprising all the suffixes of the list
(that is, “the last 3 elements,” “the last 17 elements,”, “the last 0 elements,” etc. of the given list).

For example,
(check-expect (suffixes (cons "a" (cons "b" (cons "c" empty))))
(cons (cons "a" (cons "b" (cons "c" empty)))
(cons (cons "b" (cons "c" empty))
(cons (cons "c" empty)
(cons empty
empty)))))|#

;; -- Data Definitions

;; LOO (List-Of-Objects) is one of:
;; - empty
;; - (cons Employee LOO)
;; interp. a list of objects

;; LOLOO (List-of-LOO) is one of:
;; - empty
;; - (cons LOO LOLOO)

;; -- Functions

;; suffixes : LOO -> LOLOO
;; Given a list-of-objects, produces the list of suffixes for the list

(check-expect (suffixes empty) (cons empty empty))
(check-expect (suffixes (cons "a" (cons "b" (cons "c" empty))))
              (cons (cons "a" (cons "b" (cons "c" empty)))
                    (cons (cons "b" (cons "c" empty))
                          (cons (cons "c" empty)
                                (cons empty
                                      empty)))))

(define (suffixes loo)
  (cond
    [(empty? loo) (cons empty empty)]
    [else (cons loo (suffixes (rest loo)))]))