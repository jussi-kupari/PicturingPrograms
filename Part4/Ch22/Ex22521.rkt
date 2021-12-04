;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex22521) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.21
; Write a data definition, including templates, for a list of lists of
; strings. Write several examples of this data type.


;; -- Data Definition

;; LOS (ListOfStrings) is one of:
;; - empty
;; - (cons string LOS)
;; interp. a list of strings

(define LOS1 empty)
(define LOS2 (cons "a" empty))
(define LOS3 (cons "a" (cons "b" empty)))
(define LOS4 (cons "a" (cons "b" (cons "c" empty))))


;; NELOS (NonEmptyListOfStrings) is one of:
;; - (cons string empty)
;; - (cons string LOS)
;; interp. a non-empty list of strings

;; LOLOS (ListOfListOfStrings) is one of:
;; - empty
;; - (cons LOS LOLOS)
;; interp. a list of LOS

;; NELOLOS (NonEmptyListOfListOfStrings) is one of:
;; - (cons NELOS empty)
;; - (cons NELOS LOLOS)
;; interp. a non-empty list of NELOS

(define LOLOS1 empty)
(define LOLOS2 (cons (cons "a" empty) empty))
(define LOLOS3
  (cons (cons "a" (cons "b" (cons "c" empty))) (cons (cons "c" (cons "d" empty)) empty)))



;; -- Functions

; Develop a function total-length that takes in a list of lists of strings and returns
; the total number of strings appearing in all the lists put together.



;; total-length : LOLOS -> Natural
;; Given a LOLOS, produces the total number of string is the LOLOS
(check-expect (total-length empty) 0)
(check-expect (total-length (cons (cons "a" empty) empty)) 1)
(check-expect (total-length (cons (cons "a" (cons "b" empty)) (cons (cons "c" empty) empty))) 3)

(define (total-length lolos)
  (cond
    [(empty? lolos) 0]
    [else (+ (length (first lolos))
             (total-length (rest lolos)))]))


; Develop a function longest that takes in a non-empty list of lists of strings and
; returns the longest of the lists. If there are two or more of the same maximum length, it
; may return either one at your choice.


;; longest : NELOLOS -> NELOS
;; Given a NELOLOS, produces the longest NELOS
(check-expect (longest LOLOS3) (cons "a" (cons "b" (cons "c" empty))))

(define (longest nelolos)
  (cond
    [(empty? (rest nelolos)) (first nelolos)]
    [else (if (longest-of-all? (first nelolos) (rest nelolos))
              (first nelolos)
              (longest (rest nelolos)))]))


;; longest-of-all? : NELOS NELOLOS -> Boolean
;; Given a NELOS and a NELOLOS, produces true if the NELOLOS is the longest of all
(check-expect
 (longest-of-all?
  (cons "a" empty)
  (cons (cons "a" (cons "b" empty)) (cons (cons "c" empty) empty))) false)
(check-expect
 (longest-of-all?
  (cons "a" (cons "b" empty))
  (cons (cons "a" (cons "b" empty)) (cons (cons "c" empty) empty))) true)
(check-expect
 (longest-of-all?
  (cons "a" (cons "b" (cons "c" empty)))
  (cons (cons "a" (cons "b" empty)) (cons (cons "c" empty) empty))) true)

(define (longest-of-all? nelos nelolos)
  (cond
    [(empty? (rest nelolos)) true]
    [else (if (>= (length nelos) (length (first nelolos)))
              (longest-of-all? nelos (rest nelolos))
              false)]))

