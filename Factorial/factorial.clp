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
** input and reporting it to the user. In order to
** run the file, create a separate folder called "ExpertSystems"
** and then add another subfolder titled "Factorial". Insert this file,
** in the "Factorial" subfolder.                         
** To run this file, open up a Jess prompt 
** and type (batch ExpertSystems/Factorial/factorial.clp) with parentheses. 
** Type (run) to start the program, also with parentheses. 
**
**               Functions included in this file
** 
** fact        - returns the factorial of a given value
**	       - checks for bad data from the user and 
**	       - reports it back to the user
** isNumber    - checks wether or not a given value is a number
** isNonNegative - checks whether or not a given value is non-negative
** factorial   - calls on the fact function to calculate the factorial
**             - of a given value (assuming it is a non-negative number)
**	       - if this is not the case, the function alerts the user that
**	       - they passed in bad input to the function
** run	       - manages and executes the 4 functions above by calling them
**             - in order, effectively driving the execution of this file.
**
**               The following functions are provided in the "utilities.clp" file 
**               in the ExpertSystems subfolder in the Jess71p1 directory.                       **
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
(printline "Type (run) with parentheses in the next Jess prompt to run the factorial program.")

/*
** Function that computes the factorial of the given input. Alerts the user if bad
** input is received. 
** Bad input is defined as input which is either not a number, or
** a number which is negative.
**
** Precondition: The number provided by the user must be non negative, or
**  	  	 greater than or equal to 0.
** Argument:     A number provided by the user.
** 
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
       (bind  ?answer "Enter an actual number please!")
    elif (not (isNonNegativeNumber ?n)) then
       (bind  ?answer "Number must be positive!")
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
*/
(deffunction run () 
   (printline "")

   (printline "************************")
   (printline "Factorial Calculator")
   (printline "************************")

   (printline "Please note that floating point numbers will be truncated into integers.") 
   (printline "For example: 15.45 will be interpreted as 15.")
   (printline (factorial (ask "Which number would you like to know the factorial of: ")))
)


