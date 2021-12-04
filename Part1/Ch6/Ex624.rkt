;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex624) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Practice Exercise 6.2.4
; Make up some other variations: different time intervals, dif-
; ferent pictures, different functions in place of rotate-cw. (Note that the only functions
; that make sense here are functions that take in one image and return another — for
; example, rotate-cw and flip-vertical but not beside or overlay/xy.)
; 
; What happens if you change the solution to Exercise 6.2.1 to use a colored background?
; What if the background isn’t a square (say, it’s wider than it is high)? What if the calendar
; isn’t in the center? If you don’t like the results of some of these, we’ll see later how to fix
; them.


(require picturing-programs)

(big-bang (overlay pic:book (circle 100 "solid" "green"))
  (on-tick flip-vertical 1.5)
  (to-draw show-it))



