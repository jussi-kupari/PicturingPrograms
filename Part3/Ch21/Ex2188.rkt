;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2188) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.8.8
; Develop a function can-put-in-cage? that takes in a zoo-animal
; and a number (the weight capacity of the cage) and tells whether the animal in question
; can be put into that cage. Obviously, if the weight of the animal is greater than the weight
; capacity of the cage, the answer is false. But sloths cannot be moved when they’re asleep,
; and dolphins can’t be put in a cage at all.

;; -- Data Definitions


(define-struct monkey (name weight favfood))
;; Monkey is a (make-monkey String Number Number)
;; interp. a representation of a monkey with name, weight and favorite food

(define-struct lion (name weight meat))
;; Lion is a (make-lion String Number Number)
;; interp. a representation of a lion with name, weight and weight of meat eaten in a day

(define-struct sloth (name weight awake?))
;; Sloth is a (make-sloth String Number Boolean)
;; interp. a representation of a sloth with name, weight and boolean for being awake (true = awake)

(define-struct dolphin (name weight))
;; dophin is a (make-dolphin String Number)
;; interp. a representation of a dolphin with name and weight

;; zoo-animal is one of:
;; - monkey
;; - lion
;; - sloth
;; - dolphin

;; -- Functions

;; can-put-in-cage : Zoo-animal Number -> Boolean
;; Given a Zoo-animal and capacity of the cage, produces true if it can be placed in a cage
(check-expect
 (can-put-in-cage? (make-monkey "toby" 18 "banana") 50) true)
(check-expect
 (can-put-in-cage? (make-dolphin "dolph" 70) 100) false)
(check-expect
 (can-put-in-cage? (make-lion "king" 170 20) 200) true)
(check-expect
 (can-put-in-cage? (make-lion "king" 170 20) 170) true)
(check-expect
 (can-put-in-cage? (make-lion "king" 170 20) 150) false)
(check-expect
 (can-put-in-cage? (make-sloth "poopoo" 40 true) 70) true)
(check-expect
 (can-put-in-cage? (make-sloth "poopoo" 40 false) 70) false)

(define (can-put-in-cage? za capacity)
  (cond
    [(and (lion? za)
          (<= (lion-weight za) capacity)) true]
    [(and (monkey? za)
          (<= (monkey-weight za) capacity)) true]
    [(and (sloth? za)
          (<= (sloth-weight za) capacity) (sloth-awake? za)) true]
    [else false]))






