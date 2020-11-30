

; e2

(defrule find-solution
(combination B ?b)
(combination A ?a&~?b)
(test (= (+ ?b ?b (* 10 ?a)) (+ (* 10 ?b) ?a)))
=>
(printout t "A Solution is:" crlf crlf)
(printout t " A = " ?a crlf)
(printout t " B = " ?b crlf)
(printout t crlf)
(printout t " " ?a ?b crlf)
(printout t " + " ?b crlf)
(printout t " " "---" crlf)
(printout t " = " ?b ?a crlf))