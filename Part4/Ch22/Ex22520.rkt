;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex22520) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.20 Develop a function random-element that takes in a non-empty list
; and returns a randomly chosen element of it. Ideally, each element should be equally likely
; to be chosen.
; Hint: You’ll probably need the built-in list-ref function, which takes in a non-empty
; list and a number, and returns the element that far away from the beginning of the list.
; For example,
; (check-expect
; (list-ref (cons "a" (cons "b" (cons "c" empty))) 0)
; "a")
; (check-expect
; (list-ref (cons "a" (cons "b" (cons "c" empty))) 1)
; "b")
; (check-expect
; (list-ref (cons "a" (cons "b" (cons "c" empty))) 2)
; "c")
; list-ref produces an error message if you give it too large a number, so make sure you
; don’t do that.
; Since random-element is unpredictable, you won’t be able to test it with check-expect,
; but you can call it a bunch of times with the same list and see whether each element is
; chosen roughly the same number of times.
; Warning: The list-ref function is useful when you need to get the element of a list
; at an arbitrary numeric position. That’s actually not a common thing to need; 95% of
; the time, you’ll be better off using first and rest.


;; -- Data Definition

;; LOB (ListOfObjects) is one of:
;; - empty
;; - (cons number LOB)
;; interp. a list of objects

;; -- Data Definition

;; NELOB (NonEmptyListOfObjects) is one of:
;; - (cons object empty)
;; - (cons object NELOB)
;; interp. a non-empty list of objects

;; -- Functions

;; random-element : NELOB -> Number
;; Given a NELOBand a natural, produces an object at a random index
(check-member-of
 (random-element (cons "a" (cons "b" (cons "c" (cons "d" empty))))) "a" "b" "c" "d")
(define (random-element nelob)
  (list-ref nelob (random (length nelob)))) 


