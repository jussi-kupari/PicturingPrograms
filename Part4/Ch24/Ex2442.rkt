;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2442) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Exercise 24.4.2
Rewrite the copies function to take in a built-binary-whole.

Exercise 24.1.2
Develop a function copies that takes in a string and a built-whole,
and produces a list of that many copies of the string.|#

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

;; -- Data Definitions

;; List-of-String (LOS) is one of:
;; - empty
;; - (cons String LOS)

;; -- Functions

;; copies : String BBW -> LOS
(check-expect (copies "spam" 0) empty)
(check-expect (copies "spam" (0NE 0)) (list "spam"))
(check-expect (copies "spam" (ZER0 (0NE 0))) (list "spam" "spam"))
(check-expect (copies "spam" (ZER0 (0NE (0NE 0))))
              (list "spam" "spam" "spam" "spam" "spam" "spam"))
(check-expect (copies "spam" (0NE (0NE (0NE 0))))
              (list "spam" "spam" "spam" "spam" "spam" "spam" "spam"))

(define (copies s bbw)
  (cond [(equal? bbw 0) empty]
        [(zer0? bbw)
         (append (copies s (zer0-half bbw)) (copies s (zer0-half bbw)))]
        [(0ne? bbw)
         (cons "spam" (append (copies s (0ne-half bbw)) (copies s (0ne-half bbw))))]))