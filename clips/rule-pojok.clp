; ---------------------------------------------------------
(defrule bagpojok_satu_expose_bomb

(pojok ?a ?b)
(isi ?a ?b 1)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (unknown ?x2 ?y2))
(not (bomb ?x2 ?y2))

=>
(retract ?r1)
(assert (bomb ?x1 ?y1))
)
; ---------------------------------------------------
(defrule bagpojok_dua_expose_bomb

(pojok ?a ?b)
(isi ?a ?b 2)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (unknown ?x2 ?y2))
(not (bomb ?x2 ?y2))

=>
(retract ?r1)
(assert (bomb ?x1 ?y1))
)
; -------------------------------------
(defrule bagpojok_tiga_expose_bomb

(pojok ?a ?b)
(isi ?a ?b 3)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

=>

(retract ?r1)
(assert (bomb ?x1 ?y1))
)