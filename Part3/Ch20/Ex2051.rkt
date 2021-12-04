;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2051) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 20.5.1 Develop a function named diagonal-point that takes in
; a number and returns a posn whose x and y coordinate are both that number.


;; diagonal-point : Number -> Posn
;; Given a number, returns a Posn with that number as x and y
(check-expect (diagonal-point 5.55) (make-posn 5.55 5.55))

(define (diagonal-point n)
  (make-posn n n))