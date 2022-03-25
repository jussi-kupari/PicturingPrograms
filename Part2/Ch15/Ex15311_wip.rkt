;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex15311_wip) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 15.3.11
Define a function simplify-colors that takes in an image and
produces an image the same size and shape: for each pixel in the given image, if it has
more red than green or blue, make the resulting pixel pure red; if it has more green than
red or blue, make it green; and if it has more blue than red or green, make it pure blue. In
case of ties, you can decide what to do: pick one of the three colors arbitrarily, or make
it white, or something like that.|#