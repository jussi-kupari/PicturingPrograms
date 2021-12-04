;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1333_1335) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 13.3.3
; Develop a function may-drink? that takes in a person’s age and
; returns whether the person is old enough to drink alcohol legally.
; (In most of the U.S., this means “at least 21 years old”.)
; 
; Exercise 13.3.4
; Develop a function under-a-dollar? that takes in the price of an
; item in dollars (e.g. 1.49 or .98) and tells whether it’s less than 1.00.
; 
; Exercise 13.3.5
; Develop a function is-17? that takes in a number and tells whether
; it’s exactly 17.


;Ex13.3.3
;; Natural -> Boolean
;; Given a persons age, produces true if the person is old enough to drind (>= 21)
(check-expect (may-dring? 20) false)
(check-expect (may-dring? 21) true)

(define (may-dring? n)
  (>= n 21))

;Ex13.3.4
;; Number -> Boolean
;; Given a price in USD, produces true if it is under one USD
(check-expect (under-a-dollar? 1.0) false)
(check-expect (under-a-dollar? 0.999) true)
(define (under-a-dollar? n)
  (< n 1))


;Ex13.3.5
;; Number -> Boolean
;; Given a number, produces true if it is exactly 17
(check-expect (is-17? 17.0001) false)
(check-expect (is-17? 17) true)

(define (is-17? n)
  (= n 17))