;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1556) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.5.6 Some credit card companies give you a refund at the end of the year
; depending on how much you’ve used the card. Imagine a company that pays back
; • 0.25% of the first $500 you charge;
; • 0.50% of the next $1000 you charge (i.e. anything you charge between $500 and
; $1500);
; • 0.75% of the next $1000 you charge (i.e. between $1500 and $2500);
; • 1% of anything you charge over $2500.
; For example, a customer who charged $400 would get back $1.00, which is 0.25% of $400.
; A customer who charged $1400 would get back 0.25% of the first $500 (making $1.25),
; plus 0.50% of the next $900 (i.e. $4.50), for a total refund of $5.75.
; Develop a function card-refund to determine how much refund will be paid to a
; customer who has charged a specified amount on the card.


;; Number -> Number
;; Given the amount of money used, produces the refund
(check-expect (card-refund 500) 1.25)
(check-expect (card-refund 750) (+ 1.25 (* 0.005 (- 750 500))))
(check-expect (card-refund 1400) 5.75)

(define (card-refund n)
  (cond
    [(<= n 500) (* 0.0025 n)]
    [(<= n 1500) (+
                  (* 0.0025 500)
                  (* 0.005 (- n 500)))]
    [(<= n 2500) (+
                  (+
                   (* 0.0025 500)
                   (* 0.005 1000))
                  (* 0.0075 (- n 1500)))]
    [else (+
           (+
            (+ (* 0.0025 500)
               (* 0.005 1000))
            (* 0.0075 1000))
           (* 0.01 (- n 2500)))]))


