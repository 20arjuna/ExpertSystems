/*
** Created: May 2, 2019
** Last Modified: May 28, 2019
**
** Author(s): Arjun Akkiraju,
**            with assistance from: Dr. Eric R. Nelson
**
** This file takes in a name of a website from the user and analyzes
** the given website's privacy policy. It interfaces with java to read relevant
** information regarding the user's website from a csv file and asserts the given
** facts into the machine's working memory. The file then uses forward chained rules
** to analyze the privacy policy based on the asserted facts and makes a determnation
** based on how fair the website is to users regarding privacy. It rates the site on a
** 1 to 5 scale.
**
** 1 - Awful. This site's privacy policy raises serious concerns.
** 2 - Bad. This site's privacy policy has some important issues that require your attention.
** 3 - Average. This site's privacy policy is ok but some parts need your attention.
** 4 - Good. This site's privacy policy are fair but could be improved.
** 5 - Elite. This site's privacy policy is excellent and are very fair towards the user.
**
** The file then alerts the user as to what information the site is tracking.
**
*/

(clear)
(reset)

(batch ExpertSystems/toolbox.clp)

(defglobal ?*external-class* = 0)
(defglobal ?*site* = "")

(deffunction analyze ()
   (reset)
   (printline "")

   (printline "Enter a website name and I'll tell you what data the website collects, and rates the website on a scale of 1-5")

   (printline "")

   (printline "1 - Awful. This site's privacy policy raises serious concerns.")
   (printline "2 - Bad. This site's privacy policy has some important issues that require your attention.")
   (printline "3 - Average. This site's privacy policy is ok but some parts need your attention.")
   (printline "4 - Good. This site's privacy policy are fair but could be improved.")
   (printline "5 - Elite. This site's privacy policy is excellent and are very fair towards the user.")

   (printline "")

   (bind ?sitename (getInput))
   (initialize)
   (while (= (?*external-class* validateInput ?sitename) FALSE)
      (printline "Input is not a valid website name!")
      (bind ?sitename (getInput))
   )

   (bind ?propertiesList (createPropertiesList ?sitename))

   (bind ?count 1)

   (bind ?rawProperties (create$ "User online Activities" "Contact" "Unspecified Data"
                                 "Cookies and Tracking Elements" "Health" "Demographic"
                                 "IP Address" "Computer Information" "Financial" "User Profile"
                                 "Location" "Opt-out via contacting" "Opt-out via service" "Opt-in"))
   (bind ?lenRawProperties 15)
   (while (< ?count ?lenRawProperties)
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
   (while (< ?count 12)
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
   (printline "")
   (printline "Final rating: Elite! This site doesn't track you!")
   (assert (solved y))
)

(defrule goodOptIn
   (fact "Opt-in" "y")
   =>
   (printline "")
   (printline "Final rating: Good! This site won't track you until you opt in!")
   (assert (explain y))
   (assert (solved y))
)

(defrule goodLittleTracking
   (fact "Opt-out via contacting" "y")
   (fact "User Profile" "y")
   (fact "Cookies and Tracking Elements" "n")
   (fact "Location" "n")
   (fact "IP Address" "n")
   (fact "Computer Information" "n")
   =>
   (printline "")
   (printline "Final rating: Good! This site barely tracks you!")
   (assert (explain y))
   (assert (solved y))
)

(defrule average
   (fact "Opt-in" "n")
   (fact "User online Activities" "y")
   (fact "User Profile" "y")
   (fact "Opt-out via contacting" "y")
   =>
   (printline "")
   (printline "Final rating: Average. This site tracks most of your behavior on the site, but you can still opt out of most of the site's data collection.")
   (assert (explain y))
   (assert (solved y))
)

(defrule bad
  (fact "User online Activities" "y")
  (fact "User Profile" "y")
  (fact "Opt-out via contacting" "n")
  =>
  (printline "")
  (printline "Final rating: Bad! This site tracks most of your behavior on the site and there is no option for you to opt-out.")
  (assert (explain y))
  (assert (solved y))
)

(defrule badPersonalInfo
   (fact "IP Address" "y")
   (fact "Computer Information" "y")
   (fact "Opt-out via contacting" "n")
   =>
   (printline "")
   (printline "Final rating: Bad! This collects personal information.")
   (assert (explain y))
   (assert (solved y))
)

(defrule awful
  (fact "IP Address" "y")
  (fact "Computer Information" "y")
  (fact "User online Activities" "y")
  (fact "User Profile" "y")
  (fact "Opt-out via contacting" "n")
  =>
  (printline "")
  (printline "Final rating: Awful! This site collect lots of sensitive information.")
  (assert (explain y))
  (assert (solved y))
)


/*
** The alldone rule fires after a guess has been made. The rule
** declares a high salience and looks for the (solved) pattern to
** be set to yes before thanking the user for playing and telling them
** how they can play again.
*/

(defrule alldone "Concludes the game after a guess has been made."
   (declare (salience 100))
   (solved y)
=>
   (printline "")
   (printline "Glad I could help. Enter (analyze) to rerun the program.")
)

/*
** The giveup rule fires after a guess has been made. The rule
** declares a low salience and looks for the (solved) pattern to
** be set to no before giving up and telling them how they can play again.
*/
(defrule giveup "Concludes the game after giving up."
   (declare (salience -100))
   (not(solved y))
=>
   (printline "")
   (printline "Sorry, I couldn't find the details of your website. Enter (analyze) to rerun the program.")
)

(defrule explain
   (declare (salience 200))
   (explain y)
   =>
   (printline "")
   (printline "What this site collects.")
   (bind ?siteCollections (getSiteCollections))
   (foreach ?collection ?siteCollections
      (printline ?collection)
   )
)
