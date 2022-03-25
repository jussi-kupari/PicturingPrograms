;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Ex1539) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|Exercise 15.3.9
These stripes are really too narrow to see easily. Develop a function
make-wide-stripes that does the same thing only with each stripe 5 pixels high: rows
0-4 are red, 5-9 are blue, 10-14 are red, etc.|#

(require picturing-programs)

;; -- Functions

;; make-wide-stripes : Natural Natural -> Image
;; Given width and height, produces an image that size with wide red/even and blue/odd stripes

(define (make-wide-stripes x y)
  (build3-image x y red-function green-function blue-function))

;; red-function : Number Number -> Number
;; Given x and y, produces 255 if y is within 5 above of a number divisible by ten, else 0 
(check-expect (red-function 0 10) 255)
(check-expect (red-function 0 11) 255)
(check-expect (red-function 0 12) 255)
(check-expect (red-function 0 13) 255)
(check-expect (red-function 0 14) 255)
(check-expect (red-function 0 15) 0)
(check-expect (red-function 0 16) 0)
(check-expect (red-function 0 17) 0)
(check-expect (red-function 0 18) 0)
(check-expect (red-function 0 19) 0)

(define (red-function x y)
  (cond
    [(or (div-by-ten? y)
         (div-by-ten? (- y 1))
         (div-by-ten? (- y 2))
         (div-by-ten? (- y 3))
         (div-by-ten? (- y 4))) 255]
    [else 0]))

;; green-function : Number Number -> Number
;; Given x and y, produces always zero
(check-expect (green-function 0 2) 0)
(check-expect (green-function 0 3) 0)

(define (green-function x y) 0)

;; blue-function : Number Number -> Number
;; Given x and y, produces 255 if y is within 5 above of a number divisible by five but not ten, else 0 
(check-expect (blue-function 0 20) 0)
(check-expect (blue-function 0 21) 0)
(check-expect (blue-function 0 22) 0)
(check-expect (blue-function 0 23) 0)
(check-expect (blue-function 0 24) 0)
(check-expect (blue-function 0 15) 255)
(check-expect (blue-function 0 16) 255)
(check-expect (blue-function 0 17) 255)
(check-expect (blue-function 0 18) 255)
(check-expect (blue-function 0 19) 255)

(define (blue-function x y)
  (cond
    [(or (div-by-five-not-ten? y)
         (div-by-five-not-ten? (- y 1))
         (div-by-five-not-ten? (- y 2))
         (div-by-five-not-ten? (- y 3))
         (div-by-five-not-ten? (- y 4))) 255]
    [else 0]))

;; div-by-ten? : Number -> Boolean
;; Given number, produces true if it is divisible by ten
(check-expect (div-by-ten? 34) false)
(check-expect (div-by-ten? 30) true)

(define (div-by-ten? n)
  (integer? (/ n 10)))

;; div-by-five-not-ten? : Number -> Boolean
;; Given number, produces true if it is divisible by five but not ten
(check-expect (div-by-five-not-ten? 30) false)
(check-expect (div-by-five-not-ten? 25) true)

(define (div-by-five-not-ten? n)
  (and (integer? (/ n 5))
       (not (div-by-ten? n))))