(clear)
(reset)

(batch ExpertSystems/toolbox.clp)

(defglobal ?*external-class* = 0)
(defglobal ?*site* = "")

(deffunction play ()
   (reset)
   (bind ?sitename (getInput))
   (initialize)
   (bind ?propertiesList (createPropertiesList ?sitename))

   (bind ?count 1)

   (bind ?rawProperties (create$ "User online Activities" "Contact" "Unspecified Data"
                                 "Cookies and Tracking Elements" "Health" "Demographic"
                                 "IP Address" "Computer Information" "Financial" "User Profile"
                                 "Location" "Opt-out via contacting" "Opt-out via service" "Opt-in"))

   (while (< ?count 15)
      (assert(fact (nth$ ?count ?rawProperties) (nth$ ?count ?propertiesList)))
      (++ ?count)
   )
   (run)
   (return)
)

(deffunction getInput ()
   (bind ?*site* (ask "Enter a website name: "))
   (return ?*site*)
)

(deffunction initialize ()
      (bind ?*external-class* (new csvTest))
      (return)
)

(deffunction createPropertiesList (?site)
   (return (?*external-class* getProperties ?site))
)

(deffunction getSiteCollections ()
   (bind ?rawProperties (create$ "User online Activities" "Contact" "Unspecified Data"
                              "Cookies and Tracking Elements" "Health" "Demographic"
                              "IP Address" "Computer Information" "Financial" "User Profile"
                              "Location" "Opt-out via contacting" "Opt-out via service" "Opt-in"))
   (bind ?letterList (createPropertiesList ?*site*))
   (bind ?privacyList (create$))
   (bind ?count 1)
   (while (< ?count 15)
      (if (= (nth$ ?count ?letterList) "y") then
         (bind ?privacyList (create$ ?privacyList (nth$ ?count ?rawProperties)))
      )
      (++ ?count)
   )
   (return ?privacyList)
)

(defrule eliteNoTracking
   (fact "User online Activities" "n")
   (fact "User Profile" "n")
   =>
   (printline "Final rating: Elite! This site doesn't track you!")
   (halt)
)

(defrule goodOptIn
   (fact "Opt-in" "y")
   =>
   (printline "Final rating: Good! This site won't track you until you opt in!")
   (assert (opt-in-fact y))

)

(defrule explainGoodOptIn
   (opt-in-fact y)
   =>
   (printline "What this site collects.")
   (bind ?siteCollections (getSiteCollections))
   (foreach ?collection ?siteCollections
      (printline ?collection)
   )
)

(defrule goodLittleTracking
   (fact "Opt-out via contacting" "y")
   (fact "User Profile" "y")
   (fact "Cookies and Tracking Elements" "n")
   (fact "Location" "n")
   (fact "IP Address" "n")
   (fact "Computer Information" "n")
   =>
   (printline "Final rating: Good! This site barely tracks you!")
   (halt)
)

(defrule average
   (fact "User online Activities" "y")
   (fact "User Profile" "y")
   (fact "Opt-out via contacting" "y")
   =>
   (printline "Final rating: Average. This site tracks most of your behavior on the site, but you can still opt out of most of the site's data collection.")
   (halt)
)

(defrule bad
  (fact "User online Activities" "y")
  (fact "User Profile" "y")
  (fact "Opt-out via contacting" "n")
  =>
  (printline "Final rating: Bad! This site tracks most of your behavior on the site and there is no option for you to opt-out.")
  (halt)
)

(defrule badPersonalInfo
   (fact "IP Address" "y")
   (fact "Computer Information" "y")
   (fact "Opt-out via contacting" "n")
   =>
   (printline "Final rating: Bad! This collects personal information.")
)

(defrule awful
  (fact "IP Address" "y")
  (fact "Computer Information" "y")
  (fact "User online Activities" "y")
  (fact "User Profile" "y")
  (fact "Opt-out via contacting" "n")
  =>
  (printline "Final rating: Awful! This site collect lots of sensitive information.")
)

; (defrule awful
;    (fact )
; )
