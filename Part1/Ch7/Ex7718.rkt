;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex7718) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.7.18 Develop a function named convert-3-digits that takes in the “hun-
; dreds”, “tens”, and “ones” digits of a number, in that order, and returns the number itself.
; For example,
; (convert-3-digits 5 2 8) "should be" 528


;; convert-3-digits: Number (hundreds)
;;                   Number (tens)
;;                   Number (ones) -> Number

(check-expect (convert-3-digits 5 2 8) 528)

(define (convert-3-digits h t o)
  (+ (* 100 h) (* 10 t) o))