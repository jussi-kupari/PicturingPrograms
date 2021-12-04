;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1341_1342) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 13.4.1 Develop a function much-older? that takes in two people’s ages and
; tells whether the first is “much older” (which we’ll define as “at least ten
; years older”) than the second.


;; Natural Natural -> Boolean
;; Given ages of two people, produces true if the first person is at least 10y older
(check-expect (much-older? 30 26) false)
(check-expect (much-older? 40 22) true)

(define (much-older? n1 n2)
  (>= (- n1 n2) 10))


; Exercise 13.4.2
; Develop a function within-distance? that takes in three numbers:
; x, y, and distance. The function should return whether or not the
; point (x, y) is at most the specified distance from the point (0, 0).
; The formula for the distance of a point to (0, 0) is px2 + y2.
; 
; Hint: You may want to write an auxiliary function to compute the distance.


;; Number Number Number -> Boolean
;; Given x, y and a distance
;; produces true if x, y point is at max the distance from (0, 0)
(check-expect (within-distance? 10 10 30) true)
(check-expect (within-distance? 20 20 30) true)
(check-expect (within-distance? 30 30 30) false)

(define (within-distance? x y d)
  (<= (distance x y) d))

;; Number Number -> Number
;; Given x andy, produces distance from point (0, 0)
(check-expect (distance 0 0) 0)
(check-within (distance 2 2) (sqrt 8) 0.1)

(define (distance x y)
  (sqrt
   (+
    (sqr x) (sqr y))))