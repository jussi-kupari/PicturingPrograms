;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1714) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 17.1.4
; Develop a traffic-light animation like Exercise 17.1.1, but using an
; image as the model. 

(require picturing-programs)

;; -- Constants

;Green
(define GREEN (circle 30 "solid" "green"))
;Yellow
(define YELLOW (circle 30 "solid" "yellow"))
;Red
(define RED (circle 30 "solid" "red"))

;; -- Data Definition

;; TrafficLight is an image and one of GREEN, YELLOW, RED
;; interp. a solid colored circle (gree, yellow or red)


;; -- Functions

;; main : Image -> Image
(define (main tl)
  (big-bang tl
    (check-with image?)
    (on-tick next-light 2)
    (to-draw render-light)))

;; next-light : TrafficLight -> TrafficLight
;; Given a TrafficLight, produces the next TrafficLight
(check-expect (next-light GREEN) YELLOW)
(check-expect (next-light YELLOW) RED)
(check-expect (next-light RED) GREEN)

(define (next-light tl)
  (cond
    [(image=? tl GREEN) YELLOW]
    [(image=? tl YELLOW) RED]
    [(image=? tl RED) GREEN]))


;; render-light : TrafficLight -> TrafficLight
;; Given a TrafficLight, produces the same TrafficLight
(define (render-light tl)
  tl)

; Develop a traffic-light animation like Exercise 17.1.1,
; but using a number as the model (say, 1=green, 2=yellow, 3=red).



;; -- Data Definition

;; TL is a Natural and one of: 1 = "green", 2 = "yellow" and 3 = "red"

;; -- Functions

;; main : TL -> TL
(define (main2 tl)
  (big-bang tl
    (check-with number?)
    (on-tick next-light2 2)
    (to-draw render-light2)))

;; next-light : TL -> TL
;; Given a TL, produces the next TL
(check-expect (next-light2 1) 2)
(check-expect (next-light2 2) 3)
(check-expect (next-light2 3) 1)

(define (next-light2 tl)
  (cond
    [(= tl 1) 2]
    [(= tl 2) 3]
    [(= tl 3) 1]))


;; render-light : Image -> Image
;; Given a TrafficLight, produces the same TrafficLight
(define (render-light2 tl)
  (cond
    [(= tl 1) GREEN]
    [(= tl 2) YELLOW]
    [(= tl 3) RED]))


























