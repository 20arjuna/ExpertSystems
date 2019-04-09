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

(batch ExpertSystems/toolbox.clp)

(defglobal ?*MAX_LETTERS* = 9) ;found by creating anagrams of increasing lengths
                               ;until system crashes

/*
* A template for adding letters into the mahine's working memeory.
*
* Argument: c            The character being added to the memeory
* Argument: p            The position of the character
*/
(deftemplate Letter (slot c) (slot p))

/*
* The slice$ function takes in a token and outputs
* a list of the tokenized characters which make up the
* token. The function uses Jess's explode$ function to create a list
* of words without whitespace. Then, the function iterates over that
* list and uses jess's sub-string function to get the characters within
* the word and return those characters in a list format.
* Precondition: An input must be passed.
* Argument:     A token provided by the user.
* Returns:      A list of tokens which make up the input token.
*/
(deffunction slice$ (?n)
   (bind ?stringList (explode$ ?n))
   (bind ?answer (create$))
   (foreach ?string ?stringList
      (for (bind ?index 1) (<= ?index (str-length ?string)) (++ ?index)
         (bind ?answer (create$ ?answer (explode$ (sub-string ?index ?index ?string))))
      )
   )
  (return ?answer)
)

/*
* Determines whether or not a certain word's length is less than a certain length.
*
* Argument: word        The word
* Argument: length      The length the word is being compared to.
* Returns:              True if the word's length <= the given length; otherwise,
*                       False
*/
(deffunction isLessThan (?word ?length)
   (return (<= (str-length ?word) ?length))
)

/*
* Prompts the user for a word while checking if the
* length of the user's input is less than or equal to the MAX_LETTERS constant.
* The function uses a while-loop to keep prompting the user until a valid
* input is recieved. The function returns the user's
* input once a String of text whose length is less than or equal to MAX_LETTERS constant
* is entered.
*
* Returns: The valid input entered by the user
*/
(deffunction getInput ()
   (printline "")
   (printline "*************************")
   (printline "     Run Anagrams")
   (printline "*************************")
   (printline "Only inputs with 9 or less letters will be analyzed.")
   (bind ?input (ask "Enter a Word: "))
   (while (not (isLessThan ?input ?*MAX_LETTERS*))
      (printline "Invalid! 9 or less letters only please!")
      (bind ?input (ask "Enter a Word: "))
   )
   (return ?input)

)

/*
* Asserts a letter based on the letter template with the two given values
* as slot values.
*
* Argument: letter        The letter being asserted.
* ArgumentL pos           The position of the letter.
*/
(deffunction assertLetter (?letter ?pos)
   (assert (Letter (c ?letter) (p ?pos)))
   (return)
)

/*
* assertLetterList takes in a list of letters and asserts each letter
* using the assertLetter function and a for loop to iterate over the list.
*
* Argument: list              The list of letters to be asserted
*/
(deffunction assertLetterList (?list)
   (for (bind ?i 1) (<= ?i (length$ ?list)) (++ ?i)

      (bind ?temp ?i)
      (assertLetter (nth$ ?temp ?list) ?temp)

   )

   (return)

)

/*
* createRule uses an argument representing the number of letters in a certain word to
* dynamically create rules which prints out all possible anagrams
* of a word with the given length. Using a for loop, the left side of the rule checks for
* a set number of letters while ensuring that there is not a position that is repeated, along with
* a right-hand side that will print letters out to form words.
* createRule uses Jess's build function to define the rule and the String of text
* used as an argument for the build function is returned.
*
* Argument: letNums     A number representing the number of letters in a certain word.
* Returns:              The rule being created.
*/
(deffunction createRule (?letNums)

   (bind ?space " ")
   (bind ?rule "(defrule createAnagram")

   /*LHS*/
   (for (bind ?i 1) (<= ?i ?letNums) (++ ?i)
      (bind ?rule (str-cat ?rule " (Letter (c ?l" ?i ") "))
      (bind ?rule (str-cat ?rule "(p ?p" ?i))

      (for (bind ?j 1) (< ?j ?i) (++ ?j)
         (bind ?rule (str-cat ?rule "&~?p" ?j))
      )
      (bind ?rule (str-cat ?rule ")) "))

   )
   /*RHS*/

   (bind ?rule (str-cat ?rule "=> (printout t "))
   (for (bind ?k 1) (<= ?k ?letNums) (++ ?k)
      (bind ?rule (str-cat ?rule "?l" ?k " "))
   )

   (bind ?rule (str-cat ?rule "crlf))" ))


   (build ?rule)
   (return ?rule)

)

/*
* The driver function for the anagram file.
* runAnagram calls Jess's reset function first to remove
* existing facts so that only user-inputted anagrams are generated.
* It then prompts the user for a String of text with
* 9 or fewer letters (since that is the max amount of letters the system can handle)
* and validates the input using the getInput function.
* Once a valid input is entered by the user, the slice$ function converts the
* string into a list of characters, excluding whitespace, which is fed into the assertLetterList
* function, as it dynamically adds facts containing the individual
* characters and their positions in the String to the machine's memory.
* The createRule function dynamically creates a rule that creates anagrams
* of a certain word and length. The run
* function is the last function called before return, and it starts up the rule engine.
* When the rule engine starts, process of matching the fact patterns to the rule patterns
* begins and rules are fired based on the facts which have been asserted.
*/
(deffunction runAnagram ()

   (reset)

   (bind ?input (getInput))
   (bind ?length (str-length ?input))

   (assertLetterList (slice$ ?input))
   (createRule ?length)

   (run)
   (return)

)
(runAnagram)
