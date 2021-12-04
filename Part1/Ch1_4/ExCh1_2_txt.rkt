;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ch1_2_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

.
.
.



; Ex 1.5.1

(beside . (flip-horizontal .))


; Ex 1.5.2
(beside . (flip-vertical .))



; Ex 1.5.3
(beside . (rotate-180 .))


; Ex 1.5.4

(beside (above . .) (above . .))


; Ex 1.5.5

(beside (above . (rotate-ccw .))
        (above (rotate-cw .) (rotate-180 .)))



; Ex 1.7.2

(beside (rotate-ccw .) (rotate-cw .))

(beside . .)




; Ex 2.1.2

(define SIX-CALS
  (beside
   (above . . .)
   (above . . .)))

SIX-CALS


; Ex 2.1.3
(define CAL .)
(define TWO-COPIES (beside CAL CAL))
(define SIX-COPIES (above TWO-COPIES TWO-COPIES TWO-COPIES))
SIX-COPIES


; Ex 2.4.4
; Why is (define snark boojum calendar) not a legal expression?
; calendar is defined, snark and boojum are not.
; "snark boojum" contains a space -> "snark-boojum" would be correct 




