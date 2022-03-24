;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2742) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 27.4.2 Develop a function add-red that takes in a number and an image,
and adds that number to the red component of every pixel in the image. (Remember to
keep the red component below 256.)|#

(require picturing-programs)

;; add-red : Number Image -> Image
;; Given number and image, produces the image with the number added to the red component in every pixel

(define (add-red n img)
  (local [(define (new-colors x y old-color)
            (make-color
             (real->int
              (if (<= (+ n (color-red old-color)) 255)
                 (+ n (color-red old-color)) 255))
             (color-green old-color)
             (color-blue old-color)))]
    (map-image new-colors img)))


;; new-colors-fixed-number : Number Number Color -> Color
;; Given x, y and old color, produces new color with 10 added to red component
(check-expect (new-colors-fixed-number 0 0 (make-color 100 100 100)) (make-color 110 100 100))
(check-expect (new-colors-fixed-number 0 0 (make-color 240 100 70)) (make-color 250 100 70))
(check-expect (new-colors-fixed-number 0 0 (make-color 250 100 70)) (make-color 255 100 70))

(define (new-colors-fixed-number x y old-color)
            (make-color
             (real->int
              (if (<= (+ 10 (color-red old-color)) 255)
                 (+ 10 (color-red old-color)) 255))
             (color-green old-color)
             (color-blue old-color)))