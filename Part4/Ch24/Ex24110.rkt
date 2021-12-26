;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex24110) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 24.1.10
Develop a function named dot-grid (remember this from Chapter 5?) that takes two
whole numbers width and height and produces a rectangular grid
of circles with width columns and height rows.|#

(require picturing-programs)

;; -- Constants

;Dot
(define DOT (circle 5 "solid" "red"))

;; -- Functions

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
     (above (render-dot-row w) (dot-grid w (sub1 h)))]))


;; render-dot-row : Natural -> Image
;; Given a natural, produces row of dots of that size
(check-expect (render-dot-row 0) (circle 0 "solid" "white"))
(check-expect (render-dot-row 1) DOT)
(check-expect (render-dot-row 2) (beside DOT (beside DOT (circle 0 "solid" "white"))))

(define (render-dot-row w)
  (cond
    [(zero? w) (circle 0 "solid" "white")]
    [else
     (beside DOT (render-dot-row (sub1 w)))]))
