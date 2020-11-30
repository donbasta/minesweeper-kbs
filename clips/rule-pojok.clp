; -----------------------------------------------------------------------------------------
(defrule pojok_satu_satu_bom_dua_unknown ; x1 y1 unknown, sisanya kosong

(pojok ?a ?b)
(isi ?a ?b 1)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(not (unknown ?x2 ?y2))
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (bomb ?x2 ?y2))

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(not (unknown ?x3 ?y3))
(not (bomb ?x3 ?y3))
=>
(assert (bomb ?x1 ?y1))
(retract ?r1)
)
; --------------------------------------------------------------------
(defrule pojok_satu_satu_bomb_satu_unknown ; x1 y1 bomb, x2 y2 kosong, x3 y3 unknown maka x3 y3 kosong

(pojok ?a ?b)
(isi ?a ?b 1)

(adjacent ?a ?b ?x1 ?y1)
(not (unknown ?x1 ?y1))
(bomb ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(not (unknown ?x2 ?y2))
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (bomb ?x2 ?y2))

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(unknown ?x3 ?y3)
?r1 <- (unknown ?x3 ?y3)
=>
(retract ?r1)
)
; ---------------------------------------------------------------------
(defrule pojok_dua_dua_unknown_satu_kosong

(pojok ?a ?b)
(isi ?a ?b 2)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
(not (bomb ?x1 ?y1))
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(unknown ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (bomb ?x2 ?y2))
?r2 <- (unknown ?x2 ?y2)

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(not (unknown ?x3 ?y3))
(not (bomb ?x3 ?y3))
=>
(assert (bomb ?x1 ?y1))
(assert (bomb ?x2 ?y2))
(retract ?r1)
(retract ?r2)
)
; ---------------------------------------------------------------------
(defrule pojok_dua_satu_bom_satu_kosong_satu_unknown

(pojok ?a ?b)
(isi ?a ?b 2)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
(not (bomb ?x1 ?y1))
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (unknown ?x2 ?y2))
(bomb ?x2 ?y2)

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(not (unknown ?x3 ?y3))
(not (bomb ?x3 ?y3))
=>
(assert (bomb ?x1 ?y1))
(retract ?r1)
)
; -------------------------------------------------------------------
(defrule pojok_dua_dua_bom_satu_unknown

(pojok ?a ?b)
(isi ?a ?b 2)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(not (unknown ?x2 ?y2))
(bomb ?x2 ?y2)

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(not (unknown ?x3 ?y3))
(bomb ?x3 ?y3)
=>
(retract ?r1)
)
; ---------------------------------------------------------
(defrule pojok_tiga_tiga_unknown

(pojok ?a ?b)
(isi ?a ?b 3)

(adjacent ?a ?b ?x1 ?y1)
(unknown ?x1 ?y1)
?r1 <- (unknown ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(unknown ?x2 ?y2)
?r2 <- (unknown ?x2 ?y2)

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(unknown ?x3 ?y3)
?r3 <- (unknown ?x3 ?y3)
=>
(assert (bomb ?x1 ?y1))
(assert (bomb ?x2 ?y2))
(assert (bomb ?x3 ?y3))
(retract ?r1)
(retract ?r2)
(retract ?r3)
)
; ---------------------------------------------------------
(defrule pojok_tiga_satu_bomb_dua_unknown

(pojok ?a ?b)
(isi ?a ?b 3)

(adjacent ?a ?b ?x1 ?y1)
(bomb ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(unknown ?x2 ?y2)
?r2 <- (unknown ?x2 ?y2)

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(unknown ?x3 ?y3)
?r3 <- (unknown ?x3 ?y3)
=>
(assert (bomb ?x2 ?y2))
(assert (bomb ?x3 ?y3))
(retract ?r2)
(retract ?r3)
)
; ---------------------------------------------------------
(defrule pojok_tiga_dua_bomb_satu_unknown

(pojok ?a ?b)
(isi ?a ?b 3)

(adjacent ?a ?b ?x1 ?y1)
(bomb ?x1 ?y1)

(adjacent ?a ?b ?x2 ?y2)
(test (not(and (= ?x1 ?x2) (= ?y1 ?y2))))
(bomb ?x2 ?y2)

(adjacent ?a ?b ?x3 ?y3)
(test (not(and (= ?x1 ?x3) (= ?y1 ?y3))))
(test (not(and (= ?x2 ?x3) (= ?y2 ?y3))))
(unknown ?x3 ?y3)
?r3 <- (unknown ?x3 ?y3)
=>
(assert (bomb ?x3 ?y3))
(retract ?r3)
)