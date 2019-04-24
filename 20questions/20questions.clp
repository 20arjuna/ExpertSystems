

(clear)
(reset)

(batch ExpertSystems/toolbox.clp)

(defglobal ?*questionNum* = 0) ;global variable used to find which numbered question is being answered

(do-backward-chaining onLand)
(do-backward-chaining fish)
(defrule onLandRule
   (need-onLand ?)
   =>
   (bind ?*questionNum* (+ ?*questionNum* 1))
   (print "Question ")
   (print "#")
   (print ?*questionNum*)
   (print ": ")
   (bind ?answer (ask "Does it live on land?"))
   (assert (onLand (getFirst ?answer)))
)


(defrule fishRule
  (need-fish ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it a fish?"))
  (assert (fish (getFirst ?answer)))
)

(do-backward-chaining mammal)
(defrule mammalRule
  (need-mammal ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it a mammal?"))
  (assert (mammal (getFirst ?answer)))
)

(do-backward-chaining reptile)
(defrule reptileRule
  (need-reptile ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it a reptile?"))
  (assert (reptile (getFirst ?answer)))
)

(do-backward-chaining mollusk)
(defrule molluskReptile
  (need-mollusk ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it a mollusk?"))
  (assert (mollusk (getFirst ?answer)))
)

(do-backward-chaining harmful)
(defrule harmfulRule
  (need-harmful ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it harmful to humans?"))
  (assert (harmful (getFirst ?answer)))
)

(do-backward-chaining big)
(defrule bigRule
  (need-big ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it bigger than a human?"))
  (assert (big (getFirst ?answer)))
)

(do-backward-chaining nemo)
(defrule nemoRule
  (need-nemo ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it found in the movie Finding Nemo?"))
  (assert (nemo (getFirst ?answer)))
)

(do-backward-chaining orange)
(defrule orangeRule
  (need-orange ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it orange?"))
  (assert (orange (getFirst ?answer)))
)

(do-backward-chaining orangeCooked)
(defrule orangeCookedRule
  (need-orangeCooked ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it orange when cooked?"))
  (assert (orangeCooked (getFirst ?answer)))
)

(do-backward-chaining big)
(defrule bigRule
  (need-big ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it bigger than a human?"))
  (assert (big (getFirst ?answer)))
)

(do-backward-chaining nemo)
(defrule nemoRule
  (need-nemo ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it found in the movie Finding Nemo?"))
  (assert (nemo (getFirst ?answer)))
)

(do-backward-chaining sharpTeeth)
(defrule sharpTeethRule
  (need-sharpTeeth ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have sharp teeth?"))
  (assert (sharpTeeth (getFirst ?answer)))
)

(do-backward-chaining electric)
(defrule electricRule
  (need-electric ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it electric?"))
  (assert (electric (getFirst ?answer)))
)

(do-backward-chaining light)
(defrule lightRule
  (need-light ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have a light attached to it?"))
  (assert (light (getFirst ?answer)))
)


(do-backward-chaining horn)
(defrule hornRule
  (need-horn ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have a horn?"))
  (assert (horn (getFirst ?answer)))
)

(do-backward-chaining fin)
(defrule finRule
  (need-fin ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have a fin?"))
  (assert (fin (getFirst ?answer)))
)

(do-backward-chaining dangerReptile)
(defrule dangerReptileRule
  (need-dangerReptile ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it dangerous to humans?"))
  (assert (dangerReptile (getFirst ?answer)))
)

(do-backward-chaining vShaped)
(defrule vShapedRule
  (need-vShaped ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have a v-shaped snout?"))
  (assert (vShaped (getFirst ?answer)))
)

(do-backward-chaining tentacles)
(defrule tentaclesRule
  (need-tentacles ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have tentacles?"))
  (assert (tentacles (getFirst ?answer)))
)

(do-backward-chaining triangleHead)
(defrule triangleHeadRule
  (need-triangleHead ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have a triangular head?"))
  (assert (triangleHead (getFirst ?answer)))
)

(do-backward-chaining domesticated)
(defrule domesticatedRule
  (need-domesticated ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Has it been domesticated?"))
  (assert (domesticated (getFirst ?answer)))
)

(do-backward-chaining ride)
(defrule rideRule
  (need-ride ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Can you ride it?"))
  (assert (ride (getFirst ?answer)))
)

(do-backward-chaining NorthAmerica)
(defrule northAmericaRule
  (need-NorthAmerica ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Can it be found in North America?"))
  (assert (NorthAmerica (getFirst ?answer)))
)

(do-backward-chaining SouthAmerica)
(defrule southAmericaRule
  (need-SouthAmerica ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Can it be found in South America?"))
  (assert (SouthAmerica (getFirst ?answer)))
)

(do-backward-chaining pet)
(defrule petRule
  (need-pet ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it a common household pet?"))
  (assert (pet (getFirst ?answer)))
)

(do-backward-chaining pink)
(defrule pinkRule
  (need-pink ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it pink?"))
  (assert (pink (getFirst ?answer)))
)

(do-backward-chaining Africa)
(defrule africaRule
  (need-Africa ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Can it be found in Africa?"))
  (assert (Africa (getFirst ?answer)))
)

(do-backward-chaining cat)
(defrule catRule
  (need-cat ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it a cat of some kind?"))
  (assert (cat (getFirst ?answer)))
)

(do-backward-chaining arctic)
(defrule arcticRule
  (need-arctic ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it live in the arctic or antartica?"))
  (assert (arctic (getFirst ?answer)))
)

(do-backward-chaining stripes)
(defrule stripesRule
  (need-stripes ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have stripes?"))
  (assert (stripes (getFirst ?answer)))
)

(do-backward-chaining whitefur)
(defrule whitefurRule
  (need-whitefur ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have whitefur?"))
  (assert (whitefur (getFirst ?answer)))
)

(do-backward-chaining bear)
(defrule bearRule
  (need-bear ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it a bear of some kind?"))
  (assert (bear (getFirst ?answer)))
)

(do-backward-chaining longneck)
(defrule longneckRule
  (need-longneck ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have a long neck?"))
  (assert (longneck (getFirst ?answer)))
)

(do-backward-chaining maine)
(defrule maineRule
  (need-maine ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have a maine?"))
  (assert (maine (getFirst ?answer)))
)

(do-backward-chaining primate)
(defrule primateRule
  (need-primate ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it a primate?"))
  (assert (primate (getFirst ?answer)))
)

(do-backward-chaining speed)
(defrule speedRule
  (need-speed ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is known for its speed?"))
  (assert (speed (getFirst ?answer)))
)

(do-backward-chaining jaguar)
(defrule jaguarRule
  (need-jaguar ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it a jaguar?"))
  (assert (jaguar (getFirst ?answer)))
)

(do-backward-chaining bigEars)
(defrule bigEarsRule
  (need-bigEars ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have big ears?"))
  (assert (bigEars (getFirst ?answer)))
)

(do-backward-chaining changecolor)
(defrule changeColorRule
  (need-changecolor ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it change color?"))
  (assert (changecolor (getFirst ?answer)))
)

(do-backward-chaining shell)
(defrule shellRule
  (need-shell ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it have a shell?"))
  (assert (shell (getFirst ?answer)))
)

(do-backward-chaining bird)
(defrule birdRule
  (need-bird ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it a bird of some kind?"))
  (assert (bird (getFirst ?answer)))
)


(do-backward-chaining fly)
(defrule flyRule
  (need-fly ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Does it fly?"))
  (assert (fly (getFirst ?answer)))
)

(do-backward-chaining blue)
(defrule blueRule
  (need-cat ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it blue?"))
  (assert (blue (getFirst ?answer)))
)

(do-backward-chaining red)
(defrule redRule
  (need-red ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it red?"))
  (assert (red (getFirst ?answer)))
)

(do-backward-chaining nationalBird)
(defrule nationalBirdRule
  (need-nationalBird ?)
  =>
  (bind ?*questionNum* (+ ?*questionNum* 1))
  (print "Question ")
  (print "#")
  (print ?*questionNum*)
  (print ": ")
  (bind ?answer (ask "Is it the US National Bird?"))
  (assert (nationalBird (getFirst ?answer)))
)


(defrule giveUp
   (onLand n)
   (fish n)
   (reptile n)
   (mollusk n)
   =>
   (printout t "I give up!" crlf)
   (halt)
)
(defrule salmon
   (onLand n)
   (fish y)
   (harmful n)
   (nemo n)
   (orangeCooked y)
   =>
   (printout t "It's a salmon!" crlf)
)

(defrule tuna
   (onLand n)
   (fish y)
   (harmful n)

   (nemo n)
   (orangeCooked n)
   =>
   (printout t "It's a tuna!" crlf)
)

(defrule BlueTang
   (onLand n)
   (fish y)
   (harmful n)

   (nemo y)
   (orange n)
   =>
   (printout t "It's a Blue Tang!" crlf)
)

(defrule Clownfish
   (onLand n)
   (fish y)
   (harmful n)

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
   (halt)
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
   (printline "**** Think of an animal game ****")
   (printline "Think of an animal and answer the following questions!")
   (printline "Only respond in words starting 'y' for yes and 'n' for no.")
   (printline "All other input will close the program.")
   (printline "The program will use no more than 8 attempts to guess the animal.")
   (reset)
   (run)
)
