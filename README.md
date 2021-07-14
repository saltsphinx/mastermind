What is the problem?
Building a Mastermind console game where the user can either choose Mastermind or Codebreaker mode. For codebreak, the computer creates a 4 color code, with a chose between 6 colors and possible duplicates. The player is given given 8 turns to try and figure out the code, and they're given feedback in the form of visual idenications on how close they are to solving.

In Mastermind mode, the computer plays by the rules above, and the user creates their own code for the computer to try to break. 

Is there an interface? No, it will be played in the console.

What are the inputs? 
The inputs come from the user through typing commands into the console.

What is the desired output?
Interaction between the program and the user. For example, guessing the code, creating the code, resetting the game and changing game modes at any point during the game.

Given the inputs, what are the steps required to achieve the desired output?

First, determine the code colors : Red, Green, Purple, Cyan, Blue, Orange
Second Setup the mastermind.rb, create a main menu method that gives the user options such as: Play and the two playing options(Codebreaker and Mastermind) and game rules.

For codebreaker, the user wont play against AI. They will simply submit their guesses to the board instance, and the instance will handle everything. For example, having a method to generate 