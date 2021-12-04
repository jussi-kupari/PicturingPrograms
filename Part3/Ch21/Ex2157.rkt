;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2157) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.5.7
; Develop a function swap-length-width that takes in a rect structure
; and produces a new rect whose length is the width of the given
; rect, and vice versa.


(define-struct rektangle (length width))
;; Rektangle is (make-rektangle Natural Natural)
;; interp. a mathematical rectangle


;; swap-length-width : Rektangle -> Rektangle
;; Given a Rektangle, swaps the length and width
(check-expect
 (swap-length-width (make-rektangle 50 60)) (make-rektangle 60 50))

(define (swap-length-width rec)
  (make-rektangle (rektangle-width rec)
                  (rektangle-length rec)))

