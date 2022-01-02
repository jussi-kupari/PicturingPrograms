;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2271) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 22.7.1
; Develop a function count-e that takes in a string and returns the number of times the
; letter “e” appears in it. You may assume there are no capital letters
; (i.e. you don’t need to count “E”).

;; count-e : String -> Natural
;; Given a string, produces the sum of all letters "e" in the string
(check-expect (count-e "") 0)
(check-expect (count-e "string") 0)
(check-expect (count-e "legend") 2)

(define (count-e string)
  (cond
    [(zero? (string-length string)) 0]
    [else (if (equal? "e" (substring string 0 1))
              (add1 (count-e (substring string 1)))
              (count-e (substring string 1)))]))

; Converting the string to a list of characters.
 
; This uses the "count-matches" function from Ex22.5.5

;; -- Data Definitions

;; LOO (ListOfObjects) is one of:
;; - empty
;; - (cons Object LOO)
;; interp. a list of objects

;; count-e.v2 : String -> Natural
;; Given a string, produces the sum of all letters "e" in the string
(check-expect (count-e.v2 "") 0)
(check-expect (count-e.v2 "string") 0)
(check-expect (count-e.v2 "legend") 2)

(define (count-e.v2 string)
  (count-matches #\e (string->list string)))

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