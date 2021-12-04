;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1132) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 11.3.2
; Develop a function cylinder-volume that takes in the radius and
; height of a cylinder, and computes its volume.
; 
; Hint: Look for a previously-written function you can re-use to do part of the job.


;; Number Number -> Number
;; Given radius and height of a cylinder, and computes its volume
(check-within (cyl-volume 10 10) 3140 2)

(define (cyl-volume r h)
  (* h (circle-area r)))

;; Number -> Number
;; Given radius of a circle, produces the area
(check-within (circle-area 10) 314 0.2)

(define (circle-area r)
  (* pi (* r r)))
