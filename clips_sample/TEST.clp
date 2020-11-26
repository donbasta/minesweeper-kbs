(defrule startup
  =>
  (assert (is-a Dasher horse)
          (is-a Comet horse)
          (is-a Prancer horse)
          (is-a Thunder horse)
          (is-parent-of Comet Dasher)
          (is-parent-of Comet Prancer)
          (is-parent-of Dasher Thunder)
          (is-fast Prancer)
          (is-fast Thunder))
)

(defrule R
    (is-a ?x horse)
    (is-parent-of ?x ?y)
    (is-fast ?y)
  =>
  (assert (is-valuable ?x))
)