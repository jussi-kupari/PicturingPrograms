;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex845) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 8.4.5
; Write an animation of a progress bar (as in Exercise 8.3.9) that starts
; at 120, and is cut in half every second thereafter: 60, 30, 15, . . .


(require picturing-programs)

;; A blue progress-bar

;; -- Data Definition

;; PB is a Number
;; interp. advancing progress as a number

(define PB1 20)

#;
(define (fn-for-pb pb)   ;template
  (...))

;; Template rules used
;; - atomic non-distinct: Number


;; -- Functions

;; Main

(define (main pb)
  (big-bang pb
    (on-tick next-pb 1)
    (to-draw render-pb)))

;; PB -> PB
;; Given PB, produce PB / 2
(check-expect (next-pb 100) 50)

(define (next-pb pb)
  (/ pb 2))


;; PB -> Image
;; Given PB, produce Image of world

(define (render-pb pb)
  (place-image
   (rectangle pb 20 "solid" "blue") (/ pb 2) 10 (rectangle 120 20 "outline" "blue")))

