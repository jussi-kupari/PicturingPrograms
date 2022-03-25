;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex15310_wip) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 15.3.10
Develop a function make-diag-stripes that takes in a width and
height (in pixels), and produces a rectangle that size and shape filled with stripes running
from upper-right to lower-left.|#

(require picturing-programs)
