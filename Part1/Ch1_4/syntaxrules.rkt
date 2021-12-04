;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname syntaxrules) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Syntax Rule 1 Any picture, number, or string is a legal expression; its value is itself.

Syntax Rule 2 A left-parenthesis followed by a function name, one or more legal expres-
sions, and a right parenthesis, is a legal expression; its value is what you get by applying
the named function to the values of the smaller expressions inside it.

Syntax Rule 3 Any identifier, if already defined, is a legal expression.

Syntax Rule 4 A left-parenthesis followed by the word define, a previously-undefined
identifier, a legal expression, and a right-parenthesis is a legal expression. It has no
“value”, but the side effect of defining the variable to stand for the value of the expression.

Syntax Rule 5 A left parenthesis followed by the word define, a left parenthesis, a
previously-undefined identifier, one or more identifiers, a right parenthesis, a legal ex-
pression, and another right parenthesis is a legal expression. Think of it as anything
matching the pattern

(define ( new-identifier identifier ...) expression )

This sort of expression has no “value”, but the side effect of defining a new function
whose name is the new-identifier. Note that the parameter names from the function header
can appear inside the function body as though they were defined variables.|#