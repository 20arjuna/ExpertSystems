xxq(clear)
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
  (or (onLand n) (onLand y))
  =>
  (bind ?land (ask "Is it dangerous?"))
  (assert (danger (getFirst ?land)))
)


(defrule dog
    (onLand y)
    (yellow n)
    =>
    (printout t "dog!" crlf)
)
(defrule duck
    (onLand y)
    (yellow y)
    =>
    (printout t "duck!" crlf)
)
(defrule shark
    (onLand n)
    (danger y)
    =>
    (printout t "shark!" crlf)
)
(defrule fish
    (onLand n)
    (danger n)
    =>
    (printout t "fish!" crlf)
)
(deffunction play ()
  (println "welcome to 20 qs")
  (run)
)
