; 
;  0 2 x x
;  1 3 x x
;  x x x x
;  x x x x

(defrule startup
  =>
  (assert (number 0)
          (number 1)
          (number 2)
          (number 3)
          (number 4)
          (number 5)
          (number 6)
          (number 7)
          (number 8)
          (number 9)
          (outcome YES)
          (outcome NO)
))

(defrule generate-coordinates
  (number ?x)
  (number ?y)
  =>
  (assert (coordinate ?x ?y))
)

(defrule generate-possibleoutcomes
    (coordinate ?x ?y)
    (outcome ?z)
    =>
    (assert (outcomes ?x ?y ?z))
)


(defrule find-solution
  a11 <- (outcomes 0 2 ?a)
  a11not <- (outcomes 0 2 ?b~?a)

  a12 <- (outcomes 1 2 ?b)
  (outcomes 2 2 ?c)
  (outcomes 2 0 ?d)
  (outcomes 2 1 ?e)

  ()
  =>
  (retract a11not)
  if ?a = Yes : assert bom 0 2 else bukanbom 0 2


  a,b,c,d,e

  ()



; 0 1 B 1
; 1 3 3 3
; B 2 B B
; 1 2 2 2

; 0 1 x x
; 1 3 x x
; x x x x
; x x x x




  
  
 
