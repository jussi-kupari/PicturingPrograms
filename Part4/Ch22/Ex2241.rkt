;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2241) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Practice Exercise 22.4.1
; Copy Figure 22.2 into your Definitions pane (it should be
; available as a download from the textbook Web site), and try the following expressions.
; For each one, predict what it will return before hitting ENTER, and see whether you were
; right. If not, figure out why it came out as it did.

;; LOS (ListOfStrings) is one of:
;; - empty
;; - (cons string LOS)
;; interp. a list of strings

(define english (cons "hello" empty))
(define fr-eng (cons "bonjour" english))
(define heb-fr-eng (cons "shalom" fr-eng))
(define shfe (cons "buenos dias" heb-fr-eng))
(define ashfe (cons "salaam" shfe))
(define dwarfs (cons "sleepy" (cons "sneezy" (cons "dopey" (cons "doc"
(cons "happy" (cons "bashful" (cons "grumpy" empty))))))))

(empty? empty) ;true
(cons? empty) ;false
;(first empty) ;error
;(rest empty) ;error
(empty? english) ;false
(cons? english) ;true
(first english) ;"hello"
(rest english) ;empty
(empty? (rest english)) ;true 
(cons? fr-eng) ;true
(first fr-eng) ;"bonjour"
(rest fr-eng) ;(cons "hello" empty)
(cons? (rest fr-eng)) ;true
(first (rest fr-eng)) ;"hello"
(rest (rest fr-eng)) ;empty 
(cons? ashfe) ;true
(first ashfe) ;"salaam"
(rest ashfe) ; (cons "buenos dias" (cons "shalom" (cons "bonjour" (cons "hello" empty))))
(first (rest (rest ashfe))) ;"shalom"
(first (rest (rest (rest dwarfs)))) ;"doc"