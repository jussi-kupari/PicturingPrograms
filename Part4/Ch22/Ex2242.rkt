;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2242) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 22.4.2
; Define a function count-strings that takes in a los and returns how many strings are in it:
; 0 for an empty list, 1 for a list of one element, and so on.

; Solution:
; We’ll write two functions: one that works on a los, and one that works on a nelos.

;; LOS (ListOfStrings) is one of:
;; - empty
;; - (cons string LOS)
;; interp. a list of strings

;; NELOS (NonEmptyListOfStrings) is one of:
;; - (cons string empty)
;; - (cons string NELOS)
;; interp. a non-empty list of strings

(define english (cons "hello" empty))
(define fr-eng (cons "bonjour" english))
(define heb-fr-eng (cons "shalom" fr-eng))
(define shfe (cons "buenos dias" heb-fr-eng))
(define ashfe (cons "salaam" shfe))
(define dwarfs (cons "sleepy"
                     (cons "sneezy"
                           (cons "dopey"
                                 (cons "doc"
                                       (cons "happy"
                                             (cons "bashful"
                                                   (cons "grumpy" empty))))))))

;; count-strings : LOS -> Natural
;; Given a LOS, produces the number of strings in the list
(check-expect (count-strings empty) 0)
(check-expect (count-strings english) 1)
(check-expect (count-strings fr-eng) 2)
(check-expect (count-strings ashfe) 5)
(check-expect (count-strings dwarfs) 7)

(define (count-strings los)
  (cond [(empty? los) 0]
        [else (count-strings-on-nelos los)]))

;; count-strings-nelos : NELOS -> Natural
;; Given a NELOS, prodices the number of strings in the list
;(check-expect (count-strings empty) 0) <- can’t call (count-strings-on-nelos empty)
(check-expect (count-strings-on-nelos english) 1)
(check-expect (count-strings-on-nelos fr-eng) 2)
(check-expect (count-strings-on-nelos ashfe) 5)
(check-expect (count-strings-on-nelos dwarfs) 7)

(define (count-strings-on-nelos nelos)
  (+ 1 (count-strings (rest nelos))))

;; count-strings-full : LOS -> Natural
;; Given a LOS, produces the number of strings in the list
(check-expect (count-strings empty) 0)
(check-expect (count-strings english) 1)
(check-expect (count-strings fr-eng) 2)
(check-expect (count-strings ashfe) 5)
(check-expect (count-strings dwarfs) 7)

(define (count-strings-full los)
  (cond
    [(empty? los) 0]
    [else (+ 1 (count-strings-full (rest los)))]))