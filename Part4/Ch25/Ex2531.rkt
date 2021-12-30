;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex2531) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|Worked Exercise 25.3.1
Suppose the list-ref function weren’t built into DrRacket;
how would we write it? Since list-ref is built in, we’ll name ours pick-element instead.
Develop a function pick-element that takes in a natural number and a non-empty
list, and returns one of the elements of the list. If the number is 0, it returns the first
element of the list; if 1, it returns the second element; etc. If there is no such element, it
should produce an appropriate error message.|#

;; -- Data Definition

;; Non-empty-list (NEL) is one of:
;; - (cons element empty)
;; - (cons element NEL)
;; interp. a non-empty list of anything

;; pick-element : Natural NEL -> element
;; Given a Natural[0, ] and a non-empty list, produces the element specified by the Natural.
(check-error  (pick-element  1 empty) "pick-element: given list is empty")
(check-expect (pick-element  0 (cons 1 (cons 2 (cons 3 empty)))) 1)
(check-expect (pick-element  1 (cons 1 (cons 2 (cons 3 empty)))) 2)
(check-expect (pick-element  2 (cons 1 (cons 2 (cons 3 empty)))) 3)
(check-error  (pick-element  3 (cons 1 (cons 2 (cons 3 empty)))) "pick-element: no such element")
(check-expect (pick-element  0 (list "a")) "a")
(check-expect (pick-element  0 (list 5 -2 17)) 5)
(check-error  (pick-element  1 (list "a")) "pick-element: no such element")
(check-expect (pick-element  1 (list 5 17)) 17)
(check-expect (pick-element  1 (list 5 -2 17)) -2)
(check-error  (pick-element  4 (list "a")) "pick-element: no such element")
(check-error  (pick-element -1 (list "a")) "pick-element: no such element")
(check-expect (pick-element  4 (list "a" "b" "c" "d" "e")) "e")
(check-expect (pick-element  4 (list "a" "b" "c" "d" "e" "f" "g")) "e")

(define (pick-element n nel)
  (cond
    [(empty? nel)
     (error 'pick-element "given list is empty")]
    [(or (> n (sub1 (length nel))) (< n 0))
     (error 'pick-element "no such element")]
    [(zero? n) (first nel)]
    [else (pick-element (sub1 n) (rest nel))]))