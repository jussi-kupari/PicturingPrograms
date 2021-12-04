;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1161_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 11.6.1
; Develop a function build-house that draws a picture of a house
; 
; .
; 
; Hint: You may find it helpful to write some auxiliary functions
; that produce images, and others that produce numbers.

(require picturing-programs)

;; -- Constants

;Roof height
(define ROOF-HEIGHT 50)


;; -- Functions

;; Number Number String -> Image
;; Given width and height of walls and color, produces a house
(check-expect (assemble-house 100 50 "blue")
              (add-roof
               (add-door
                (build-walls 100 50 "blue") "blue") "blue"))

(define (assemble-house width height color)
  (add-roof
   (add-door
    (build-walls width height color)
    color)
   color))

;; Image String -> Image
;; Given walls, adds a correct sized roof
(check-expect (add-roof (build-walls 100 50 "red") "red")
              (above
               (flip-vertical (triangle/sss
                               (get-roof-side (build-walls 100 50 "red"))
                               (get-roof-side (build-walls 100 50 "red"))
                               (image-width (build-walls 100 50 "red"))
                               "outline"
                               "red"))
               (build-walls 100 50 "red")))

(define (add-roof img color)
  (above
   (flip-vertical (triangle/sss
                   (get-roof-side img)
                   (get-roof-side img)
                   (image-width img)
                   "outline"
                   color))
   img))


;; Image -> Number
;; Given the image of house walls and roof height, produces length of roof side

(define (get-roof-side img)
  (sqrt (+ (sqr ROOF-HEIGHT)
           (sqr (/ (image-width img) 2)))))



;; Image String-> Image
;; Given an image (walls) and color, adds a door to the house frame
(check-expect (add-door (build-walls 100 50 "red") "red")
              (overlay/align "center" "bottom"
                             (rectangle 15 30 "outline" "red")
                             (build-walls 100 50 "red")))

(define (add-door img color)
  (overlay/align "center" "bottom"
                 (rectangle 15 30 "outline" color)
                 img))



;; Number Number String -> Image
;; Given width and height of walls and color, produces the walls
(check-expect (build-walls 200 50 "red")
              (rectangle 200 50 "outline" "red"))

(define (build-walls width height color)
  (rectangle width height "outline" color))

