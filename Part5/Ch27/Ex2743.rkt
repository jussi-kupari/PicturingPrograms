;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex2743) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 27.4.3
Develop a function substitute-color that takes in two colors and
an image, and replaces every pixel which is the first color with the second color.

Note: At first I had a col1 variable in both the outer and inner functions and that caused the
(color=? col1 (get-pixel-color x y img)) to evaluate to
(color=? (get-pixel-color x y img) (get-pixel-color x y img))

which made the evaluation always #true and all the pixels turn to col2.
Then I just added a "throwaway variable" (z) to the inner function and that solved it|#

(require picturing-programs)

;; substitute-color : Color Color Image -> Image
;; Given two colors and image, replaces every pixel of the first color with the second color

(define (substitute-color col1 col2 img)
  (local [(define (switch-colors x y z)
            (cond
              [(color=? col1 (get-pixel-color x y img)) col2]
              [else (get-pixel-color x y img)]))]
    (map-image switch-colors img)))
