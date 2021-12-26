;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2444) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Exercise 24.4.4
Develop a function bbw-value that takes in a built-binary-whole
and returns the (ordinary) whole number that it represents. For example,
(check-expect (binary-whole-value 0) 0)
(check-expect (binary-whole-value (0NE 0)) 1)
(check-expect (binary-whole-value (ZER0 (0NE (0NE (ZER0 (0NE 0)))))) 22)


Some help from Wikipedia
(https://en.wikipedia.org/wiki/Binary_number)
In the binary system, each digit represents an increasing power of 2,
with the rightmost digit representing 20, the next representing 21, then 22, and so on.
The value of a binary number is the sum of the powers of 2 represented by each "1" digit.
For example, the binary number 100101 is converted to decimal form as follows:

1001012 = [ ( 1 ) × 2^5 ] + [ ( 0 ) × 2^4 ] + [ ( 0 ) × 2^3 ] + [ ( 1 ) × 2^2 ] +
          [ ( 0 ) × 2^1 ] + [ ( 1 ) × 2^0 ]

1001012 = [ 1 × 32 ] + [ 0 × 16 ] + [ 0 × 8 ] + [ 1 × 4 ] + [ 0 × 2 ] + [ 1 × 1 ]

1001012 = 3710

|#

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

;; binary-whole-value : BBW -> Natural
;; Given a BBW, produces the correspoding natural number
(check-expect (binary-whole-value (ZER0 0))                     0)
(check-expect (binary-whole-value (0NE 0))                      1)
(check-expect (binary-whole-value (ZER0 (0NE 0)))               2)                       
(check-expect (binary-whole-value (0NE (0NE 0)))                3)
(check-expect (binary-whole-value (ZER0 (ZER0 (0NE 0))))        4)
(check-expect (binary-whole-value (0NE (ZER0 (0NE 0))))         5)             
(check-expect (binary-whole-value (ZER0 (0NE (0NE 0))))         6)                 
(check-expect (binary-whole-value (0NE (0NE (0NE 0))))          7)         
(check-expect (binary-whole-value (ZER0 (ZER0 (ZER0 (0NE 0))))) 8) 
(check-expect (binary-whole-value (0NE (ZER0 (ZER0 (0NE 0)))))  9)  
(check-expect (binary-whole-value (ZER0 (0NE (ZER0 (0NE 0))))) 10)   
(check-expect (binary-whole-value (0NE (0NE (ZER0 (0NE 0)))))  11)   
(check-expect (binary-whole-value (ZER0 (ZER0 (0NE (0NE 0))))) 12)   
(check-expect (binary-whole-value (0NE (ZER0 (0NE (0NE 0)))))  13)    
(check-expect (binary-whole-value (ZER0 (0NE (0NE (0NE 0)))))  14)

(define (binary-whole-value bbw)
  (get-sum-of-two-to-powers bbw 0))

;; get-sum-of-two-to-powers : BBW Number -> Natural
;; Given a BBW and a number (ALWAYS ZERO), produces the sum of two-to-power values
(check-expect (get-sum-of-two-to-powers (0NE (ZER0 (0NE (0NE 0)))) 0)  13)    
(check-expect (get-sum-of-two-to-powers (ZER0 (0NE (0NE (0NE 0)))) 0)  14)
(define (get-sum-of-two-to-powers bbw n)
  (cond
    [(equal? 0 bbw) 0]
    [else (cond
            [(zer0? bbw)
             (+ (* 0 (expt 2 n)) (get-sum-of-two-to-powers (zer0-half bbw) (add1 n)))]
            [(0ne? bbw)
             (+ (* 1 (expt 2 n)) (get-sum-of-two-to-powers (0ne-half bbw) (add1 n)))])]))






