;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex22519) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.19
; Develop a function count-even-odd-blocks that takes in a list of
; integers and tells how many blocks of consecutive even or consecutive odd numbers there
; are. For example,
; (check-expect (count-even-odd-blocks
; (cons 3 (cons 9 (cons 2 (cons 7 (cons 1 (cons 1
; (cons 2 (cons 4 empty)))))))))
; 4)
; because the numbers 3 and 9 form a block of odd numbers; 2 is a block of even numbers;
; 7, 1, and 1 form a block of odd numbers; and 2 and 4 are a block of even numbers, for
; four blocks in all.
; 
; Hint: Obviously, this is similar to Exercise 22.5.18, but if you use the “helper function”
; approach, it doesn’t need to take in a specific “already seen” number, but only whether the
; previous number was even or odd. Instead of passing in the previous number, therefore,
; try writing two separate (but similar) helper functions even-helper and odd-helper.
; 
; This approach is a little longer, but it’s a powerful technique that you can use for many
; problems in the future. Try it.
; 
; SIDEBAR:
; There are many problems that call for scanning through a list from left to right,
; looking for particular patterns. The above approach is one that computer scientists
; call a finite-state machine or finite-state automaton.


;; -- Data Definition

;; LON (ListOfNumbers) is one of:
;; - empty
;; - (cons number LON)
;; interp. a list of numbers

;; -- Data Definition

;; NELON (NonEmptyListOfNumbers) is one of:
;; - (cons number empty)
;; - (cons number NELON)
;; interp. a non-empty list of numbers

;; -- Functions

;; count-even-odd-blocks : NELON -> Natural
;; Given a NELON, produces the number of even and odd number blocks in the list

(check-expect (count-even-odd-blocks
(cons 3 (cons 9 (cons 2 (cons 7 (cons 1 (cons 1
(cons 2 (cons 4 empty)))))))))
4)

(define (count-even-odd-blocks nelon)
  (cond
    [(empty? (rest nelon)) 1]
    [else (if (same-type? (first nelon) (first (rest nelon)))
              (count-even-odd-blocks (rest nelon))
              (add1 (count-even-odd-blocks (rest nelon))))]))

;; same-type? : Number Number -> Boolean
;; Given two numbers, produces true if both are even or odd
(check-expect (same-type? 1 1) true)
(check-expect (same-type? 2 2) true)
(check-expect (same-type? 1 2) false)
(check-expect (same-type? 2 1) false)

(define (same-type? n1 n2)
  (or (and (odd? n1) (odd? n2))
      (and (even? n1) (even? n2))))