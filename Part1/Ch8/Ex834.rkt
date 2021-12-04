;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex834) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 8.3.4
; Develop an animation of a square, initially 1x1, which grows by 1
; pixel in each dimension at each clock tick, centered in a 200x200 window.


(require picturing-programs)

;; An animation of a growing square in a 200x200 window


;; -- Data Definition

;; SQ is a Number
;; interp. the length of the side of a square in pixels

(define SQ1 5)

#;                       ;template
(define (fn-for-sq sq)
  (...))

;; Template rules used
;; - atomic non-distinct: Number


;; -- Functions

;; Main

(define (main sq)
  (big-bang sq
    (on-tick next-sq)
    (to-draw render-sq)))


;; SQ -> SQ
;; Given SQ, produce next SQ
(check-expect (next-sq 10) 11)

(define (next-sq sq)
  (add1 sq))


;; SQ -> Image
;; Given SQ, produce image of world

(define (render-sq sq)
  (overlay (square sq "solid" "red")
           (empty-scene 200 200)))