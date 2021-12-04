;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2056) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.5.6
; Redefine the distance function from Exercise 20.4.5 to be much shorter
; and simpler, by re-using functions you’ve already seen or written in this chapter.
; Hint: You should be able to do this in two fairly short lines of Racket code.
; 
; 
; ; Exercise 20.4.5
; ; Develop a function named distance that takes in two posns
; ; (call them here and there), and computes the straight-line
; ; distance between them.
; ; 
; ; The formula is: 
; ; .
; ; 
; 
; 
; ;; distance : Posn Posn -> Number
; ;; Given two positions, produces the distance between the positions
; (check-expect (distance (make-posn 0 0) (make-posn 0 0)) 0)
; (check-within (distance (make-posn 10 10) (make-posn -50 -40)) 78 0.15)
; 
; (define (distance here there)
;   (sqrt
;    (+
;     (sqr (- (posn-x here) (posn-x there)))
;     (sqr (- (posn-y here) (posn-y there))))))
; 


;; add-posns : Posn Posn -> Posn
;; Given two Posns, produces a Posn with summed coordinates of the two inputs
(check-expect (sub-posns (make-posn 5 7) (make-posn 3 3)) (make-posn 2 4))

(define (sub-posns pos1 pos2)
  (make-posn (- (posn-x pos1) (posn-x pos2))
             (- (posn-y pos1) (posn-y pos2))))



;; distance : Posn Posn -> Number
;; Given two positions, produces the distance between the positions
(check-expect (distance (make-posn 0 0) (make-posn 0 0)) 0)
(check-within (distance (make-posn 10 10) (make-posn -50 -40)) 78 0.15)

(define (distance pos1 pos2)
  (sqrt (+ (sqr (posn-x (sub-posns pos1 pos2)))
           (sqr (posn-y (sub-posns pos1 pos2))))))