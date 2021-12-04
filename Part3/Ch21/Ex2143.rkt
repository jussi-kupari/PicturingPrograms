;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2143) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.4.3
; Develop a function rec-before-1980? that takes in a CD and returns
; true or false depending on whether it was recorded before 1980.

(require picturing-programs)

(define-struct cd (title performer year tracks))
;; Cd is (make-cd (String String Natural Natural)
;; interp. a representation of a CD-record


;; rec-before-1980? : Cd -> Boolean
;; Given a Cd, produces true if recorded before 1980
(check-expect (rec-before-1980? (make-cd "Distintegration" "The Cure" 1989 12)) false)
(check-expect (rec-before-1980? (make-cd "Dirty Mind" "Prince" 1980 12)) false)
(check-expect (rec-before-1980? (make-cd "The Wall" "Pink Floyd" 1979 26)) true)

(define (rec-before-1980? album)
  (< (cd-year album) 1980))