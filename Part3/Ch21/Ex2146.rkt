;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2146) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.4.6
; Develop a function same-team? that takes in two basketball-player
; structs and tells whether they play for the same team.

(require picturing-programs)

;; -- Data Definition

(define-struct player (name team number))
;; Player is (make-player String String Natural)
;; interp. a basketball player


;; -- Functions

;; same-team? : Player Player -> Boolean
;; Given two players, produces true if they play on the same team'
(check-expect
 (same-team? (make-player "jake busey" "hawks" 17)
             (make-player "tony pizziano" "hawks" 16)) true)
(check-expect
 (same-team? (make-player "jake busey" "eagles" 17)
             (make-player "tony pizziano" "hawks" 16)) false)

(define (same-team? p1 p2)
  (string=? (player-team p1) (player-team p2)))