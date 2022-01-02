;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex22517) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.17
; Develop a function largest that takes in a list of numbers and returns the largest one.
 
; Hint: This function doesn’t really make sense on an empty list, so the input data type
; is really “non-empty list of numbers,” and the simplest test case should be a one-element
; list. Since largest doesn’t make sense on an empty list, you should be careful never to
; call it on an empty list. If you use the two-function approach, the “main” function here
; is the one for nonempty lists, the one for possibly-empty lists is the helper function.
; And if you use a one-function approach, you’ll need to move the function for possibly-empty
; lists inside the function for non-empty lists, e.g.
; (define (function-on-nelos L)
; ; (first L) a string
; ; (rest L) a list
; (cond [(empty? (rest L)) ...]
; [(cons? (rest L))
; ; (function-on-nelos (rest L)) whatever this returns
; ...]))

;; -- Data Definition

;; NELON (NonEmptyListOfNumbers) is one of:
;; - (cons number empty)
;; - (cons number NELON)
;; interp. a non-empty list of numbers

;; -- Functions

;; largest : NELON -> Number
;; Given a NELON, produces the largest number in the list
(check-expect (largest (cons 5 empty)) 5)
(check-expect (largest (cons 1 (cons 2 (cons 3 empty)))) 3)
(check-expect (largest (cons 5 (cons 2 (cons 3 empty)))) 5)
(check-expect (largest (cons 5 (cons 7 (cons 3 empty)))) 7)

(define (largest nelon)
  (cond
    [(empty? (rest nelon)) (first nelon)]
    [else
     (if (first-largest? (first nelon) (rest nelon))
         (first nelon)
         (largest (rest nelon)))]))

;; first-largest? : Number NELON -> Boolean
;; Given number and NELON, produces true if the given number is larger than any number in the list
(check-expect (first-largest? 6 (cons 5 empty)) true)
(check-expect (first-largest? 1 (cons 4 (cons 2 (cons 3 empty)))) false)
(check-expect (first-largest? 6 (cons 5 (cons 2 (cons 3 empty)))) true)
(check-expect (first-largest? 2 (cons 5 (cons 7 (cons 3 empty)))) false)

(define (first-largest? n nelon)
  (cond
    [(empty? nelon) true]
    [else (if (< n (first nelon))
              false
              (first-largest? n (rest nelon)))]))