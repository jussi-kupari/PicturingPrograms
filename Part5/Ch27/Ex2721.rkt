;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2721) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 27.2.1
Develop a function rotate-colors that takes in an image and (using map-image) creates a new image
whose red component is the old green component, whose green component is the old blue component, and
whose blue component is the old red component. Use local to give names to the old red, green, and
blue components.|#

(require picturing-programs)

;; rotate-colors : Img -> Img
;; Given image, produces a new image where colors are rotated: green->red, blue->green, red->blue
(define (rotate-colors img)
  (map-image new-colors img))

;; new-colors : color -> color
;; Given a color, rotates the colors
(check-expect (new-colors (make-color 000 000 000)) (make-color 000 000 000))
(check-expect (new-colors (make-color 150 200 250)) (make-color 200 250 150))

(define (new-colors old-color)
  (local [(define old-red (color-red old-color))
          (define old-green (color-green old-color))
          (define old-blue (color-blue old-color))]
    (make-color old-green old-blue old-red)))

