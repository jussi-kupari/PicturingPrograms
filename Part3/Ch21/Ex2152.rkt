;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2152) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.5.2
; Develop a function change-jersey that takes in a basketball player
; struct and a number and produces a basketball player with the same
; name and team as before, but the specified jersey number.

(define-struct player (name team number))
;; Player is (make-player String String Natural)
;; interp. a basketball player

;; change-jersey : Player Natural -> Player
;; Given a Player and a natural, updates the player's jersey-number to the given natural

(check-expect (change-jersey (make-player "Teemu Selänne" "Jets" 13) 8)
              (make-player "Teemu Selänne" "Jets" 8))

(define (change-jersey p n)
  (make-player (player-name p) (player-team p) n))