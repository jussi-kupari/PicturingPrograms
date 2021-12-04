;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2231) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Practice Exercise 22.3.1
; Copy Figure 22.1 into your Definitions pane (it should be
; available as a download from the textbook Web site), and try the following expressions.
; For each one, predict what it will return before hitting ENTER, and see whether you were
; right. If not, figure out why it came out as it did.


; An empty list has no parts.
(define-struct empty-list ())
; make-empty-list : nothing -> empty-list
; empty-list? : anything -> boolean

; A nelos has two parts: first (a string) and rest (a los).
(define-struct nelos (first rest))
; make-nelos : string los -> nelos
; nelos-first : nelos -> string
; nelos-rest : nelos -> los
; nelos? : anything -> boolean
#|
(define (function-on-nelos L)
; L a nelos
; (nelos-first L) a string
; (nelos-rest L) a los
; (function-on-los (nelos-rest L)) whatever this returns
...)
|#
; A los is either an empty-list or a nelos.
#|
(define (function-on-los L)
; L a los
(cond [(empty-list? L) ...]
[(nelos? L) (function-on-nelos L)]
))
|#
(define nothing (make-empty-list))
(define english (make-nelos "hello" nothing))
(define fr-eng (make-nelos "bonjour" english))
(define heb-fr-eng (make-nelos "shalom" fr-eng))
(define shfe (make-nelos "buenos dias" heb-fr-eng))
(define ashfe (make-nelos "salaam" shfe))
(define dwarfs (make-nelos "sleepy" (make-nelos "sneezy"
(make-nelos "dopey" (make-nelos "doc" (make-nelos "happy"
(make-nelos "bashful" (make-nelos "grumpy" nothing))))))))




(empty-list? nothing)                                      ;true
(nelos? nothing)                                           ;false
;(nelos-first nothing)                                     ;error
;(nelos-rest nothing)                                      ;error
(empty-list? english)                                      ;false
(nelos? english)                                           ;true
(nelos-first english)                                      ;"hello"  
(nelos-rest english)                                       ;(make-empty-list)
(empty-list? (nelos-rest english))                         ;true
(nelos? fr-eng)                                            ;true
(nelos-first fr-eng)                                       ;"bonjour"
(nelos-rest fr-eng)                                        ;(make-nelos "hello" (make-empty-list))
(nelos? (nelos-rest fr-eng))                               ;true
(nelos-first (nelos-rest fr-eng))                          ;"hello" 
(nelos-rest (nelos-rest fr-eng))                           ;(make-empty-list) 
(nelos? ashfe)                                             ;true 
(nelos-first ashfe)                                        ;"salaam" 
(nelos-rest ashfe)                                         ;(make-nelos "buenos dias" heb-fr-eng) 
(nelos-first (nelos-rest (nelos-rest ashfe)))              ;"shalom 
(nelos-first (nelos-rest (nelos-rest (nelos-rest dwarfs))));"doc 




