;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex2283) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 22.8.3
; Ingredient lists on food packaging sometimes get deeply nested. I found
; a package of ice cream with the following ingredients list (I am not making this up!) :
; 
; Milk, skim milk, cream, hazelnut swirl (praline paste (hazelnuts, sugar,
; milk chocolate (sugar, cocoa butter, milk, chocolate, natural flavor, soy lecithin),
; bittersweet chocolate (sugar, chocolate, cocoa butter, butter oil, natural fla-
; vor, soy lecithin)), corn oil, powdered sugar (sugar, corn starch), dark choco-
; late (sugar, chocolate, cocoa butter, butter oil, natural flavor, soy lecithin),
; corn starch, cocoa processed with alkali, coconut oil, mono- and di-glycerides,
; salt, soy lecithin), sugar, chocolate truffle cake (semi-sweet chocolate (sugar,
; chocolate, cocoa butter, soy lecithin), cream, chocolate cookie crumbs (enriched
; flour (flour, niacin, reduced iron, thiamine mononitrate, riboflavin, folic acid),
; sugar, partially hydrogenated soybena, cottonseed, and canola oil, cocoa pro-
; cessed with alkali, high fructose corn syrup, yellow corn flour, chocolate, salt,
; dextrose, baking soda, soy lecithin), corn syrup, butter, chocolate, sugar, nat-
; ural flavor), bittersweet chocolate (sugar, chocolate, cocoa butter, butter oil,
; natural flavor, soy lecithin), cocoa processed with alkali, egg yolks, natural
; flavor, guar gum, carob bean gum, carrageenan, dextrose
; 
; We could represent this in Racket as follows:
; 
; (define milk-chocolate (cons "sugar" (cons "cocoa-butter"
; (cons "milk" (cons "chocolate" (cons "natural flavor"
; (cons "soy lecithin" empty)))))))
; (define bittersweet-chocolate (cons "sugar" (cons "chocolate"
; (cons "cocoa butter" (cons "butter oil" (cons
; "natural flavor" (cons "soy lecithin" empty)))))))
; (define praline-paste (cons "hazelnuts" (cons "sugar"
; (cons milk-chocolate (cons bittersweet-chocolate empty)))))
; 
; Finish translating this ingredient list to Racket.