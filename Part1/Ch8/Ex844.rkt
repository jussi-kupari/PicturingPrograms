;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex844) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 8.4.4
; Write an animation in which a red disk — say,
; (circle 15 "solid" "red")
; — alternates every second between x-coordinate 20 and x-coordinate 60 on a fixed back-
; ground picture. (Try
; (beside (circle 20 "solid" "blue") (circle 20 "solid" "green"))
; as the background picture.)


(require picturing-programs)

;; Alternating image of RGB disks

;; -- Constants

(define DISK (circle 15 "solid" "red"))

(define SCENE (beside (circle 20 "solid" "blue") (circle 20 "solid" "green")))


;; -- Data Definition

;; Pos is one of:
;; - 20
;; - 60
;; interp. the x-position of red disk

#;
(define (fn-for-pos pos)
  (cond
    [(equal? pos 20) (...)]
    [(equal? pos 60) (...)]))

;; Template rules used
;; - one of: 2 cases
;; - atomic distinct: 20
;; - atomic distinct: 60


;; -- Functions

;; Main
(define (main pos)
  (big-bang pos
    (on-tick next-pos 1)
    (to-draw render-image)))


;; Pos -> Pos
;; Given Pos, produce next Pos (20->60->20->60)
(check-expect (next-pos 20) 60)
(check-expect (next-pos 60) 20)

(define (next-pos pos)
  (cond
    [(equal? pos 20) 60]
    [(equal? pos 60) 20]))

;; Pos -> Image
;; Given Pos, produce image of the world

(define (render-image pos)
  (place-image DISK pos 20 SCENE))








