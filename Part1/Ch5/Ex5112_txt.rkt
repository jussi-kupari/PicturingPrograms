;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex5112_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

; Exercise 5.11.2
; Add a body to the pinwheel function of Exercise 5.9.3.


; pinwheel: image -> image
; Produces four copies of the original image in a square
; starting with the original image on the top left and
; rotating 90 deg cw for each successive image (clock-wise)
( check-expect (pinwheel .)
               (beside
   (above . (rotate-ccw .))
   (above (rotate-cw .) (rotate-180 .))))

#;
(define (pinwheel img)
  ; img image
  ...)


(define (pinwheel img)
  (beside
   (above img (rotate-ccw img))
   (above (rotate-cw img) (rotate-180 img))))