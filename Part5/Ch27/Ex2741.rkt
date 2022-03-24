;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2741) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Worked Exercise 27.4.1
Modify the solution to Exercise 7.8.12 so the amount of blue
increases smoothly from top to bottom, regardless of the height of the image.|#

(require picturing-programs)

;; apply-blue-gradient : Image -> Image
;; Given Image, produces the image with a smooth gradient of blue from top to bottom
(define (apply-blue-gradient pic)
  (local [(define (new-pixel x y old-color)
            (make-color (color-red old-color)
                        (color-green old-color)
                        (real->int (* 255 (/ y (image-height pic))))))]
    (map-image new-pixel pic)))