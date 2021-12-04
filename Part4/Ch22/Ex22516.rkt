;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex22516) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.16
; Develop an animation that displays a bull’s-eye pattern, as in Exercise 22.5.15,
; but each second, an additional ring will be added at a random radius.

(require picturing-programs)

;; -- Data Definition

;; LON (ListOfNumbers) is one of:
;; - empty
;; - (cons Number LON)
;; interp. a list of numbers

(define LON1 empty)
(define LON2 (cons 10 empty))
(define LON3 (cons 20 (cons 10 empty)))

;; template
#;
(define (fn-for-lon lon)
  (cond
    [(empty? lon) (...)]
    [else (... (first lon)
               ... (fn-for-lon (rest lon)))]))

;; -- Functions

;; main : lon -> lon
;; initialize with (main (cons 10 empty))

(define (main lon)
  (big-bang lon
    (on-tick next-lon 1)
    (to-draw render-image)))

;; next-lon : LON -> LON
;; Given lon, produces a new lon with random number added at the front (0, 100)

(define (next-lon lon)
  (cons (random 101) lon))

;; general-bullseye : LON -> Image
;; Given a LOS, produces an image of black concentric rings
(check-expect (general-bullseye empty) (circle 0 "solid" "white"))
(check-expect
 (general-bullseye (cons 10 (cons 5 empty)))
 (overlay (circle 10 "outline" "black")
          (overlay (circle 5 "outline" "black") (circle 0 "solid" "white"))))

(define (general-bullseye lon)
  (cond
    [(empty? lon) (circle 0 "solid" "white")]
    [else
     (overlay (circle (first lon) "outline" "black")
              (general-bullseye (rest lon)))]))

;; render-image : LOS -> Image
;; Given image of the bull's eye, produces it on top of the scene
(define (render-image los)
  (overlay (general-bullseye los) (empty-scene 200 200)))


