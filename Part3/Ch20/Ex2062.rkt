;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2062) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 20.6.2
;You may notice that four of the five cases in the final version of the
;definition share the pattern (add-posns where some-posn ) Even the remaining
;example could be fit into this pattern by adding (make-posn 0 0). This common
;pattern suggests that the function definition could be simplified by “factoring out”
;the add-posns, moving it outside the cond so the cond decides only what to use as the
;second argument to add-posns. Try this. Compare the length of the resulting function
;with the length of the function definition in Exercise 20.6.1 above.