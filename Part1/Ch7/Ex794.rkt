;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex794) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.9.4
; Develop a function named random-picture that takes in a width and
; a height, and produces a rectangle that size and shape, in which each pixel is a random
; color (that is, for each pixel, the red, green, and blue components are each chosen ran-
; domly). Note: I’m not asking you to pick a random color, then make a rectangle of that
; color. I want each pixel to be chosen at random separately.

(require picturing-programs)

;red
(define (red-fn x y)
  (random 255))

;green
(define (green-fn x y)
  (random 255))

;blue
(define (blue-fn x y)
  (random 255))

; Number Number -> Image
; Given height and width, create randomly colored image

(define (random-picture x y)
  (build3-image x y red-fn green-fn blue-fn))