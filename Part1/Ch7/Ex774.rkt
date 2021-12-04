;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex774) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.7.4
; Develop a function named area-of-circle that takes in the radius
; of a circle and computes its area.


;; area-of-circle: Number -> Number
;; Given radius of circle
;; produce area of circle

(check-within (area-of-circle 10) (* pi 10 10) 0.01)

(define (area-of-circle r)
  (* pi r r))