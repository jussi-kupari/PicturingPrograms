;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex22514) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.5.14
; Develop a function general-bullseye that takes in a list of numbers
; and produces a white image with black concentric rings at those radii.
; Hint: I recommend using an empty image like (circle 0 "solid" "white") as the
; answer for the empty case.

(require picturing-programs)

;; -- Data Definition

;; LON (ListOfNumbers) is one of:
;; - empty
;; - (cons Number LON)
;; interp. a list of numbers

(define LON1 empty)
(define LON2 (cons 1 empty))
(define LON3 (cons 1 (cons 2 empty)))

;; template
#;
(define (fn-for-lon lon)
  (cond
    [(empty? lon) (...)]
    [else (... (first lon)
               ... (fn-for-lon (rest lon)))]))

;; -- Functions

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