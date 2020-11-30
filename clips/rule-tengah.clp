; -------------------------------------
(defrule bagtengah_satu_expose_bomb

(tengah ?a ?b)
(isi ?a ?b 1)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (unknown ?x2 ?y2))
(not (bomb ?x2 ?y2))

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(not (unknown ?x3 ?y3))
(not (bomb ?x3 ?y3))

(adjacent ?a ?b ?x4 ?y4)
(test (not(and (= ?x1 ?x4) (= ?y1 ?y4))))
(test (not(and (= ?x2 ?x4) (= ?y2 ?y4))))
(test (not(and (= ?x3 ?x4) (= ?y3 ?y4))))
(not (unknown ?x4 ?y4))
(not (bomb ?x4 ?y4))

(adjacent ?a ?b ?x5 ?y5)
(test (not(and (= ?x1 ?x5) (= ?y1 ?y5))))
(test (not(and (= ?x2 ?x5) (= ?y2 ?y5))))
(test (not(and (= ?x3 ?x5) (= ?y3 ?y5))))
(test (not(and (= ?x4 ?x5) (= ?y4 ?y5))))
(not (unknown ?x5 ?y5))
(not (bomb ?x5 ?y5))

(adjacent ?a ?b ?x6 ?y6)
(test (not(and (= ?x1 ?x6) (= ?y1 ?y6))))
(test (not(and (= ?x2 ?x6) (= ?y2 ?y6))))
(test (not(and (= ?x3 ?x6) (= ?y3 ?y6))))
(test (not(and (= ?x4 ?x6) (= ?y4 ?y6))))
(test (not(and (= ?x5 ?x6) (= ?y5 ?y6))))
(not (unknown ?x6 ?y6))
(not (bomb ?x6 ?y6))

(adjacent ?a ?b ?x7 ?y7)
(test (not(and (= ?x1 ?x7) (= ?y1 ?y7))))
(test (not(and (= ?x2 ?x7) (= ?y2 ?y7))))
(test (not(and (= ?x3 ?x7) (= ?y3 ?y7))))
(test (not(and (= ?x4 ?x7) (= ?y4 ?y7))))
(test (not(and (= ?x5 ?x7) (= ?y5 ?y7))))
(test (not(and (= ?x6 ?x7) (= ?y6 ?y7))))
(not (unknown ?x7 ?y7))
(not (bomb ?x7 ?y7))

(adjacent ?a ?b ?x8 ?y8)
(test (not(and (= ?x1 ?x8) (= ?y1 ?y8))))
(test (not(and (= ?x2 ?x8) (= ?y2 ?y8))))
(test (not(and (= ?x3 ?x8) (= ?y3 ?y8))))
(test (not(and (= ?x4 ?x8) (= ?y4 ?y8))))
(test (not(and (= ?x5 ?x8) (= ?y5 ?y8))))
(test (not(and (= ?x6 ?x8) (= ?y6 ?y8))))
(test (not(and (= ?x7 ?x8) (= ?y7 ?y8))))
(not (unknown ?x8 ?y8))
(not (bomb ?x8 ?y8))

=>
(retract ?r1)
(assert (bomb ?x1 ?y1))
)
; -------------------------------------
(defrule bagtengah_dua_expose_bomb

(tengah ?a ?b)
(isi ?a ?b 2)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (unknown ?x2 ?y2))
(not (bomb ?x2 ?y2))

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(not (unknown ?x3 ?y3))
(not (bomb ?x3 ?y3))

(adjacent ?a ?b ?x4 ?y4)
(test (not(and (= ?x1 ?x4) (= ?y1 ?y4))))
(test (not(and (= ?x2 ?x4) (= ?y2 ?y4))))
(test (not(and (= ?x3 ?x4) (= ?y3 ?y4))))
(not (unknown ?x4 ?y4))
(not (bomb ?x4 ?y4))

(adjacent ?a ?b ?x5 ?y5)
(test (not(and (= ?x1 ?x5) (= ?y1 ?y5))))
(test (not(and (= ?x2 ?x5) (= ?y2 ?y5))))
(test (not(and (= ?x3 ?x5) (= ?y3 ?y5))))
(test (not(and (= ?x4 ?x5) (= ?y4 ?y5))))
(not (unknown ?x5 ?y5))
(not (bomb ?x5 ?y5))

(adjacent ?a ?b ?x6 ?y6)
(test (not(and (= ?x1 ?x6) (= ?y1 ?y6))))
(test (not(and (= ?x2 ?x6) (= ?y2 ?y6))))
(test (not(and (= ?x3 ?x6) (= ?y3 ?y6))))
(test (not(and (= ?x4 ?x6) (= ?y4 ?y6))))
(test (not(and (= ?x5 ?x6) (= ?y5 ?y6))))
(not (unknown ?x6 ?y6))
(not (bomb ?x6 ?y6))

(adjacent ?a ?b ?x7 ?y7)
(test (not(and (= ?x1 ?x7) (= ?y1 ?y7))))
(test (not(and (= ?x2 ?x7) (= ?y2 ?y7))))
(test (not(and (= ?x3 ?x7) (= ?y3 ?y7))))
(test (not(and (= ?x4 ?x7) (= ?y4 ?y7))))
(test (not(and (= ?x5 ?x7) (= ?y5 ?y7))))
(test (not(and (= ?x6 ?x7) (= ?y6 ?y7))))
(not (unknown ?x7 ?y7))
(not (bomb ?x7 ?y7))

=>
(retract ?r1)
(assert (bomb ?x1 ?y1))
)
; -------------------------------------
(defrule bagtengah_tiga_expose_bomb

(tengah ?a ?b)
(isi ?a ?b 3)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (unknown ?x2 ?y2))
(not (bomb ?x2 ?y2))

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(not (unknown ?x3 ?y3))
(not (bomb ?x3 ?y3))

(adjacent ?a ?b ?x4 ?y4)
(test (not(and (= ?x1 ?x4) (= ?y1 ?y4))))
(test (not(and (= ?x2 ?x4) (= ?y2 ?y4))))
(test (not(and (= ?x3 ?x4) (= ?y3 ?y4))))
(not (unknown ?x4 ?y4))
(not (bomb ?x4 ?y4))

(adjacent ?a ?b ?x5 ?y5)
(test (not(and (= ?x1 ?x5) (= ?y1 ?y5))))
(test (not(and (= ?x2 ?x5) (= ?y2 ?y5))))
(test (not(and (= ?x3 ?x5) (= ?y3 ?y5))))
(test (not(and (= ?x4 ?x5) (= ?y4 ?y5))))
(not (unknown ?x5 ?y5))
(not (bomb ?x5 ?y5))

(adjacent ?a ?b ?x6 ?y6)
(test (not(and (= ?x1 ?x6) (= ?y1 ?y6))))
(test (not(and (= ?x2 ?x6) (= ?y2 ?y6))))
(test (not(and (= ?x3 ?x6) (= ?y3 ?y6))))
(test (not(and (= ?x4 ?x6) (= ?y4 ?y6))))
(test (not(and (= ?x5 ?x6) (= ?y5 ?y6))))
(not (unknown ?x6 ?y6))
(not (bomb ?x6 ?y6))

=>

(retract ?r1)
(assert (bomb ?x1 ?y1))
)
; -------------------------------------
(defrule bagtengah_empat_expose_bomb

(tengah ?a ?b)
(isi ?a ?b 4)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (unknown ?x2 ?y2))
(not (bomb ?x2 ?y2))

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(not (unknown ?x3 ?y3))
(not (bomb ?x3 ?y3))

(adjacent ?a ?b ?x4 ?y4)
(test (not(and (= ?x1 ?x4) (= ?y1 ?y4))))
(test (not(and (= ?x2 ?x4) (= ?y2 ?y4))))
(test (not(and (= ?x3 ?x4) (= ?y3 ?y4))))
(not (unknown ?x4 ?y4))
(not (bomb ?x4 ?y4))

(adjacent ?a ?b ?x5 ?y5)
(test (not(and (= ?x1 ?x5) (= ?y1 ?y5))))
(test (not(and (= ?x2 ?x5) (= ?y2 ?y5))))
(test (not(and (= ?x3 ?x5) (= ?y3 ?y5))))
(test (not(and (= ?x4 ?x5) (= ?y4 ?y5))))
(not (unknown ?x5 ?y5))
(not (bomb ?x5 ?y5))

=>
(retract ?r1)
(assert (bomb ?x1 ?y1))
)
; -------------------------------------
(defrule satu_expose_unknown

(isi ?a ?b 1)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(bomb ?x2 ?y2)

=>
(retract ?r1)
(assert (ask-isi ?x1 ?y1))
)
; -------------------------------------
(defrule dua_expose_unknown

(isi ?a ?b 2)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(bomb ?x2 ?y2)

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(bomb ?x3 ?y3)

=>
(retract ?r1)
(assert (ask-isi ?x1 ?y1))
)
; -------------------------------------
(defrule tiga_expose_unknown

(isi ?a ?b 3)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(bomb ?x2 ?y2)

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(bomb ?x3 ?y3)

(adjacent ?a ?b ?x4 ?y4)
(test (not(and (= ?x1 ?x4) (= ?y1 ?y4))))
(test (not(and (= ?x2 ?x4) (= ?y2 ?y4))))
(test (not(and (= ?x3 ?x4) (= ?y3 ?y4))))
(bomb ?x4 ?y4)

=>
(retract ?r1)
(assert (ask-isi ?x1 ?y1))
)
; -------------------------------------
(defrule empat_expose_unknown

(or (tengah ?a ?b) (sisi ?a ?b))
(isi ?a ?b 4)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(bomb ?x2 ?y2)

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(bomb ?x3 ?y3)

(adjacent ?a ?b ?x4 ?y4)
(test (not(and (= ?x1 ?x4) (= ?y1 ?y4))))
(test (not(and (= ?x2 ?x4) (= ?y2 ?y4))))
(test (not(and (= ?x3 ?x4) (= ?y3 ?y4))))
(bomb ?x4 ?y4)

(adjacent ?a ?b ?x5 ?y5)
(test (not(and (= ?x1 ?x5) (= ?y1 ?y5))))
(test (not(and (= ?x2 ?x5) (= ?y2 ?y5))))
(test (not(and (= ?x3 ?x5) (= ?y3 ?y5))))
(test (not(and (= ?x4 ?x5) (= ?y4 ?y5))))
(bomb ?x5 ?y5)

=>
(retract ?r1)
(assert (ask-isi ?x1 ?y1))
)