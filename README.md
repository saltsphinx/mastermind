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

Find a way to tell the user how well they did. Remember, if there are 2 of a color in a code, the user needs two of that color to recieve feedback. Same if theres 3 or 4 of a color. I guess the best way to give feed back is to,
1. Create a copy of the color code array and an array for the feedback
2. Check for correct colors and correct positions FIRST, meaning the black pegs
3. If there are any possible black pegs, add a 'b' to the feedback array, and remove the color from the color code array
4. Check for correct colors, meaning the white pegs
5. If there are any possible white opegs, add a 'w' to the feedback array
6. There should be at most 4 feedback items, if there are less then add '+''s until the array length is 4

Is deleteing from only the copy array a good idea? Should I be deleteing from the key pegs instead? Or should I delete from both?

7/16/2021
AI Strat :
First three rounds, single colors, AKA 'red red red red', 'cyan cyan cyan cyan'

If there aren't at least two confirmed colors, one more round of single colors

By this point, lets say the bot has confirmed one red, one orange and ruled out green
round four or five, use the ruled out colors to confirm positions, rather thats confirming a color isnt in a position or is. I will probably have the colors in the array as objects, so itll store positions that it can or can not be
If at least 1 position is confirmed for all existing colors, continue, else one more round of color confirming 

What is the problem?
Creating an AI that can attempt to guess the user's color code.

What are the inputs? Will the user enter data or will it come from somewhere else?
The user will enter the code the AI has to solve. The AI will submit arrays of color codes to the board. The board will give feedback to the AI.

What’s the desired output?
Guesses about the users color code that has been run through several methods, attempting to narrow down the possible colors and positions

Given your inputs, what are the steps necessary to return the desired output?