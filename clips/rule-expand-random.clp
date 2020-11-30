; (defrule choose_random
;     (unknown ?i:(= ?i (mod random ?*B-SIZE*)) ?j:(= ?j (mod random ?*B-SIZE*)))
;     ?r1 <- (unknown ?i ?j)
;     =>
;     (ask-isi ?i ?j)
;     (retract ?r1)
; )