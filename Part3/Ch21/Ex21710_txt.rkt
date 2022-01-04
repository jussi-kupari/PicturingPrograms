;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex21710_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 21.7.10
; Write an animation with a “palette” containing four colored panels (say, red, green, blue, and white)
; down the left-hand side, and a “picture region”, initially all white, filling the rest of the animation
; window. When you click on any of the colored panels, a dot of that color starts moving with your mouse,
; and when you click the mouse anywhere in the picture region, the dot is left there; then you can go on
; and add more dots of that color, or pick up a different color and add some different-colored dots.
; 
; .

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 300 300))

;Panels
(define PANELS (above (square 50 "solid" "red")
                      (square 50 "solid" "green")
                      (square 50 "solid" "blue")
                      (frame (square 50 "solid" "white"))))

;Palette
(define PALETTE (place-image/align PANELS 0 0 "left" "top" SCENE))

;; -- Data Definition

(define-struct brushpalette (x y brush palette))
;; BrushPalette is (make-brushpalette Natural Natural Image Image)
;; interp. a BrushPalette with x- and y-position of cursor, brush head and the current Palette-image

(define BRUSH (make-brushpalette 100 100 (circle 0 "solid" "white") PALETTE))

;; -- Functions

;; main : BrushPalette -> BrushPalette
;; initiate with (main BRUSH)
(define (main bp)
  (big-bang bp
    (check-with brushpalette?)
    (on-mouse use-brush)
    (to-draw render-palette)))

;; use-brush : BrushPalette Number Number MouseEv -> BrushPalette
;; Given BP, xy-coordinates of mouse and mouse-event, produces next BrushPalette
(check-expect
 (use-brush
  (make-brushpalette 100 100 (circle 10 "solid" "white") PALETTE)
  50 20 "button-up") (make-brushpalette 50 20 (circle 10 "solid" "red") PALETTE))
(check-expect
 (use-brush
  (make-brushpalette 100 100 (circle 10 "solid" "white") PALETTE)
  50 75 "button-up") (make-brushpalette 50 75 (circle 10 "solid" "green") PALETTE))
(check-expect
 (use-brush
  (make-brushpalette 100 100 (circle 10 "solid" "white") PALETTE)
  50 75 "button-down") (make-brushpalette 50 75 (circle 10 "solid" "white") PALETTE))
(check-expect
 (use-brush
  (make-brushpalette 100 100 (circle 10 "solid" "white") PALETTE)
  50 75 "move") (make-brushpalette 50 75 (circle 10 "solid" "white") PALETTE))

(define (use-brush bp x y me)
  (cond
    [(and (in-red? x y) (mouse=? "button-up" me))
     (make-brushpalette x y (circle 10 "solid" "red") (brushpalette-palette bp))]
    [(and (in-green? x y) (mouse=? "button-up" me))
     (make-brushpalette x y (circle 10 "solid" "green") (brushpalette-palette bp))]
    [(and (in-blue? x y) (mouse=? "button-up" me))
     (make-brushpalette x y (circle 10 "solid" "blue") (brushpalette-palette bp))]
    [(and (in-white? x y) (mouse=? "button-up" me))
     (make-brushpalette x y (circle 10 "solid" "white") (brushpalette-palette bp))]
    [(mouse=? "button-up" me)
     (make-brushpalette x y (brushpalette-brush bp) (update-palette bp x y))]
    [else
     (make-brushpalette x y (brushpalette-brush bp) (brushpalette-palette bp))]))

;; update-palette : BrushPalette Number Number -> Image
;; Given BP and xy-coordinates, update BP to have correct palette
(check-expect
 (update-palette (make-brushpalette 99 99 (circle 10 "solid" "blue") PALETTE) 150 150)
 (place-image (circle 10 "solid" "blue") 150 150 PALETTE))

(define (update-palette bp x y)
  (place-image
   (brushpalette-brush bp)
   x y
   (brushpalette-palette bp)))

;; in-red? : Number Number -> Boolean
;; Given xy-coordinates, produces true if they are in the red zone
(check-expect (in-red? 30 50) true)
(check-expect (in-red? 30 51) false)
(check-expect (in-red? 30 50) true)
(check-expect (in-red? 50 50) true)
(check-expect (in-red? 51 50) false)

(define (in-red? x y)
  (and (<= 0 x 50) (<= 0 y 50)))

;; in-green? : Number Number -> Boolean
;; Given xy-coordinates, produces true if they are in the green zone
(check-expect (in-green? 30 51) true)
(check-expect (in-green? 30 100) false)
(check-expect (in-green? 30 99) true)
(check-expect (in-green? 50 99) true)
(check-expect (in-green? 51 99) false)

(define (in-green? x y)
  (and (<= 0 x 50) (< 50 y 100)))

;; in-blue? : Number Number -> Boolean
;; Given xy-coordinates, produces true if they are in the blue zone
(check-expect (in-blue? 30 101) true)
(check-expect (in-blue? 30 10) false)
(check-expect (in-blue? 30 149) true)
(check-expect (in-blue? 30 150) false)
(check-expect (in-blue? 50 149) true)
(check-expect (in-blue? 51 149) false)

(define (in-blue? x y)
  (and (<= 0 x 50) (< 100 y 150)))

;; in-white? : Number Number -> Boolean
;; Given xy-coordinates, produces true if they are in the white zone
(check-expect (in-white? 30 175) true)
(check-expect (in-white? 30 200) false)
(check-expect (in-white? 30 199) true)
(check-expect (in-white? 30 151) true)
(check-expect (in-white? 30 150) false)
(check-expect (in-white? 0 151) true)
(check-expect (in-white? 50 151) true)
(check-expect (in-white? 51 151) false)

(define (in-white? x y)
  (and (<= 0 x 50) (< 150 y 200)))

;; render-palette : BrushPalette -> Image
;; Given BrushPalette, renders an image of the current palette
(check-expect
 (render-palette (make-brushpalette 100 100 (circle 10 "solid" "green") PALETTE))
 (place-image (circle 10 "solid" "green") 100 100 PALETTE))

(define (render-palette bp)
  (place-image (brushpalette-brush bp)
               (brushpalette-x bp)
               (brushpalette-y bp)
               (brushpalette-palette bp)))