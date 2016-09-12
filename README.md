# Pipes-and-Underscores
This is my take on solving a coding dojo problem of converting pipes and underscores to readable digits

## Problem ##

You work for a bank, which has recently purchased an ingenious machine to assist in reading letters and faxes sent in by branch offices. The machine scans the paper documents, and produces a file with a number of entries which each look like this:

```
    _  _     _  _  _  _  _
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _| 
                           
```
Each entry is 4 lines long, and each line has 27 characters. The first 3 lines of each entry contain an account number written using pipes and underscores, and the fourth line is blank. Each account number should have 9 digits, all of which should be in the range 0-9. A normal file contains around 500 entries.

Your initial task is to write a program that can take this file and parse it into actual account numbers. 

## Solution ##

I have used Ruby to solve this challenge. The basic idea here is to identify each number 
(that involves reading the text file in the following format - 3 lines x 3 characters per digit, stored in an array.
 so for every account number, I have 9 sub-arrays, that each contain the pipes and underscores represnting a digit Each Sub-array is of the following format
```
 "   " +
 "|_|" +
 "  |" +
```
 ).

The next step after reading the text file is to parse it - that is identify each sub-array into a recognisable digit.

Once identified, I write it to a text file in the *Output* folder. 

## Running the program ##

* Ruby 1.9+ is required
* Clone the repo, type in ***ruby startProcess.rb*** to start the processing of given input

## Input ##

* There are 3 types of input for the program. They can be found in ***Source*** folder. 
* The ***big_data.txt*** contains nearly 9k lines of account number, while the ***data.txt*** file contains 500 lines as per the problem
* The ***sample.txt*** file has a single account number in the specified format to test the parsing function of the program
* To include any of these files, simply change them in the ***startProcess.rb*** file under *source* value

## Output ##

* The output, which is a file containing the parsed account numbers, can be found in the ***Output*** folder
* Once again, you can change this by changing the *destination* value in ***startProcess.rb*** file

## Tests ##

Tests have been written for most classes. There are no tests currently for Writer class, but I intend to wite soon for them.
