/*
** Created: February 10, 2019
** Last Modified: February 25, 2019
**
** Author(s): Arjun Akkiraju,
**            with assistance from: Dr. Eric R. Nelson
**
** The alphabeticHistogram file analyzes text by providing
** the number of times each character apperas. The output
** is represented in a histogram. In order to
** run the file, create a separate folder called "ExpertSystems"
** and  add another subfolder titled "AlphabeticHistogram". Insert this file,
** in the "AlphabeticHistogram" subfolder which has just been created.
** To run this file, open up a Jess prompt
** and type (batch ExpertSystems/AlphabeticHistogram/alphabeticHistogram.clp)
** with parentheses. Type (runAlphHist) to start the program, also with parentheses.
**
**               Functions included in this file
**
** slice$      - Slices the input token into a tokenized list
** hist        - Ouptuts a histogram with the data for the amount of
**             - times each character appears
** runAlphHist - Interacts with the user and gets the input value for
**             - the hist function

**               The following functions are provided in the "toolbox.clp" file **********
**               in the ExpertSystems subfolder in the Jess71p1 directory.
**
** print       - prints any argument
** printline   - print followed by a newline
** ask         - prompt the user and read back a token
** askline     - prompt the user and read back a line of text (a string)
** askQuestion - adds a question mark to the prompt used in ask
** toChar      - given an ASCII integer value, returns the ASCII character as a string
** boolp       - Test for boolean type
** xor         - Exclusive-OR for two boolean values
**
*/

(clear)

(batch ExpertSystems/toolbox.clp)

(defglobal ?*MAX_LETTERS* = 9)

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
   (printline "***************************")
   (printline "Run Anagrams")
   (printline "***************************")
   (printline "Only words with 9 or less letters will be analyzed")
   (bind ?input (ask "Enter a Word: "))
   (while (not (isLessThan ?word ?*MAX_LETTERS*))
      (bind ?word (ask "Enter a Word: "))
   )
   (return ?word)

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

   ;Used to separate words when they are printed out
   (bind ?space " ")

   (bind ?rule "(defrule createAnagram")

   ;Left-Hand Side

   ;Checks for an appropriate number of letters, each with a unique position
   (for (bind ?i 1) (<= ?i ?letNums) (++ ?i)

      (bind ?rule (str-cat ?rule " (Letter (c ?l" ?i ") "))

      (bind ?rule (str-cat ?rule "(p ?p" ?i))

      ;Ensures that positions are not repeated
      (for (bind ?j 1) (< ?j ?i) (++ ?j)

         (bind ?rule (str-cat ?rule "&~?p" ?j))
      )
      (bind ?rule (str-cat ?rule ")) "))

   )

   ;Right-Hand Side

   (bind ?rule (str-cat ?rule "=> (printout t "))

   ;Adds letters to the print statement
   (for (bind ?k 1) (<= ?k ?letNums) (++ ?k)

      (bind ?rule (str-cat ?rule "?l" ?k " "))

   )

   ;Makes each word go on a new line
   (bind ?rule (str-cat ?rule "crlf))" ))


   (build ?rule)
   (return ?rule)

) ;deffunction createRule (?numLetters)

/*
* This function starts by using the reset function to delete all
* existing facts to ensure that only anagrams of the users's input
* are generated. It then prompts the user for a String of text with
* 9 or fewer letters and checks the input using the anagramInput function.
* Once a valid input is obtained, the slice$ function converts the
* String into a list of characters which is then used by the assertList
* function to dynamically add facts containing the individual
* characters and their positions in the String to the working memory.
* The createRule function dynamically creates a rule that, when
* executed, generates anagrams of a word with a given length. The run
* function then starts the process of pattern matching and execution.
* All possible anagrams of the user's input are printed out, each one
* on a new line.
*/
(deffunction runAnagram ()

   (reset)

   (bind ?len (str-length ?word))

   (assertLetterList (slice$ (anagramInput)))

   (createRule ?len)

   (run)

   (return)

)
