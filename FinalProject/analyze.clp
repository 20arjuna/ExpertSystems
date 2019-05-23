(clear)
(reset)

(batch ExpertSystems/toolbox.clp)

(defglobal ?*external-class* = 0)

(deffunction play ()
   (bind ?sitename (getInput))
   (initialize)
   ()
   (reset)
   (run)
   (return)
)

(deffunction getInput ()
   (bind ?sitename (ask "Enter a website name: "))
   (return ?sitename)
)

(deffunction initialize ()
      (bind ?*external-class* (new csvTest))
      (return)
)

(deffunction createPropertiesList (?sitename)
   (bind ?propertiesList (?*external-class* getProperties ?sitename))
   (return ?propertiesList)

)
