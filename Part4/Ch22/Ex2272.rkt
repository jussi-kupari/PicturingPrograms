;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2272) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.7.2
; Develop a function count-vowels that takes in a string and returns
; how many vowels (any of the letters “a”, “e”, “i”, “o”, or “u”) it contains.
; You may assume there are no capital letters.

;; count-vowels : String -> Natural
;; Given a string, returns the sum of vowels
(check-expect (count-vowels "") 0)
(check-expect (count-vowels "string") 1)
(check-expect (count-vowels "legendary") 3)

(define (count-vowels str)
  (cond
    [(= (string-length str) 0) 0]
    [else (if (or (string=? "a" (substring str 0 1))
                  (string=? "e" (substring str 0 1))
                  (string=? "i" (substring str 0 1))
                  (string=? "o" (substring str 0 1))
                  (string=? "u" (substring str 0 1)))
              (add1 (count-vowels (substring str 1)))
              (count-vowels (substring str 1)))]))

; String to list method

;; -- Data Definitions

;; LOO (ListOfObjects) is one of:
;; - empty
;; - (cons Object LOO)
;; interp. a list of objects

;; count-vowels.v2 : String -> Natural
;; Given a string, returns the sum of vowels
(check-expect (count-vowels.v2 "") 0)
(check-expect (count-vowels.v2 "string") 1)
(check-expect (count-vowels.v2 "legendary") 3)

(define (count-vowels.v2 str)
  (+ (count-matches #\a (string->list str))
     (count-matches #\e (string->list str))
     (count-matches #\i (string->list str))
     (count-matches #\o (string->list str))
     (count-matches #\u (string->list str))))

;; count-matches : Object LOO -> Natural
;; Given an object and a LOO, produces the count of the object in the LOO

(define (count-matches obj loo)
  (cond
    [(empty? loo) 0]
    [else (if (equal? obj (first loo))
              (add1 (count-matches obj (rest loo)))
              (count-matches obj (rest loo)))]))