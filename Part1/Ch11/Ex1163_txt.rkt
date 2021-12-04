;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1163_txt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 11.6.3
; Develop a function that takes in the name of a color ( e.g. "green")
; and produces that word, followed by a randomly-chosen numeric font
; size (say, between 10 and 30 points inclusive), in text of that color
; and font size, surrounded by a box of the same color which is 10
; pixels wider and 6 pixels higher than the text. For example,
; 
; .
; 
; Hint: Since this function has random results, it’ll be difficult
; to write test cases for. I did it with two helper functions, both
; of which contained no randomness and therefore could be tested
; using check-expect.


;  Dependecy-chart
; 
; .



(require picturing-programs)


;; String -> Image

;; Given a color, produces it as an image, followed by
;; a random numeric in font size (between 10 and 30)
;; in text of that color and font size, surrounded by a box
;; of the same color which is 10 pixels wider and 6 pixels higher than the text.

(define (Ex11.6.3 color)
  (frame-img (create-colnum color)))

;; String -> String
;; Given a color string, ignores the string and
;; proudces a random number between 10 and 30 as a string
(check-member-of (create-random-as-string "green")
                 "10"
                 "11"
                 "12"
                 "13"
                 "14"
                 "15"
                 "16"
                 "17"
                 "18"
                 "19"
                 "20"
                 "21"
                 "22"
                 "23"
                 "24"
                 "25"
                 "26"
                 "27"
                 "28"
                 "29"
                 "30")

(define (create-random-as-string color)
  (number->string (+ 10 (random 20))))

;; String -> String
;; Given a name of color, concatenates it with a random number (between 10 and 30)
(check-member-of (create-colnum "green")
                 "green 10"
                 "green 11"
                 "green 12"
                 "green 13"
                 "green 14"
                 "green 15"
                 "green 16"
                 "green 17"
                 "green 18"
                 "green 19"
                 "green 20"
                 "green 21"
                 "green 22"
                 "green 23"
                 "green 24"
                 "green 25"
                 "green 26"
                 "green 27"
                 "green 28"
                 "green 29"
                 "green 30")

(define (create-colnum color)
  (string-append color " " (create-random-as-string color)))

;; String -> Number
;; Given a string that ends in a number
;; extracts the number string and produces it as a number
(check-expect
 (extract-number "green 20")
 (string->number (substring "green 20"
                            (- (string-length "green 20") 2))))

(define (extract-number color-number)
  (string->number (substring color-number
                             (- (string-length color-number) 2))))

;; String -> String
;; Given a string that starts with a color
;; extracts the color string
(check-expect
 (extract-color "green 20")
 (substring "green 20" 0 (- (string-length "green 20") 3)))

(define (extract-color color-number)
  (substring color-number 0 (- (string-length color-number) 3)))

;; String -> Image
;; Given a string that is a combo of a color and number
;; produces as image of that string in that color and font size
(check-expect
 (colnum-to-img "green 20")
 (text "green 20" (extract-number "green 20") (extract-color "green 20")))

(define (colnum-to-img color-number)
  (text color-number (extract-number color-number) (extract-color color-number)))

;; String -> Image
;; Given a string that is a combo of a color and number
;; produces an image of it in the color and fontsize framed in that color
(check-expect
 (frame-img "green 20")
 (overlay (colnum-to-img "green 20")
          (rectangle (+ 10(image-width (colnum-to-img "green 20")))
                     (+ 6 (image-height (colnum-to-img "green 20")))
                     "outline"
                     (extract-color "green 20"))))

(define (frame-img color-number)
  (overlay (colnum-to-img color-number)
           (rectangle (+ 10(image-width (colnum-to-img color-number)))
                      (+ 6 (image-height (colnum-to-img color-number)))
                      "outline"
                      (extract-color color-number))))




