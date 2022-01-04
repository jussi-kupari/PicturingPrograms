;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2186) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.8.6
; Define a data type zoo-animal which is either a monkey, a lion, a
; sloth, or a dolphin. All four kinds have a name and a weight. Lions have a numeric
; property indicating how much meat they need per day (in kilograms). Monkeys have
; a string property indicating their favorite food (e.g. “ants”, “bananas”, or “caviar”).
; Sloths have a Boolean property indicating whether they’re awake.

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