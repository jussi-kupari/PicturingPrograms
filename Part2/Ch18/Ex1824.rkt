;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1824) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 18.2.4
; Develop an animation of a disk whose radius increases by 1 when
; the user presses the up-arrow key, and decreases by 1 when the
; user presses the down-arrow key.

(require picturing-programs)

;; -- Constants

;Scene
(define SCENE (empty-scene 500 500))

;; -- Data Definition

;; Disk is a Natural [0, ]
;; interp. the radius of a disk

;; -- Functions

;; main : Disk -> Disk
(define (main d)
  (big-bang d
    (on-key next-disk)
    (to-draw render-disk)))

;; next-disk : Disk KeyEvent -> Disk
;; Given Disk and a key-event, produces the next disk
(check-expect (next-disk 50 "up") 51)
(check-expect (next-disk 50 "down") 49)
(check-expect (next-disk 50 "right") 50)

(define (next-disk d ke)
  (cond
    [(key=? ke "up") (add1 d)]
    [(key=? ke "down") (sub1 d)]
    [else d]))

;; render-disk : Disk -> Image
;; Given Disk, produces image of the disk on the scene
(check-expect (render-disk 20) (overlay (circle 20 "solid" "red") SCENE))

(define (render-disk d)
  (overlay (circle d "solid" "red") SCENE))