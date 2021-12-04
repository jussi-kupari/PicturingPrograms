;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex788) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Worked Exercise 7.8.8
; Choose an interesting picture (preferably a photograph) and build a version
; of it with all the red removed, leaving only the green and blue components.

(require picturing-programs)


;; red-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the red at the xy
(check-expect (red-fn 10 20 30 40 50) 0)
(check-expect (red-fn 1000 100 250 125 0) 0)
(define (red-fn x y r g b) 0)


;; green-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the green at the xy
(check-expect (green-fn 10 20 30 40 50) 40)
(check-expect (green-fn 1000 100 250 125 0) 125)
(define (green-fn x y r g b) g)


;; blue-fn : Number Number Number Number Number -> Number
;; Given x, y, red, green, blue; produces the blue at the xy
(check-expect (blue-fn 10 20 30 40 50) 50)
(check-expect (blue-fn 1000 100 250 125 0) 0)
(define (blue-fn x y r g b) b)


(map3-image red-fn green-fn blue-fn pic:bloch)


