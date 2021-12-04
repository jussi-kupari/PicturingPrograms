;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2322) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 23.2.2
; Develop a function remove-all that takes in a string and a list of strings, and returns the same list but
; with all occurrences (if there are any) of the given string removed.
; 
; For example,
; (check-expect
; (remove-all "old" (cons "this (cons "that" (cons "old"
; (cons "new" (cons "borrowed" (cons "old"
; (cons "blue" empty))))))))
; (cons "this" (cons "that" (cons "new" (cons "borrowed"
; (cons "blue" empty)))))))


;; -- Data Definitions

;; LOS (List-Of-Strings) is one of:
;; - empty
;; - (cons String LOS)
;; interp. a list of strings


;; -- Functions

;; remove-all-occurrences : String LOS -> LOS
;; Given a string and a LOS, produces the same LOS with all occurrences of the string removed.
(check-expect (remove-all-occurrences "old" empty) empty)

(check-expect (remove-all-occurrences "old"
                                      (cons "this"
                                            (cons "that"
                                                  (cons "old"
                                                        (cons "new"
                                                              (cons "borrowed"
                                                                    (cons "old"
                                                                          (cons "blue" empty))))))))
              (cons "this"
                    (cons "that"
                          (cons "new"
                                (cons "borrowed"
                                      (cons "blue" empty))))))


(define (remove-all-occurrences s los)
  (cond
    [(empty? los) empty]
    [else (if (string=? (first los) s)
              (remove-all-occurrences s (rest los))
              (cons (first los) (remove-all-occurrences s (rest los))))]))

