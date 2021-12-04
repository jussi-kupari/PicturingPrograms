;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex833) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 8.3.3
; Modify Exercise 8.2.3 so that the picture moves 1 pixel to the right
; every 1/10 second.


(require picturing-programs)

;; An animation of a picture moving on a 200x200 scene

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
    (on-tick next-xp 1/10)
    (to-draw render-xp)))



;; XP -> XP
;; Given XP, produce the next XP
(check-expect (next-xp 10) 11)

(define (next-xp xp)
  (add1 xp))


;; XP -> Image
;; Given XP, produce Image of world

(define (render-xp xp)
  (place-image pic:calendar xp 50 (empty-scene 200 200)))

