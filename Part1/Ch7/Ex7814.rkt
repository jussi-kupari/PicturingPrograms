;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex7814) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 7.8.14
; Re-write some of exercises 7.8.1 through 7.8.7 using build-image
; instead of build3-image.


; Exercise 7.8.2
; Build a rectangle, 50 x 50, which shades smoothly from black at the top-
; left corner to purple (i.e. red plus blue) in the bottom-right corner. The top-right corner
; should be blue, and the bottom-left corner red.
; 
; ;red
; (check-expect (red-fn 0 50) 250)
; (check-expect (red-fn 50 20) 100)
; 
; (define (red-fn x y)
;   (* 5 y))
; 
; ;green
; (check-expect (green-fn 200 50) 0)
; (check-expect (green-fn 50 20) 0)
; 
; (define (green-fn x y) 0)
; 
; ;blue
; (check-expect (blue-fn 50 0) 250)
; (check-expect (blue-fn 20 20) 100)
; 
; (define (blue-fn x y)
;   (* 5 x))
; 
; (build3-image 50 50 red-fn green-fn blue-fn)


(require picturing-programs)

;; pixel-color : Number Number -> Color
;; Given xy, produces a color
(check-expect (pixel-color 20 20) (make-color 100 0 100))
(check-expect (pixel-color 0 0) (make-color 0 0 0))
(define (pixel-color x y)
  (make-color (* 5 y) 0 (* 5 x)))

(build-image 50 50 pixel-color)


; Exercise 7.8.4
; Build a rectangle, 100 x 100, which shades smoothly from red
; at the left edge to green at the right edge.
; 
; .
; 
; (require picturing-programs)
; 
; ;red
; (define (red-fn x y)
;   (real->int (- 250 (* 2.5 x))))
; 
; ;green
; (define (green-fn x y)
;   (real->int (* 2.5 x)))
; 
; ;blue
; (define (blue-fn x y) 0)
; 
; (build3-image 100 100 red-fn green-fn blue-fn)


;; pixel-color2 : Number Number -> Color
;; Given xy, produces a color
(check-expect (pixel-color2 20 20) (make-color 200 50 0))
(check-expect (pixel-color2 0 0) (make-color 250 0 0 255))
(define (pixel-color2 x y)

  (make-color (round(- 250 (* 2.5 x)))
              (round (real->int (* 2.5 x)))
              0))

(build-image 100 100 pixel-color2)
