;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ch4_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)


; Practice Exercise 4.1.2
; Type the above definition (the version with the parameter name
; picture) into the Definitions pane of DrRacket, along with definitions
; of the variables book, calendar, and bloch. Click “Run”, then type the examples


(define (mirror-image picture)
  (beside picture (flip-horizontal picture)))

(define calendar .)
(define book .)

(define hieroglyph .)

(mirror-image calendar)
(mirror-image book)
(mirror-image hieroglyph)


; Exercise 4.2.1
; Define a function named vert-mirror-image which, given an image,
; produces that image above its top-to-bottom reflection. As before,
; type your definition into the Definitions pane, after the definitions
; already there. Put the function header on one line, and the function
; body on the next line or two.
; 
; Click “Run”, then test your function by trying it on various images, such as book,
; calendar, and bloch, and checking that the results are what you expected.


(define (vert-mirror-image picture)
  (above (flip-vertical picture) picture))

(vert-mirror-image calendar)



; Exercise 4.2.2
; Define a function named four-square which, given
; an image, produces a two-by-two square of copies of it.Put the function
; header on one line, and the function body on the next line or two. Test
; your function by trying it on various images and checking that the
; results are what you expected.


(define (four-square picture)
  (beside
   (above picture picture)
   (above picture picture)))

(four-square calendar)


; Worked Exercise 4.2.3
; Define a function named counterchange
; which, given two images, produces a two-by-two square with
; the first image in top-left and bottom-right positions, and
; the second image in top-right and bottom-left positions.


(define (counterchange pic1 pic2)
  (beside
   (above pic1 pic2)
   (above pic2 pic1)))


(counterchange calendar book)
(counterchange book (flip-vertical calendar))



; Exercise 4.2.4
; Define a function named surround which, given two
; images, produces a picture with the second, first, and second side
; by side, i.e. the first image is “surrounded” on left and right by
; the second image. Follow the usual convention for code layout, and
; test your function on at least two different examples.


(define (surround image1 image2)
  (beside image2 image1 image2))

(surround book calendar)


; Exercise 4.3.1 Consider the following Racket code:
; 
; ( define ( mystery x y )  ; x and y are parameters
; ( above ( flip-horizontal x ) y ) ) ; x and y are arguments
; 
; ( mystery calendar book ) ; calendar and book are arguments
; ( mystery book calendar ) ; book and calendar are arguments
; 
; What words are used as parameters to which functions? What words are used as argu-
; ments to which functions?


; Exercise 4.3.2 Consider your solution and test cases for
; Exercise 4.2.1, 4.2.2, or 4.2.4.
; What words are used as parameters to which functions?
; What words (and expressions)
; are used as arguments to which functions?
; 
; (define (surround image1 image2) ; parameters
;   (beside image2 image1 image2)) ; arguments
; 
; (surround book calendar) ; arguments



; Practice Exercise 4.4.1 Consider the Racket code from Exercise 4.3.1:
; (define (mystery x y)
; (above (flip-horizontal x) y))
; 
; (mystery calendar book)
; (mystery book calendar)
; 
; In each of the two calls to mystery, tell which argument
; is matched with which parameter,and write down (without using DrRacket)
; the sequence of steps of expansion that the
; Stepper would do. Type this code into DrRacket’s
; Definitions pane, hit “Step” several
; times, and see whether you were right.
; 
; (mystery calendar book) ->
; 
; (above (flip-horizontal .) .) ->
; (above . .) ->
; .
; 


; Practice Exercise 4.4.2 Repeat the previous exercise, replacing the mystery function
; with your solution to Exercise 4.2.1, 4.2.2, or 4.2.4.
; 
; (define (surround image1 image2)
;   (beside image2 image1 image2))
; 
; (surround book calendar) ->
; 
; (beside calendar book calendar) ->
; (beside . . .) ->
; 
; .
; 



; Practice Exercise 4.5.1
; Type a correct definition of vert-mirror-image into the Dr-
; Racket definitions pane, followed by the above check-expect lines.
; Click “Run” and see what happens.
; 
; Now change the definition to be incorrect — for example, use flip-horizontal in-
; stead of flip-vertical — but leave the check-expect the same. Click “Run” and see
; what happens.
; 


;(define (vert-mirror-image picture)
;  (above picture (flip-horizontal picture)))

(vert-mirror-image book)
"should be two books, one right side up with a question mark,
above one upside down with an upside-down question mark"

(check-expect (vert-mirror-image book)  ; gives and error
(above book (flip-vertical book)))


; Exercise 4.6.2
; Draw a box diagram to prove that
; 
; (define (mirror-image picture)
; (beside picture (flip-horizontal picture)))
; 
; is a legal expression.
; Assume that mirror-image is not already defined.
; 
; .
; 












