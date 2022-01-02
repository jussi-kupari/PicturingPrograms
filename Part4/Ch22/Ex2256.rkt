;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2256) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.6
; Develop a function count-votes-for-name that takes in a string (the name of a candidate)
; and a list of strings (the votes cast by a bunch of voters) and tells how many of the
; voters voted for this particular candidate.

; Hint: This is really easy if you re-use previously-written functions.

;; -- Data Definitions

;; LOS (ListOfStrings) is one of:
;; - empty
;; - (cons String LOS)
;; interp. a list of strings

(define LOS1 empty)
(define LOS2 (cons "a" empty))
(define LOS3 (cons "a" (cons "b" empty)))

;; template
#;
(define (fn-for-los los)
  (cond
    [(empty? los) false]
    [else (... (first los)
               (fn-for-los (rest los)))]))

;; -- Functions

;; count-votes-for-name : String LOS -> Natural
;; Given a name and a LOS, produces the number of times the name appears in the list
(check-expect
 (count-votes-for-name "john" empty) 0)
(check-expect
 (count-votes-for-name "john" (cons "mary" empty)) 0)
(check-expect
 (count-votes-for-name "john" (cons "john" empty)) 1)
(check-expect
 (count-votes-for-name "john" (cons "mary" (cons "john" (cons "mary" empty)))) 1)
(check-expect
 (count-votes-for-name "mary" (cons "mary" (cons "john" (cons "mary" empty)))) 2)

(define (count-votes-for-name name los)
  (cond
    [(empty? los) 0]
    [else (if (string=? name (first los))
              (add1 (count-votes-for-name name (rest los)))
              (count-votes-for-name name (rest los)))]))