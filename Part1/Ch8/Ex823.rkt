;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex823) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 8.2.3
; Develop an animation of a small picture of your choice on a 200x200
; white background. The model should be a number representing the x coordinate of the
; picture’s location; the y coordinate should always be 50.
; Try it with several different numbers as initial models.


(require picturing-programs)

;; An static animation of a picture on a 200x200 scene

;; -- Data Definition

;; XP is a Number
;; interp. the x-axis position of the image

(define XP1 100)

#;
(define (fn-for-xp xp)
  (...))

;; Template rules used
;; - atomic non-distinct: Number


;; -- Functions

;; Main

(define (main xp)
  (big-bang xp
    (to-draw render-xp)))


;; XP -> Image
;; Given XP, produce Image of world

(define (render-xp xp)
  (place-image pic:calendar xp 50 (empty-scene 200 200)))












