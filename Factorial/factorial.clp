/*
** Created: January 27, 2019
** Last Modified: January 30, 2019
** 
** Author(s): Arjun Akkiraju,
**            with assistance from: Dr. Eric R. Nelson 
**
** The factorial class provides functions to
** calculate and report the value of the factorial
** of a user generated number while detecting wrong
** input and reporting it to the user. This program
** only accepts non negative integers. If a negative number
** or an unknown token (such as a string) is entered
** into this program, a message will appear, alerting the user
** of their mistake. If a floating point number is entered, then
** the truncated integer of that number will be used to calculate
** the factorial. This will be noted in the user interface. In order to
** execute this program, create a separate folder called "ExpertSystems"
** and then add another subfolder titled "Factorial". Insert this file,
** in the "Factorial" subfolder. To load this file, open up a Jess prompt 
** and type (batch ExpertSystems/Factorial/factorial.clp) with parentheses. 
** Type (runFactorial) to start the program, also with parentheses. 
**
**               Functions included in this file
** 
** fact         - returns the factorial of a given value
**	        - checks for bad data from the user and 
**	        - reports it back to the user
** isNumber     - checks wether or not a given value is a number
** isNonNegative- checks whether or not a given value is non-negative
** factorial    - calls on the fact function to calculate the factorial
**              - of a given value (assuming it is a non-negative number)
**	        - if this is not the case, the function alerts the user that
**	        - they passed in bad input to the function
** runFactorial - manages and executes the 4 functions above by calling them
**              - in order, effectively driving the execution of this file.
**
**               The following functions are provided in the "utilities.clp" file 
**               in the ExpertSystems subfolder in the Jess71p1 directory.    
**                   
** print       - prints any argument
** printline   - print followed by a newline
** ask         - prompt the user and read back a token
** askline     - prompt the user and read back a line of text (a string)
** askQuestion - adds a question mark to the prompt used in ask
** 
*/

; Loads the "utilities.clp" file and confirms that the factorial file has been loaded.
; Also informs the user how to start the program.

(batch ExpertSystems/utilities.clp) 
(printline "")                      
(printline "Factorial File Loaded!") 
(printline "Type (runFactorial) with parentheses in the next Jess prompt to run the factorial program.")

/*
** Function that computes the factorial of the given input. Alerts the user if bad
** input is received. 
** Bad input is defined as input which is either not a number,
** a number which is negative, or a number which is not an integer.
**
** Precondition: The number provided by the user must be a non negative integer, 
**  	  	 meaning that it must be greater than or equal to 0.
** Argument:     A number provided by the user.
** Returns:      The factorial of the integer inserted by the user.
*/
(deffunction fact (?n)
   
   (if (= ?n 0) then
       (bind ?answer 1)
    else
       (bind ?answer (* ?n (fact(- ?n 1))) )
   )
   
   (return ?answer)
)

/*
** Partially checks whether a given input is valid. 
** Specifically, it checks whether the input is a number or not.
**
** Argument: The user's input token.
** Returns:  TRUE if the input token is a number; otherwise,
             FALSE
*/
(deffunction isNumber (?n)
   (return (numberp ?n))
)

/*
** Partially checks whether a given input is valid. 
** Specifically, it checks whether the input is a non negative number or not.
** A non negative number is a number greater than or equal to 0.
**
** Precondition: The given input is a number.
** Argument:     A number provided by the user.
** Returns:      TRUE if the number is non negative; otherwise,
**               FALSE.
*/
(deffunction isNonNegativeNumber (?n)
   (if (< ?n 0) then
       (bind ?answer FALSE)
    else 
       (bind ?answer TRUE)
   )
   (return ?answer)
)

/*
** Function for the factorial calculation which which checks the validity of the user's
** input and either calculates the factorial, or alerts the user
** that they passed in bad input. Bad input is defined as input which is 
** either not a number, or a number which is negative.
**
** Argument: The user's input token.
** Returns:  The factorial of the user's token if it is a non negative number,
**           or a statement alerting the user if it is either not a number,
**           or a negative number.
*/
(deffunction factorial (?n)
   (if (not (isNumber ?n)) then 
       (bind  ?answer "Enter an actual number please! Type (runFactorial) to try again.")
    elif (not (isNonNegativeNumber ?n)) then
       (bind  ?answer "Number must be positive! Type (runFactorial) to try again.")
    else
       (bind ?nLong ?n)
       (if (not (longp ?nLong)) then
          (bind ?nLong (long ?nLong))
       )      
       (bind ?answer (fact ?nLong))
    )
   
   (return ?answer)
)

/*
** Driver function for the factorial operation. Presents the user with an interactive
** user interface while taking in a value to calculate the factorial for. The function
** weeds out bad input (values which are either not numbers or nonnegative numbers) to
** ensure that the program can accept any value from the user without crashing.
**
** Returns: void
*/
(deffunction runFactorial () 
   (printline "")

   (printline "************************")
   (printline "Factorial Calculator")
   (printline "************************")

   (printline "Please note that floating point numbers will be truncated into integers.") 
   (printline "For example: 15.45 will be interpreted as 15.")
   (printline (factorial (ask "Which number would you like to know the factorial of: ")))
   (return)
)


