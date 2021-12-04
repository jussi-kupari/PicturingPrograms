;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex777_7710) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.7.7
; Develop a function named hours->minutes that takes in a number
; of hours, and returns how many minutes are in that many hours.


;; hours->minutes: Number -> Number
;; Given hours
;; produce as minutes

(check-expect (hours->minutes 10) 600)

(define (hours->minutes h)
  (* h 60))

; Exercise 7.7.8
; Develop a function named days->hours that takes in a number of
; days, and returns how many hours are in that many days.


;; days->hours: Number -> Number
;; Given days
;; produce as hours

(check-expect (days->hours 10) (* 24 10))

(define (days->hours d)
  (* 24 d))


; Exercise 7.7.9
; Develop a function named days->minutes that takes in a number of
; days, and returns how many minutes are in that many hours.


;; days->minutes: Number -> Number
;; Given days
;; produce as minutes

(check-expect (days->minutes 10) 14400)

(define (days->minutes d)
  (hours->minutes (days->hours d)))


; Exercise 7.7.10
; Develop a function named dhm->minutes that takes in three num-
; bers: how many days, how many hours, and how many minutes, in that order, and returns
; the total number of minutes.


;; dhm->minutes: Number (days)
;;               Number (hours)
;;               Number (minutes) -> Number (minutes)

(check-expect (dhm->minutes 2 2 2) 3002)

(define (dhm->minutes d h m)
  (+ m
     (hours->minutes h)
     (days->minutes d)))













