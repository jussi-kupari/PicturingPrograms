;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2075_2076) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.7.5 Re-do some of the exercises from Section 7.8 using build-image in-
; stead of build3-image.  <-- Already did in Ex7.8.14
; 
; Exercise 20.7.6 Re-do some of the exercises from Section 7.8 using map-image instead
; of map3-image.


; Worked Exercise 7.8.8
; Choose an interesting picture (preferably a photograph) and build a version
; of it with all the red removed, leaving only the green and blue components.
; 
; (require picturing-programs)
; 
; 
; ;; red-fn : Number Number Number Number Number -> Number
; ;; Given x, y, red, green, blue; produces the red at the xy
; (check-expect (red-fn 10 20 30 40 50) 0)
; (check-expect (red-fn 1000 100 250 125 0) 0)
; (define (red-fn x y r g b) 0)
; 
; 
; ;; green-fn : Number Number Number Number Number -> Number
; ;; Given x, y, red, green, blue; produces the green at the xy
; (check-expect (green-fn 10 20 30 40 50) 40)
; (check-expect (green-fn 1000 100 250 125 0) 125)
; (define (green-fn x y r g b) g)
; 
; 
; ;; blue-fn : Number Number Number Number Number -> Number
; ;; Given x, y, red, green, blue; produces the blue at the xy
; (check-expect (blue-fn 10 20 30 40 50) 50)
; (check-expect (blue-fn 1000 100 250 125 0) 0)
; (define (blue-fn x y r g b) b)
; 
; 
; (map3-image red-fn green-fn blue-fn pic:bloch)

(require picturing-programs)

;; remove-red : Color -> Color
;; Given a color, removes the red component
(check-expect (lose-red (make-color 255 255 255)) (make-color 0 255 255))

(define (lose-red c)
  (make-color 0 (color-green c) (color-blue c)))


;; remove-red : Image -> Image
(check-expect (remove-red (square 50 "solid" "red")) (square 50 "solid" "black"))
(check-expect (remove-red (square 50 "solid" "blue")) (square 50 "solid" "blue"))

(define (remove-red img)
  (map-image lose-red img))
