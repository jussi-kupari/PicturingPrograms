;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2077) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 20.7.7
; Develop a function replace-green-white which replaces every pure-green
; pixel in an image with a pure-white pixel.
; 
; Hint: This will be easier than it would be with map3-image because you can use
; color=?.

(require picturing-programs)

;; green->white : Number Number Color -> Color
;; Given xy and color, replaces it with pure white if it is pure green
(check-expect (green->white 0 0(make-color 200 255 55)) (make-color 200 255 55))
(check-expect (green->white 0 0(make-color 0 255 0)) (make-color 255 255 255))

(define (green->white x y c)
  (cond
    [(color=? c (make-color 0 255 0)) (make-color 255 255 255)]
    [else c]))



;; replace-green-white : Image -> Image
(check-expect (replace-green-white (square 50 "solid" "green")) (square 50 "solid" "white"))
(check-expect (replace-green-white (square 50 "solid" "blue")) (square 50 "solid" "blue"))

(define (replace-green-white img)
  (map-image green->white img))

pic:book
(replace-green-white pic:book)