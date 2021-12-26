;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2443) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.4.3
Develop a function binary-add1 that takes in a built-binary-whole and returns the
next larger built-binary-whole. For example, the next larger whole after 5 is 6, so

(check-expect (binary-add1 (S1 (S0 (S1 0)))) (S0 (S1 (S1 0))))

This solutions feels like a terrible hack...|#

;; == Definitions from before ==

;; -- Data Definitions

;; Binary-Whole-Number (BWN) is one of:
;; - 0
;; - zer0 (whole)
;; - 0ne (whole)
;; interp. where 0 means the number is 0,
;; zer0 means a zero at the end of the number and
;; 0ne mean a one at the end of the number

;; Built-Binary-Whole (BBW) is one of:
;; - 0
;; (zer0 BBW)
;; (0ne BBW)
;; interp. a number defined in binary

#| Template
(define (fn-for-bbw bbw)
  (cond
    [(equal? 0 bbw) (...)]
    [(zer0? (...) (fn-on-bbw (zer0-half bbw)))]
    [(0ne?  (...) (fn-on-bbw (0ne-half bbw)))]))|#

(define-struct zer0 (half))
;; zer0 is (make-zer0 BBW)
;; interp. binary with a zero at the end

(define ZB1 (make-zer0 0))
(define ZB2 (make-zer0 ZB1))

(define-struct 0ne (half))
;; 0ne is (make-0ne BBW)
;; interp. binary with a one at the end

(define OB1 (make-0ne ZB2))
(define OB2 (make-0ne OB1))

;; -- Functions

;; ZER0 : BBW -> BBW
;; Given a BBW, produces a new BBW with an added zero at the end.
(check-expect (ZER0 OB2) (make-zer0 (make-0ne (make-0ne (make-zer0 (make-zer0 0))))))

(define (ZER0 bbw)
  (make-zer0 bbw))

;; 0NE : BBW -> BBW
;; Given a BBW, produces a new BBW with an added one at the end.
(check-expect (0NE OB2) (make-0ne (make-0ne (make-0ne (make-zer0 (make-zer0 0))))))

(define (0NE bbw)
  (make-0ne bbw))

;; ===== Exercise starts here =====

;; -- Functions

;; binary-add1 : BBW -> BBW
;; Given a BBW, produces the next larger BBW
(check-expect (binary-add1 (ZER0 0)) (0NE 0))                                         ;1
(check-expect (binary-add1 (0NE 0)) (ZER0 (0NE 0)))                                   ;2
(check-expect (binary-add1 (ZER0 (0NE 0))) (0NE (0NE 0)))                             ;3
(check-expect (binary-add1 (0NE (0NE 0))) (ZER0 (ZER0 (0NE 0))))                      ;4
(check-expect (binary-add1 (ZER0 (ZER0 (0NE 0)))) (0NE (ZER0 (0NE 0))))               ;5
(check-expect (binary-add1 (0NE (ZER0 (0NE 0)))) (ZER0 (0NE (0NE 0))))                ;6
(check-expect (binary-add1 (ZER0 (0NE (0NE 0)))) (0NE (0NE (0NE 0))))                 ;7
(check-expect (binary-add1 (0NE (0NE (0NE 0)))) (ZER0 (ZER0 (ZER0 (0NE 0)))))         ;8
(check-expect (binary-add1 (ZER0 (ZER0 (ZER0 (0NE 0))))) (0NE (ZER0 (ZER0 (0NE 0))))) ;9
(check-expect (binary-add1 (0NE (ZER0 (ZER0 (0NE 0))))) (ZER0 (0NE (ZER0 (0NE 0)))))  ;10
(check-expect (binary-add1 (ZER0 (0NE (ZER0 (0NE 0))))) (0NE (0NE (ZER0 (0NE 0)))))   ;11
(check-expect (binary-add1 (0NE (0NE (ZER0 (0NE 0))))) (ZER0 (ZER0 (0NE (0NE 0)))))   ;12
(check-expect (binary-add1 (ZER0 (ZER0 (0NE (0NE 0))))) (0NE (ZER0 (0NE (0NE 0)))))   ;13
(check-expect (binary-add1 (0NE (ZER0 (0NE (0NE 0))))) (ZER0 (0NE (0NE (0NE 0)))))    ;14
(check-expect (binary-add1 (ZER0 (0NE (0NE (0NE 0))))) (0NE (0NE (0NE (0NE 0)))))     ;15

(define (binary-add1 bbw)
  (cond
    [(all-0ne? bbw) (increment-bbw bbw)]
    [(zer0? bbw) (0NE (zer0-half bbw))]
    [(and (0ne? bbw) (zer0? (0ne-half bbw)))
     (ZER0 (0NE (zer0-half (0ne-half bbw))))]
    [(and (0ne? bbw) (0ne? (0ne-half bbw)))
     (ZER0 (binary-add1 (0ne-half bbw)))]))

;; increment-bbw : BBW -> BBW
;; Given a BBW that is all 0nes, increment to next larger binary
(check-expect (increment-bbw (0NE (0NE 0))) (ZER0 (ZER0 (0NE 0))))
(check-expect (increment-bbw (0NE (0NE (0NE 0)))) (ZER0 (ZER0 (ZER0 (0NE 0)))))

(define (increment-bbw bbw)
  (cond
    [(equal? (0ne-half bbw) 0) (ZER0 (0NE 0))]
    [ else (ZER0 (increment-bbw (0ne-half bbw)))]))

;; all-0ne? : BBW -> Boolean
;; Given a BBW, produces true if all the BWNs are 0nes.
(check-expect (all-0ne? (ZER0 (0NE 0))) false)
(check-expect (all-0ne? (0NE (0NE 0))) true)
(check-expect (all-0ne? (0NE (0NE (0NE 0)))) true)
(check-expect (all-0ne? (ZER0 (0NE (0NE 0)))) false)

(define (all-0ne? bbw)
  (cond
    [(zer0? bbw) false]
    [(equal? bbw 0) true]
    [else (all-0ne? (0ne-half bbw))]))