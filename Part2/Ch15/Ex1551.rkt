;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1551) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.5.1
; A carpet store needs a function to compute how much to charge its
; customers. Carpeting costs $5/yard, but if you buy 100 yards or more,
; there’s a 10% discount on the whole order, and if you buy 500 yards
; or more, the discount becomes 20% on the whole order.
; 
; Develop a function carpet-price that takes in the number of yards
; of carpeting and returns its total price.


;; Natural -> Number
;; Given the lenght of carpet bought in full yards
;; produces the price after possible discount
(check-expect (carpet-price 0) 0)
(check-expect (carpet-price 99) (* 5 99))
(check-expect (carpet-price 100) (* 0.9 (* 5 100)))
(check-expect (carpet-price 499) (* 0.9 (* 5 499)))
(check-expect (carpet-price 500) (* 0.8 (* 5 500)))

(define (carpet-price len)
  (cond
    [(> len 499) (* 0.8 (* 5 len))]
    [(> len 99) (* 0.9 (* 5 len))]
    [else (* 5 len)]))