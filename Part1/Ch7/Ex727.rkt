;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex727) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.2.7
; Develop a function named simpler-bullseye 1 that’s like the bullseye
; program of exercise 5.3.5, but taking in only one number, representing the radius of the
; outer ring. The radius of the inner disk should be half as large.


(require picturing-programs)

;; Number(radius ) -> Image
;; Given radius of outer ring, create "bullseye" of two rings
;; the inner being half the raius of the outer
(check-expect (simpler-bullseye 10)
              (overlay (circle (/ 10 2) "solid" "red")
           (circle 10 "solid" "black")))

(define (simpler-bullseye r)
  (overlay (circle (/ r 2) "solid" "red")
           (circle r "solid" "black")))