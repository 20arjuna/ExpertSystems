(clear)
(reset)

(batch ExpertSystems/toolbox.clp)

(defglobal ?*external-class* = 0)

(deffunction play ()
   (bind ?sitename (getInput))
   (initialize)
   (bind ?propertiesList (createPropertiesList ?sitename))
   (printout t ?propertiesList crlf)
   (foreach ?property ?propertiesList
      (assert (random ?property))
   )
   (run)
   (return)
)

(deffunction getInput ()
   (return (ask "Enter a website name: "))
)

(deffunction initialize ()
      (bind ?*external-class* (new csvTest))
      (return)
)

(deffunction createPropertiesList (?site)
   (return (?*external-class* getProperties ?site))
)
