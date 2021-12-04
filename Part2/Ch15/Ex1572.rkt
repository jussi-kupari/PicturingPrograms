;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex1572) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 15.7.2
; Write the bad-color function needed in the below example.
; 
; 
; Worked Exercise 15.7.1
; Imagine that you work for a company that sells clothes over
; the Internet: a Web page has a menu from which customers can
; choose which item of clothing, and which color, they’re interested
; in.
; 
; For simplicity, let’s suppose there are only three items of
; clothing: pants, shirt, and shoes.
; 
; The pants are available in black or navy.
; The shirt is available in white or pink
; and the shoes are available in pink, burgundy, or navy.
; 
; Your company photographer has given you pictures of all seven of
; these items, which you’ve copied and pasted into DrRacket under the
; variable names black-pants, navy-pants, pink-shirt, white-shirt,
; pink-shoes, burgundy-shoes, and navy-shoes.
; 
; Develop a function show-clothing that takes in two strings representing
; the item of clothing and the color, and returns a picture of the item of
; clothing. If the requested combination of item and color doesn’t exist,
; it should return an appropriate error message.

(require picturing-programs)

;; show-clothing: String String -> Image
;; Given the item of clothing and color, return an image of the item or an error
(check-expect (show-clothing "pants" "black") black-pants)
(check-expect (show-clothing "pants" "navy") navy-pants)
(check-expect (show-clothing "shirt" "white") white-shirt)
(check-expect (show-clothing "shirt" "pink") pink-shirt)
(check-expect (show-clothing "shoes" "pink") pink-shoes)
(check-expect (show-clothing "shoes" "burgundy") burgundy-shoes)
(check-expect (show-clothing "shoes" "navy") navy-shoes)
(check-expect (show-clothing "hat" "black")
              (text "Not available." 20 "red"))
(check-expect (show-clothing "pants" "burgundy")
              (text "Not available." 20 "red"))

(define (show-clothing item color)
  (cond
    [(string=? item "pants")
     (cond
       [(string=? color "black") black-pants]
       [(string=? color "navy") navy-pants]
       [else (text "Not available." 20 "red")])]
    [(string=? item "shirt")
     (cond
       [(string=? color "white")]
       [(string=? color "pink")]
       [else (text "Not available." 20 "red")])]
    [(string=? item "shoes")
     (cond
       [(string=? color "pink")]
       [(string=? color "burgundy")]
       [(string=? color "navy")]
       [else (text "Not available." 20 "red")])]))



;; bad-color : String String -> image
;; Given an item and a color, produces an image of an error message
(check-expect (bad-color "shoes" "red") (text "red-shoes are not available." 20 "black"))

(define (bad-color item color)
  (text
   (string-append
    (string-append color "-" item) " are not available.")
   20 "black"))

