;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2078) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 20.7.8
Develop a function replace-with-white which takes in a color and
an image, and replaces every pixel in the image that is the specified
color with white. In other words, if we had this function, we could write
replace-green-white as

(define (replace-green-white pic)
(replace-with-white "green" pic))

Hint: The helper function in this case needs to know what color to replace,
i.e. the color parameter of replace-with-white. One way to do this is to
build-image/extra or map-image/extra (look them up).|#

(require picturing-programs)

;; replace-with-white : Color Image -> Image
;; Given a color and an image, replaces all pixels of the color with white
(check-expect
 (replace-with-white "green" (square 30 "solid" "green")) (square 30 "solid" "white"))
(check-expect
 (replace-with-white "green" (square 30 "solid" "blue")) (square 30 "solid" "blue"))

(define (replace-with-white color img)
  (map-image/extra color->white img color))

;; color->white : Number Number Color Color -> Color
;; Given xy and color, replaces it with pure white if it is of given color
(check-expect
 (color->white 0 0(make-color 200 255 55) (make-color 200 255 55)) (make-color 255 255 255))
(check-expect
 (color->white 0 0(make-color 0 255 0) (make-color 55 255 55)) (make-color 0 255 0))

(define (color->white x y c1 c2)
  (cond
    [(color=? c1 c2) (make-color 255 255 255)]
    [else c1]))