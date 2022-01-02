;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2255) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.5
; Develop a function count-matches that takes in an object and a list of objects and tells
; how many (possibly zero) of the objects in the list are the same as the given object.
 
; For example,
; (check-expect
; (count-matches "cat" (cons "dog" (cons "cat" (cons "fish"
; (cons "cat" (cons "cat" (cons "wombat" empty)))))))
; 3)
; (check-expect
; (count-matches 1 (cons 3 (cons 1 (cons 4
; (cons 1 (cons 5 (cons 9 empty)))))))
; 2)

; Hint: For this one, you probably will need a nested conditional.
; There’s an additional difference: this function is supposed to work on any kind of
; object, not just strings. So instead of string=?, you’ll need to use the built-in function
; equal?.

(require picturing-programs)

;; -- Data Definitions

;; LOO (ListOfObjects) is one of:
;; - empty
;; - (cons Object LOO)
;; interp. a list of objects

(define LOO1 empty)
(define LOO2 (cons "a" empty))
(define LOB3 (cons 0 (cons 1 (cons 2 empty))))
(define LOB4
  (cons
   (circle 10 "solid" "red")
   (cons
    (square 10 "solid" "green")
    (cons
     (square 5 "solid" "blue") empty))))

;; template
#;
(define (fn-for-los lob)
  (cond
    [(empty? lob) false]
    [else (... (first los)
               (fn-for-los (rest los)))]))

;; -- Functions

;; count-matches : Object LOO -> Natural
;; Given an object and a LOO, produces the count of the object in the LOO
(check-expect (count-matches 1 empty) 0)
(check-expect (count-matches 1 (cons 1 empty)) 1)
(check-expect (count-matches "1" (cons "1" empty)) 1)
(check-expect (count-matches 1 (cons 1 (cons 1 (cons 2 empty)))) 2)
(check-expect (count-matches 1 (cons 0 (cons 3 (cons 2 empty)))) 0)
(check-expect (count-matches "1" (cons "0" (cons "3" (cons "2" empty)))) 0)

(define (count-matches obj loo)
  (cond
    [(empty? loo) 0]
    [else (if (equal? obj (first loo))
              (add1 (count-matches obj (rest loo)))
              (count-matches obj (rest loo)))]))