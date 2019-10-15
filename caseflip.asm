/ Case Flipper Program
/ Matt Stillwell
/ 10-15-2019


/ -------------
/  Main
/ -------------
Load Start              / Initialize pointer to start of block
Store Pointer

Load LowerE             / Test with lower case 'e'
Store InVal             / Store in input variable

JNS Flip                / Call subroutine - check return value in AC
STORE Pointer           / Store result in memory

Output                  / Display results
Halt                    / Done


/ -------------
/  Subroutines
/ -------------
Flip,  HEX 0
       Load InVal       / Get input character
       Subt CheckLC     / Check if input less than 'a' by subtracting CheckLC from input
       Skipcond 800     / Skip if result is positive (letter is lower case)
       Jump IsUC        / Character is upper case

IsLC,  Load InVal       / Character is lower case, restore value
       Subt LC2UC       / Add adjustment to make upper case
       Jump Done        / Finished

IsUC,  Load InVal       / Character is upper case, restore value
       Add LC2UC        / Add adjustment to make lower case
       Jump Done        / Finished

Done,  JumpI Flip		/ Return with result in AC



/ -------------
/  Variables
/ -------------
Start,   HEX 200        / Constant address for start of character block
CheckLC, DEC 96         / Const value 'a'-1 to check if lower case
Plus,    DEC 43         / Constant '+' char that marks end of input
LC2UC,   DEC 32         / Adjustment for lower case to upper case
One,     DEC 1          / Constant 1
UpperE,  DEC 69         / Upper case 'E' (just for start example)
LowerE,  DEC 101        / Lower case 'e' (just for start example)

Pointer, HEX 0          / Reserved for character pointer in main routine
InVal,   HEX 0          / Reserved for Flip subroutine input value
