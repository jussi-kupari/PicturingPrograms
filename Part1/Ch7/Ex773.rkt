;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex773) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.7.3
; Develop a function named circle-perimeter that takes in the radius
; of a circle, and returns its perimeter.


;; cicle-perimeter: Number -> Number
;; Given radius of circle
;; produce perimeter

(check-within (circle-perimeter 10) (* 2 pi 10) 0.01)

(define (circle-perimeter r)
  (* 2 pi r))
