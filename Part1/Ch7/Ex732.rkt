;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex732) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.3.2
; Write a Racket expression, as simple as possible, to represent
; the standard arithmetic expression (2 * 3 * 4) + 5 + (7 − 4)


(+ (* 2 3 4) 5 (- 7 4))