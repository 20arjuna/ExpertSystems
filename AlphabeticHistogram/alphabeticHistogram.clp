/*
** Created: January 30, 2019
** Last Modified: February 1, 2019
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

*************   The following functions are provided in the "toolbox.clp" file **********
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



(batch ExpertSystems/toolbox.clp)

/*
** The slice$ function takes in a token and outputs
** a list of the tokenized characters which make up the
** token.
**
** Precondition: An input must be passed.
** Argument:     A token provided by the user.
** Returns:      A list of tokens which make up the input token.
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
** The main function of the file, the hist function outputs
** the alphabetic histogram of a given input string. The function
** prints out each letter in the alphabet along with the number of
** times it appears in the input token.
**
** Argument: An input token provided by the user.
*/
(deffunction hist (?input)
   (bind ?input (lowcase ?input))
   (bind ?newline "
   ")
   (bind ?letters (slice$ ?input))
   (bind ?ascii (create$))
   (bind ?nums (create$))

   (bind ?letterLength 26)
   (bind ?ascii_base 97)
   (for (bind ?i 1) (<= ?i ?letterLength) (++ ?i)
      (bind ?nums (create$ ?nums ?ascii_base))
      (++ ?ascii_base)
   )
   (bind ?input (slice$ ?input))
   (for (bind ?j 1) (<= ?j (length$ ?input)) (++ ?j)
      (bind ?ascii (create$ ?ascii (asc (nth$ ?j ?letters))))
   )
   (bind ?answerValue "")
   (for (bind ?i 1) (<= ?i (length$ ?nums)) (++ ?i)
      (bind ?count 0)
      (bind ?temp 0)
      (for (bind ?j 1) (<= ?j (length$ ?ascii)) (++ ?j)
         (bind ?temp (nth$ ?i ?nums))
         (if (= (str-compare (nth$ ?j ?ascii) (nth$ ?i ?nums)) 0) then
            (++ ?count)
         )
      )
      (bind ?answerValue (str-cat (toChar ?temp) " " (explode$ ?count) ?newline))
      (printline ?answerValue)
   )
   (return)
)

/*
** This function interacts with the user by prompting
** them for a string to analyze. The function accepts
** all forms of input but only analyzes letters. This
** function is the driver function for the entire file.
*/
(deffunction runAlphHist ()
   (printline "")
   (printline "***************************")
   (printline "Run Alphabetic Histogram")
   (printline "***************************")
   (printline "Only letters will be analyzed, not numbers or special characters")
   (hist (ask "Enter a string to analyze: "))
   (return)
)
