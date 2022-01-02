;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2261) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 22.6.1
; Develop a function any-on-diag? that takes in a list of posn structures and tells whether any of
; them are “on the diagonal,” i.e. have x and y coordinates equal to one another.

;; -- Data Definition

;; LPONS (ListOfPosns) is one of:
;; - empty
;; - (cons posn LPOSN)
;; interp. a list of posns

;; -- Functions

;; any-on-diag? : LPOSN -> Boolean
;; Given a LPOSN, produces true if any have the same x- and y-posns
(check-expect (any-on-diag? empty) false)
(check-expect
 (any-on-diag? (cons (make-posn 0 0) (cons (make-posn 23 45) (cons (make-posn 45 35) empty)))) true)
(check-expect
 (any-on-diag? (cons (make-posn 10 9) (cons (make-posn 23 45) (cons (make-posn 34 55) empty))))
 false)
(check-expect (any-on-diag? empty) false)
(check-expect (any-on-diag? (cons (make-posn 5 6) empty)) false)
(check-expect (any-on-diag? (cons (make-posn 5 5) empty)) true)
(check-expect (any-on-diag? (cons (make-posn 5 6)
(cons (make-posn 19 3) empty)))
false)
(check-expect (any-on-diag? (cons (make-posn 5 6)
(cons (make-posn 19 19) empty)))
true)
(check-expect (any-on-diag? (cons (make-posn 5 5)
(cons (make-posn 19 3) empty)))
true)

(define (any-on-diag? lposn)
  (cond
    [(empty? lposn) false]
    [else (if (= (posn-x (first lposn)) (posn-y (first lposn)))
              true
              (any-on-diag? (rest lposn)))]))