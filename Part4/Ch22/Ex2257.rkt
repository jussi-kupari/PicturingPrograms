;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2257) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.7
; Develop a function count-over that takes in a number and a list of numbers, and tells
; how many of the numbers in the list are larger than the specified number.


;; -- Data Definition

;; LON (ListOfNumbers) is one of:
;; - empty
;; - (cons Number LON)
;; interp. a list of numbers

(define LON1 empty)
(define LON2 (cons 1 empty))
(define LON3 (cons 1 (cons 2 empty)))

;; template
#;
(define (fn-for-lon lon)
  (cond
    [(empty? lon) (...)]
    [else (... (first lon)
               ... (fn-for-lon (rest lon)))]))

;; -- Functions

;; count-over : Number LON -> Natural
;; Given a number and a LON,
;; produces the count of numbers in LON that are larger than the specified number
(check-expect (count-over 5 empty) 0)
(check-expect (count-over 5 (cons 5 empty)) 0)
(check-expect (count-over 5 (cons 6 empty)) 1)
(check-expect (count-over 5 (cons 6 (cons 7 (cons 3 empty)))) 2)

(define (count-over num lon)
  (cond
    [(empty? lon) 0]
    [else (if (> (first lon) num)
          (add1 (count-over num (rest lon)))
                (count-over num (rest lon)))]))


