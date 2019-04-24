(clear)
(reset)
(batch ExpertSystems/toolbox.clp)

(defglobal ?*MAX_LETTERS* = 0)


(do-backward-chaining onLand)
(defrule onLandRule
  (need-onLand ?)
  =>
  (bind ?*MAX_LETTERS* (+ ?*MAX_LETTERS* 1))
  (print "Question ")
  (print "#")
  (print ?*MAX_LETTERS*)
  (print ": ")
  (bind ?land (ask "Does it live on land?"))
  (assert (onLand (getFirst ?land)))
)

(do-backward-chaining danger)
(defrule dangerRule
  (need-danger ?)

  =>
  (bind ?land (ask "Is it dangerous?"))
  (assert (danger (getFirst ?land)))
)
(run)
