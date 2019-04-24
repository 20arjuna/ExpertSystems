/*
** Created: February 25, 2019
** Last Modified: April 9, 2019
**
** Author(s): Arjun Akkiraju,
**            with assistance from: Dr. Eric R. Nelson
**
** The anagram file generates anagrams based on a word inputted by the user. All outputs
** are printed to the console on seperate files. In order to
** run the file, create a separate folder called "ExpertSystems"
** and  add another subfolder titled "Anagrams". Insert this file,
** in the "Anagrams" subfolder which has just been created.
** To run this file, open up a Jess prompt
** and type (batch ExpertSystems/Anagram/anagram.clp)
** with parentheses.
**
**                   Functions included in this file
**
** slice$          - Slices the input token into a tokenized list.
** isLessThan      - Determines if a word's length is <= to a given length.
** getInput        - Gets user's input which they want to get anagrams of.
** assertLetter    - Asserts a letter into the machine's working memory.
** assertLetterList- Iterates through a list of letters and asserts each one
**                 - using the assertLetter function.
** createRule      - Dynamically creates a rule which prints out anagrams based on
**                 - the user's input.
** runAnagram      - Driver function for entire anagram file
**
**                   The following functions are provided in the "toolbox.clp" file **********
**                   in the ExpertSystems subfolder in the Jess71p1 directory.      **********
**
** print           - prints any argument
** printline       - print followed by a newline
** ask             - prompt the user and read back a token
** askline         - prompt the user and read back a line of text (a string)
** askQuestion     - adds a question mark to the prompt used in ask
** toChar          - given an ASCII integer value, returns the ASCII character as a string
** boolp           - Test for boolean type
** xor             - Exclusive-OR for two boolean values
**
*/

(clear)
(reset)

(batch ExpertSystems/toolbox.clp)

(defglobal ?*questionNum* = 0) ;global variable used to find which numbered question is being answered

(do-backward-chaining onLand)
(do-backward-chaining fish)
(defrule onLandRule
   (need-onLand ?)
   =>
   (bind ?answer (ask "Does it live on land?"))
   (assert (onLand (getFirst ?answer)))
)


(defrule fishRule
  (need-fish ?)
  =>
  (bind ?answer (ask "Is it a fish?"))
  (assert (fish (getFirst ?answer)))
)

(do-backward-chaining mammal)
(defrule mammalRule
  (need-mammal ?)
  =>
  (bind ?answer (ask "Is it a mammal?"))
  (assert (mammal (getFirst ?answer)))
)

(do-backward-chaining reptile)
(defrule reptileRule
  (need-reptile ?)
  =>
  (bind ?answer (ask "Is it a reptile?"))
  (assert (reptile (getFirst ?answer)))
)

(do-backward-chaining mollusk)
(defrule molluskReptile
  (need-mollusk ?)
  =>
  (bind ?answer (ask "Is it a mollusk?"))
  (assert (mollusk (getFirst ?answer)))
)

(do-backward-chaining harmful)
(defrule harmfulRule
  (need-harmful ?)
  =>
  (bind ?answer (ask "Is it harmful to humans?"))
  (assert (harmful (getFirst ?answer)))
)

(do-backward-chaining big)
(defrule bigRule
  (need-big ?)
  =>
  (bind ?answer (ask "Is it bigger than a human?"))
  (assert (big (getFirst ?answer)))
)

(do-backward-chaining nemo)
(defrule nemoRule
  (need-nemo ?)
  =>
  (bind ?answer (ask "Is it found in the movie Finding Nemo?"))
  (assert (nemo (getFirst ?answer)))
)

(do-backward-chaining orange)
(defrule orangeRule
  (need-orange ?)
  =>
  (bind ?answer (ask "Is it orange?"))
  (assert (orange (getFirst ?answer)))
)

(do-backward-chaining orangeCooked)
(defrule orangeCookedRule
  (need-orangeCooked ?)
  =>
  (bind ?answer (ask "Is it orange when cooked?"))
  (assert (orangeCooked (getFirst ?answer)))
)

(do-backward-chaining big)
(defrule bigRule
  (need-big ?)
  =>
  (bind ?answer (ask "Is it bigger than a human?"))
  (assert (big (getFirst ?answer)))
)

(do-backward-chaining nemo)
(defrule nemoRule
  (need-nemo ?)
  =>
  (bind ?answer (ask "Is it found in the movie Finding Nemo?"))
  (assert (nemo (getFirst ?answer)))
)

(do-backward-chaining sharpTeeth)
(defrule sharpTeethRule
  (need-sharpTeeth ?)
  =>
  (bind ?answer (ask "Does it have sharp teeth?"))
  (assert (sharpTeeth (getFirst ?answer)))
)

(do-backward-chaining electric)
(defrule electricRule
  (need-electric ?)
  =>
  (bind ?answer (ask "Is it electric?"))
  (assert (electric (getFirst ?answer)))
)

(do-backward-chaining light)
(defrule lightRule
  (need-light ?)
  =>
  (bind ?answer (ask "Does it have a light attached to it?"))
  (assert (light (getFirst ?answer)))
)


(do-backward-chaining horn)
(defrule hornRule
  (need-horn ?)
  =>
  (bind ?answer (ask "Does it have a horn?"))
  (assert (horn (getFirst ?answer)))
)

(do-backward-chaining fin)
(defrule finRule
  (need-fin ?)
  =>
  (bind ?answer (ask "Does it have a fin?"))
  (assert (fin (getFirst ?answer)))
)

(do-backward-chaining dangerReptile)
(defrule dangerReptileRule
  (need-dangerReptile ?)
  =>
  (bind ?answer (ask "Is it dangerous to humans?"))
  (assert (dangerReptile (getFirst ?answer)))
)

(do-backward-chaining vShaped)
(defrule vShapedRule
  (need-vShaped ?)
  =>
  (bind ?answer (ask "Does it have a v-shaped snout?"))
  (assert (vShaped (getFirst ?answer)))
)

(do-backward-chaining tentacles)
(defrule tentaclesRule
  (need-tentacles ?)
  =>
  (bind ?answer (ask "Does it have tentacles?"))
  (assert (tentacles (getFirst ?answer)))
)

(do-backward-chaining triangleHead)
(defrule triangleHeadRule
  (need-triangleHead ?)
  =>
  (bind ?answer (ask "Does it have a triangular head?"))
  (assert (triangleHead (getFirst ?answer)))
)

(do-backward-chaining domesticated)
(defrule domesticatedRule
  (need-domesticated ?)
  =>
  (bind ?answer (ask "Has it been domesticated?"))
  (assert (domesticated (getFirst ?answer)))
)

(do-backward-chaining ride)
(defrule rideRule
  (need-ride ?)
  =>
  (bind ?answer (ask "Can you ride it?"))
  (assert (ride (getFirst ?answer)))
)

(do-backward-chaining NorthAmerica)
(defrule northAmericaRule
  (need-NorthAmerica ?)
  =>
  (bind ?answer (ask "Can it be found in North America?"))
  (assert (NorthAmerica (getFirst ?answer)))
)

(do-backward-chaining SouthAmerica)
(defrule southAmericaRule
  (need-SouthAmerica ?)
  =>
  (bind ?answer (ask "Can it be found in South America?"))
  (assert (SouthAmerica (getFirst ?answer)))
)

(do-backward-chaining pet)
(defrule petRule
  (need-pet ?)
  =>
  (bind ?answer (ask "Is it a common household pet?"))
  (assert (pet (getFirst ?answer)))
)

(do-backward-chaining pink)
(defrule pinkRule
  (need-pink ?)
  =>
  (bind ?answer (ask "Is it pink?"))
  (assert (pink (getFirst ?answer)))
)

(do-backward-chaining Africa)
(defrule africaRule
  (need-Africa ?)
  =>
  (bind ?answer (ask "Can it be found in Africa?"))
  (assert (Africa (getFirst ?answer)))
)

(do-backward-chaining cat)
(defrule catRule
  (need-cat ?)
  =>
  (bind ?answer (ask "Is it a cat of some kind?"))
  (assert (cat (getFirst ?answer)))
)

(do-backward-chaining arctic)
(defrule arcticRule
  (need-arctic ?)
  =>
  (bind ?answer (ask "Does it live in the arctic or antartica?"))
  (assert (arctic (getFirst ?answer)))
)

(do-backward-chaining stripes)
(defrule stripesRule
  (need-stripes ?)
  =>
  (bind ?answer (ask "Does it have stripes?"))
  (assert (stripes (getFirst ?answer)))
)

(do-backward-chaining whitefur)
(defrule whitefurRule
  (need-whitefur ?)
  =>
  (bind ?answer (ask "Does it have whitefur?"))
  (assert (whitefur (getFirst ?answer)))
)

(do-backward-chaining bear)
(defrule bearRule
  (need-bear ?)
  =>
  (bind ?answer (ask "Is it a bear of some kind?"))
  (assert (bear (getFirst ?answer)))
)

(do-backward-chaining longneck)
(defrule longneckRule
  (need-longneck ?)
  =>
  (bind ?answer (ask "Does it have a long neck?"))
  (assert (longneck (getFirst ?answer)))
)

(do-backward-chaining maine)
(defrule maineRule
  (need-maine ?)
  =>
  (bind ?answer (ask "Does it have a maine?"))
  (assert (maine (getFirst ?answer)))
)

(do-backward-chaining primate)
(defrule primateRule
  (need-primate ?)
  =>
  (bind ?answer (ask "Is it a primate?"))
  (assert (primate (getFirst ?answer)))
)

(do-backward-chaining speed)
(defrule speedRule
  (need-speed ?)
  =>
  (bind ?answer (ask "Is known for its speed?"))
  (assert (speed (getFirst ?answer)))
)

(do-backward-chaining jaguar)
(defrule jaguarRule
  (need-jaguar ?)
  =>
  (bind ?answer (ask "Is it a jaguar?"))
  (assert (jaguar (getFirst ?answer)))
)

(do-backward-chaining bigEars)
(defrule bigEarsRule
  (need-bigEars ?)
  =>
  (bind ?answer (ask "Does it have big ears?"))
  (assert (bigEars (getFirst ?answer)))
)

(do-backward-chaining changecolor)
(defrule changeColorRule
  (need-changecolor ?)
  =>
  (bind ?answer (ask "Does it change color?"))
  (assert (changecolor (getFirst ?answer)))
)

(do-backward-chaining shell)
(defrule shellRule
  (need-shell ?)
  =>
  (bind ?answer (ask "Does it have a shell?"))
  (assert (shell (getFirst ?answer)))
)

(do-backward-chaining bird)
(defrule birdRule
  (need-bird ?)
  =>
  (bind ?answer (ask "Is it a bird of some kind?"))
  (assert (bird (getFirst ?answer)))
)

(do-backward-chaining sports)
(defrule sportsRule
  (need-sports ?)
  =>
  (bind ?answer (ask "Is it the logo of a major US sports team?"))
  (assert (sports (getFirst ?answer)))
)

(do-backward-chaining fly)
(defrule flyRule
  (need-fly ?)
  =>
  (bind ?answer (ask "Does it fly?"))
  (assert (fly (getFirst ?answer)))
)

(do-backward-chaining blue)
(defrule blueRule
  (need-cat ?)
  =>
  (bind ?answer (ask "Is it blue?"))
  (assert (blue (getFirst ?answer)))
)

(do-backward-chaining red)
(defrule redRule
  (need-red ?)
  =>
  (bind ?answer (ask "Is it red?"))
  (assert (red (getFirst ?answer)))
)

(do-backward-chaining nationalBird)
(defrule nationalBirdRule
  (need-nationalBird ?)
  =>
  (bind ?answer (ask "Is it the US National Bird?"))
  (assert (nationalBird (getFirst ?answer)))
)


(defrule giveUp
   (onLand n)
   (fish n)
   (reptile n)
   (mollusk n)
   =>
   (printout "I give up!" crlf)
)
(defrule salmon
   (onLand n)
   (fish y)
   (harmful n)
   (big n)
   (nemo n)
   (orangeCooked y)
   =>
   (printout t "It's a salmon!" crlf)
)

(defrule tuna
   (onLand n)
   (fish y)
   (harmful n)
   (big n)
   (nemo n)
   (orangeCooked n)
   =>
   (printout t "It's a tuna!" crlf)
)

(defrule BlueTang
   (onLand n)
   (fish y)
   (harmful n)
   (big n)
   (nemo y)
   (orange n)
   =>
   (printout t "It's a Blue Tang!" crlf)
)

(defrule Clownfish
   (onLand n)
   (fish y)
   (harmful n)
   (big n)
   (nemo y)
   (orange y)
   =>
   (printout t "It's a Clownfish!" crlf)
)

(defrule Blowfish
   (onLand n)
   (fish y)
   (harmful y)
   (big n)
   (nemo n)
   (sharpTeeth n)
   =>
   (printout t "It's a Blowfish!" crlf)
)

(defrule Piranha
   (onLand n)
   (fish y)
   (harmful y)
   (big n)
   (nemo n)
   (sharpTeeth y)
   (electric n)
   =>
   (printout t "It's a Piranha!" crlf)
)

(defrule Eel
   (onLand n)
   (fish y)
   (harmful y)
   (big n)
   (nemo n)
   (sharpTeeth y)
   (electric y)
   =>
   (printout t "It's an electric eel!" crlf)
)

(defrule Anglerfish
   (onLand n)
   (fish y)
   (harmful y)
   (big n)
   (nemo y)
   (light y)
   =>
   (printout t "It's an anglerfish!" crlf)
)

(defrule Baracuda
   (onLand n)
   (fish y)
   (harmful y)
   (big n)
   (nemo y)
   (light n)
   =>
   (printout t "It's a baracuda!" crlf)
)

(defrule Shark
   (onLand n)
   (fish y)
   (harmful y)
   (big y)
   =>
   (printout t "It's a shark!" crlf)
)


(defrule Narwal
   (onLand n)
   (fish n)
   (mammal y)
   (horn y)
   =>
   (printout t "It's a narwal!" crlf)
)

(defrule Whale
   (onLand n)
   (fish n)
   (mammal y)
   (horn n)
   (fin n)
   =>
   (printout t "It's a whale!" crlf)
)

(defrule Dolphin
   (onLand n)
   (fish n)
   (mammal y)
   (horn n)
   (fin y)
   =>
   (printout t "It's a dolphin!" crlf)
)

(defrule SeaTurtle
   (onLand n)
   (fish n)
   (mammal n)
   (reptile y)
   (dangerReptile n)
   =>
   (printout t "It's a sea turtle!" crlf)
)

(defrule Aligator
   (onLand n)
   (fish n)
   (mammal n)
   (reptile y)
   (dangerReptile y)
   (vShaped n)
   =>
   (printout t "It's an aligator!" crlf)
)

(defrule Crocodile
   (onLand n)
   (fish n)
   (mammal n)
   (reptile y)
   (dangerReptile y)
   (vShaped y)
   =>
   (printout t "It's a crocodile!" crlf)
)

(defrule Mussel
   (onLand n)
   (fish n)
   (mammal n)
   (reptile n)
   (mollusk y)
   (tentacles n)
   =>
   (printout t "It's a mussel!" crlf)
)

(defrule Octopus
   (onLand n)
   (fish n)
   (mammal n)
   (reptile n)
   (mollusk y)
   (tentacles y)
   (triangleHead n)
   =>
   (printout t "It's an octopus!" crlf)
)

(defrule Squid
   (onLand n)
   (fish n)
   (mammal n)
   (reptile n)
   (mollusk y)
   (tentacles y)
   (triangleHead y)
   =>
   (printout t "It's a squid!" crlf)
)

(defrule Horse
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride y)
   (NorthAmerica y)
   =>
   (printout t "It's a horse!" crlf)
)

(defrule Alpaca
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride y)
   (NorthAmerica n)
   (SouthAmerica y)
   =>
   (printout t "It's an alpaca!" crlf)
)

(defrule Camel
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride y)
   (NorthAmerica n)
   (SouthAmerica n)
   =>
   (printout t "It's a camel!" crlf)
)

(defrule Ox
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride n)
   (horn y)
   =>
   (printout t "It's an ox!" crlf)
)

(defrule Sheep
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride n)
   (horn n)
   (pet n)
   (pink n)
   =>
   (printout t "It's a sheep!" crlf)
)

(defrule Pig
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride n)
   (horn n)
   (pet n)
   (pink y)
   =>
   (printout t "It's a pig!" crlf)
)

(defrule Sheep
   (onLand y)
   (mammal y)
   (domesticated y)
   (ride n)
   (horn n)
   (pet y)
   =>
   (printout t "It's a dog!" crlf)
)

(defrule Polarbear
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa n)
   (arctic y)
   (whitefur y)
   =>
   (printout t "It's a polar bear!" crlf)
)

(defrule wolf
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa n)
   (arctic y)
   (whitefur n)
   =>
   (printout t "It's a wolf!" crlf)
)

(defrule Bear
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa n)
   (arctic n)
   (NorthAmerica y)
   =>
   (printout t "It's a bear!" crlf)
)

(defrule Giraffe
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile n)
   (Africa y)
   (stripes n)
   (longneck y)
   =>
   (printout t "It's a giraffe!" crlf)
)

(defrule Zebra
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile n)
   (Africa y)
   (stripes y)
   =>
   (printout t "It's a zebra!" crlf)
)

(defrule Monkey
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile n)
   (Africa y)
   (stripes n)
   (longneck n)
   =>
   (printout t "It's a monkey!" crlf)
)

(defrule Panda
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile n)
   (Africa n)
   (bear y)
   =>
   (printout t "It's a panda!" crlf)
)

(defrule monkey
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile n)
   (Africa n)
   (bear n)
   =>
   (printout t "It's a monkey!" crlf)
)

(defrule Lion
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa y)
   (cat y)
   (maine y)
   =>
   (printout t "It's a lion!" crlf)
)

(defrule Cheetah
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa y)
   (cat y)
   (maine n)
   (speed y)
   =>
   (printout t "It's a cheetah!" crlf)
)

(defrule Jaguar
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa y)
   (cat y)
   (maine n)
   (speed n)
   =>
   (printout t "It's a jaguar!" crlf)
)

(defrule Gorilla
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa y)
   (cat n)
   (primate y)
   =>
   (printout t "It's a gorilla!" crlf)
)

(defrule Elephant
   (onLand y)
   (mammal y)
   (domesticated n)
   (dangerReptile y)
   (Africa y)
   (cat n)
   (primate n)
   (bigEars y)
   =>
   (printout t "It's an elephant!" crlf)
)

(defrule Snake
   (onLand y)
   (mammal n)
   (reptile y)
   (bird n)
   (changecolor n)
   (shell n)
   =>
   (printout t "It's a snake!" crlf)
)

(defrule Tortoise
   (onLand y)
   (mammal n)
   (reptile y)
   (bird n)
   (changecolor n)
   (shell y)
   =>
   (printout t "It's a tortoise!" crlf)
)

(defrule Chameleon
   (onLand y)
   (mammal n)
   (reptile y)
   (bird n)
   (changecolor y)
   =>
   (printout t "It's a chameleon!" crlf)
)

(defrule Chameleon
   (onLand y)
   (mammal n)
   (reptile y)
   (bird n)
   (changecolor y)
   =>
   (printout t "It's a chameleon!" crlf)
)

(defrule BaldEagle
   (onLand y)
   (mammal n)
   (reptile y)
   (bird y)
   (fly y)
   (nationalBird y)
   =>
   (printout t "It's a bald eagle!" crlf)
)

(defrule Falcon
   (onLand y)
   (mammal n)
   (reptile y)
   (bird y)
   (fly y)
   (nationalBird n)
   =>
   (printout t "It's a falcon!" crlf)
)

(defrule Ostrich
   (onLand y)
   (mammal n)
   (reptile y)
   (bird y)
   (fly n)
   =>
   (printout t "It's an ostrich!" crlf)
)

(deffunction play ()
   (printline "welcome to 20 qs")
   (reset)
   (run)
)
