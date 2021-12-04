;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2057) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.5.7
; Develop a function named choose-posn that takes in a string and
; two posns. The string should be either "first" or "second". The
; choose-posn function should return either the first or the second
; of its two posns, as directed by the string.
; 
; Hint: Although this function returns a posn, it can be written without
; using make-posn (except for the examples). Indeed, it’s much shorter,
; simpler, and easier without using make-posn. This situation doesn’t
; happen often, but it does happen, so don’t use make-posn blindly.


;; choose-posn : String Posn Posn -> Posn
;; Given a string ("first" or "second") and two Posns
;; produces the posn indicated by the string
(check-expect
 (choose-posn "first" (make-posn 1 1) (make-posn 2 2))
 (make-posn 1 1))
(check-expect
 (choose-posn "second" (make-posn 1 1) (make-posn 2 2))
 (make-posn 2 2))

(define (choose-posn s pos1 pos2)
  (cond
    [(string=? s "first") pos1]
    [else pos2]))
