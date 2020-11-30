(defrule retract_isi
    (ask-isi ?i ?j)
    ?r1 <- (ask-isi ?i ?j)
    =>
    (isi ?i ?j 1)
    (retract ?r1)
)