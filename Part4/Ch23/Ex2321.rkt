;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2321) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.2.1
; Develop a function substitute that takes in two strings and a list of strings, and returns a list the same
; length as the given list, but with all occurrences of the first string replaced by the second.
; 
; 


;; -- Data Definitions

;; LOS (List-Of-Strings) is one of:
;; - empty
;; - (cons String LOS)
;; interp. a list of strings


;; -- Functions

;; substitute : String String LOS -> LOS
;; Given two strings and a LOS, produces the LOS but replaces all occurresnces of the first string with the second.
(check-expect (substitute "old" "new" empty) empty)
(check-expect
 (substitute "old" "new" (cons "this"
                               (cons "that"
                                     (cons "old"
                                           (cons "new"
                                                 (cons "borrowed"
                                                       (cons "old"
                                                             (cons "blue" empty))))))))
 (cons "this"
       (cons "that"
             (cons "new"
                   (cons "new"
                         (cons "borrowed"
                               (cons "new"
                                     (cons "blue" empty))))))))


(define (substitute s1 s2 los)
  (cond
    [(empty? los) empty]
    [else
     (cons (if (string=? (first los) s1) s2 (first los))
           (substitute s1 s2 (rest los)))]))

