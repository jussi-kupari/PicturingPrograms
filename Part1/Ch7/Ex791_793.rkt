;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex791_793) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.9.1
; Develop a function named random-digit that returns one of the in-
; tegers 0, 1, . . . 9, chosen at random.

(check-range (random-digit 0) 0 9)
(check-member-of (random-digit 0) 0 1 2 3 4 5 6 7 8 9)

(define (random-digit r)
  (random 10))

; Exercise 7.9.2
; Develop a function named roll-die that returns an integer randomly
; chosen from 1 to 6 inclusive — no zeroes, no 7’s.

(check-range (roll-die 0) 1 6)
(check-member-of (roll-die 0) 1 2 3 4 5 6)

(define (roll-die d)
  (add1 (random 6)))

; Exercise 7.9.3
; Develop a function named two-dice that acts like rolling two 6-sided
; dice and counting the total number of dots.

(check-range (two-dice 0) 2 12)
(check-member-of (two-dice 0) 2 3 4 5 6 7 8 9 10 11 12)

(define (two-dice d)
  (+ (roll-die d)
     (roll-die d)))