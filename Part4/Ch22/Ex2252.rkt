;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2252) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 22.5.2
; Develop a function add-up that takes in a list of numbers and returns the result
; of adding them all together.
; For example, (check-expect (add-up (cons 4 (cons 8 (cons -3 empty)))) 9)


;; -- Data Definition

;; LON (ListOfNumbers) is one of:
;; - empty
;; - (cons Number LON)
;; interp. a list of numbers

(define LON1 empty)
(define LON2 (cons 1 empty))
(define LON3 (cons 1 (cons 2 empty)))
(define LON4 (cons 1 (cons 2 (cons 3 empty))))

;; template
#;
(define (fn-for-lon lon)
  (cond
    [(empty? lon) (...)]
    [else (... (first lon)
               ... (fn-for-lon (rest lon)))]))

;; -- Functions

;; add-up : LON -> Number
;; Given a LON, produces the sum of all the numbers in the LON
(check-expect (add-up empty) 0)
(check-expect (add-up (cons 1 empty)) (+ 1 0))
(check-expect (add-up (cons 1 (cons 2 empty))) (+ 1 (+ 2 0)))
(check-expect (add-up (cons 1 (cons 2 (cons 3 empty)))) (+ 1 (+ 2 (+ 3 0))))
(check-expect (add-up (cons 4 (cons 8 (cons -3 empty)))) 9)

(define (add-up lon)
  (cond
    [(empty? lon) 0]
    [else (+ (first lon) (add-up (rest lon)))]))








