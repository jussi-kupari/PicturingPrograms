;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex23110) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 23.1.10
Define a function backwards that takes in a list (of anything) and returns a list of the same
objects in the opposite order. There’s a built-in function named reverse which does this, but
I want you to define it yourself without using reverse. After you’ve finished this exercise,
feel free to use reverse in the rest of the book.|#

;; -- Data Definitions

;; LOO (List-Of-Objects) is one of:
;; - empty
;; - (cons Object LOO)
;; interp. a list of objects

(define Alist (cons 1 (cons 2 empty)))

;; -- Functions


;; backwards : LOO -> LOO
;; Given a list-of-objects, produces the list in reverse order
(check-expect (backwards empty) empty)
(check-expect (backwards (cons "a" empty)) (cons "a" empty))
(check-expect (backwards (cons "a" (cons "b" empty))) (cons "b" (cons "a" empty)))
(check-expect (backwards (cons "a" (cons "b" (cons "c" (cons "d" empty)))))
              (cons "d" (cons "c" (cons "b"(cons "a" empty)))))

(define (backwards loo)
  (cond
    [(empty? loo) empty]
    [else
     (append (backwards (rest loo)) ;The rest of the list is already sorted here
             (cons (first loo) empty))])) ;Now we add the "a" at the end
