;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2713) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 27.1.3
Re-write the dot-grid function from Exercise 24.4.8 using local to
call itself only once. Does it work properly? Is it significantly faster|#

(require picturing-programs)

;; -- Constants

;Dot
(define DOT (circle 5 "solid" "red"))

;; -- Functions

;; dot-grid.v2 : Natural Natural -> Image
;; Given width and height, produces a grid of dots of those dimensions
(check-expect (dot-grid.v2 0 0) (circle 0 "solid" "white"))
(check-expect (dot-grid.v2 1 0) (circle 0 "solid" "white"))
(check-expect (dot-grid.v2 0 1) (circle 0 "solid" "white"))
(check-expect (dot-grid.v2 1 1) DOT)
(check-expect (dot-grid.v2 1 2) (above DOT (above DOT (circle 0 "solid" "white"))))
(check-expect
 (dot-grid 2 2)
 (above (beside DOT (beside DOT (circle 0 "solid" "white")))
        (above (beside DOT (beside DOT (circle 0 "solid" "white")))
               (circle 0 "solid" "white"))))

(define (dot-grid.v2 w h)
  (cond
    [(zero? h) (circle 0 "solid" "white")]
    [else
     (local [(define precomputed-grid (dot-grid.v2 w (binary-sub1 h)))]
       (above (render-dot-row w) precomputed-grid))]))

;; dot-grid : Natural Natural -> Image
;; Given width and height, produces a grid of dots of those dimensions
(check-expect (dot-grid 0 0) (circle 0 "solid" "white"))
(check-expect (dot-grid 1 0) (circle 0 "solid" "white"))
(check-expect (dot-grid 0 1) (circle 0 "solid" "white"))
(check-expect (dot-grid 1 1) DOT)
(check-expect (dot-grid 1 2) (above DOT (above DOT (circle 0 "solid" "white"))))
(check-expect
 (dot-grid 2 2)
 (above (beside DOT (beside DOT (circle 0 "solid" "white")))
        (above (beside DOT (beside DOT (circle 0 "solid" "white")))
               (circle 0 "solid" "white"))))

(define (dot-grid w h)
  (cond
    [(zero? h) (circle 0 "solid" "white")]
    [else
     (above (render-dot-row w) (dot-grid w (binary-sub1 h)))]))

;; render-dot-row : Natural -> Image
;; Given a natural, produces row of dots of that size
(check-expect (render-dot-row 0) (circle 0 "solid" "white"))
(check-expect (render-dot-row 1) DOT)
(check-expect (render-dot-row 2) (beside DOT (beside DOT (circle 0 "solid" "white"))))

(define (render-dot-row w)
  (cond
    [(zero? w) (circle 0 "solid" "white")]
    [else
     (beside DOT (render-dot-row (binary-sub1 w)))]))

;; Binary helpers
(define (ZER0 x) (* x 2))
(define (0NE x) (+ 1 (* x 2)))
(define (half x) (quotient x 2))

;; binary-add1 : Natural -> Natural
;; Given a Natural, produces the next larger Natural
(check-expect (binary-add1 0)   1)
(check-expect (binary-add1 1)   2)
(check-expect (binary-add1 2)   3)
(check-expect (binary-add1 3)   4)
(check-expect (binary-add1 4)   5)
(check-expect (binary-add1 10) 11)
(check-expect (binary-add1 30) 31)
(check-expect (binary-add1 41) 42)
(check-expect (binary-add1 98) 99)

(define (binary-add1 n) 
  (cond [(zero? n) 1]
        [(even? n) (0NE (half n))]
        [(odd? n) (ZER0 (binary-add1 (half n)))]))

;; binary-sub1 : Natural -> Natural
;; Given a natural, produces the natural that is one smaller
(check-expect (binary-sub1   0)   0)
(check-expect (binary-sub1   9)   8)
(check-expect (binary-sub1  10)   9)
(check-expect (binary-sub1 123) 122)

(define (binary-sub1 n)
  (find-one-smaller n (half n)))

;; find-one-smaller : Natural Natural -> Natural
;; Given two naturals, finds the natural that is one smaller than the first natural
(check-expect (find-one-smaller   0  0)   0)
(check-expect (find-one-smaller  10  0)   9)
(check-expect (find-one-smaller  10  6)   9)
(check-expect (find-one-smaller 111 70) 110)
(define (find-one-smaller n m)
  (cond
    [(zero? n) 0]
    [(equal? (binary-add1 m) n) m]
    [else (find-one-smaller n (binary-add1 m))]))

;(time (dot-grid 50 50)) =>cpu time: 31 real time: 32 gc time: 0
;(time (dot-grid.v2 50 50)) =>cpu time: 31 real time: 21 gc time: 15