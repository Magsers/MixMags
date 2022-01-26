/* Reflection

Name : Margaret McCarthy

Student Number:  20095610

Part A - Mark (4.5 /5)
-----------------------------

Comments - 0.5/1
indente/formatted - 1/1 
naming - 1/1
inclusion of Readme - 1/1 
inclusion of Reflection - 1/1

Assuming my comments could have been more thorough I just gave a half mark for this.  

Part B - Mark (2 /2)
-----------------------------

Sizing. 1280 x 720




Part C - Mark (10 /10)
-----------------------------
line 30 - draw() 
line 24 - setup()


Part D - Mark (7 /10)
-----------------------------
Use of if statements:

line 63 for when the mouse hovers over the circular controls and the instructions have not already been displayed, then they are displayed.
line 102 Nested if for ensuring the diameter of the speakers reverts back to 0 when it gets so big.  
line 136 If statement using a boolean variable to ensure the record deck stays loaded after the mouse moves away from the deck
line 175 If statement to call methods when mouse hovers over the decks.  
line 262 activates square buttons when the mouse left clicks any of them or deactivates them if right clicked.  Also displays instructions when the mouse hovers over them.
line 266 & 268 nested ifs to distinguish between left and right mouse clicks on the CUE, SYNC and PLAY buttons

Part E - Mark (14 /20)
-----------------------------
Use of loops:

for loops used on:
line 39 for loop used to create a 3D effect by drawing multiple lines with a decrease in grayscale colour
line 57 for loop calls two methods in order to draw circular controls and square buttons
line 75 draws left and right speakers
line 82 nested for loop in order to create 3D effect on the speakers
line 127 for loop to give 3D effect on left deck
line 153 for loop to create 3D effect on right deck
line 250 for 3D effect on square controls


use of while loop on:
line 277 to create the text on the square buttons

I used mainly for loops in this assignment.  I didn't realise I was using so many and so little while loops.  I went back to change them but 
I'm halfway through the reflection now so think there is no need.  I didn't use any do loops.


Part F - Mark (17 /20)
-----------------------------
Use of at least one bespoke method 

line 200 crossFader takes in two parameters to draw the CrossFader
line 215 crossFader takes no parameters to display text.  Demonstration of overloading.
line 223 drawControls draw circular controls
line 243 drawButtons to draw the square buttons, CUE, SYNC, PLAY
line 286 loadLeftDeck to turn the deck red when left clicked to give the illusion of the record being loaded.  It turns black when right clicked to unload the record.
line 305 loadRightDeck to turn the deck red when left clicked to give the illusion of the record being loaded.  It turns black when right clicked to unload the record.
line 322 displayLeftTunes takes in a String parameter and displays the name of the tune inputted by the user when the left deck is loaded.
line 332 displayRightTunes takes in a String parameter and displays the name of the tune inputted by the user when the left deck is loaded.
line 343 instructionsDisplay Instructions displayed for decks when mouse hovers over them
line 349 loadButtonInstructions  Instructions displayed for CUE, SYNC and PLAY buttons when mouse hovers over them.

I used lots of methods, I have one example of overloading.  I used methods with parameters and without parameters.  I did not use a method that returns a value so I am giving 
myself 17/20.  

Part G - Mark (9 /10)
-----------------------------
Use of Processing methods 

line 33 random() to create an everchanging backgroud effet so that it looks like there is a disco or party going on behind the DJ station
line 38 rect() used throughout the assignment to draw rectangular shapes.  On line 38 to draw the mixer
line 54 line() to draw the line on the Master Volume so we know what level the volume is at
line 97 text() to write the text "Choons" on the speakers
line 105 fill() to give the yellow colour to the centre of the speaker
line 124 strokeWeight() to define the thickness of the stroke
line 129 stroke() to define the colour of the stroke of the shape we are drawing.  Used a calculation to decrease the grey colour with each loop to give a 3D effect



Part H - Mark (3 /10)
-----------------------------
Use of Mouse methods 

line 355 mouseClicked() used to call the method to save the PNG

I didn't use many mouse methods, just lots of mouse events.  The picture is just so interactive I was having trouble isolating the mouse method to just work when the 
mouse was hovering over a particular control.  It was being called the minute the programme would run and I did not want that.  Maybe I can be shown how to do this
after the assignment is submitted.  Example the Crossfader I wanted to use the mouseDragged method but it was just being called the minute I loaded the programme.
I don't know what I was doing wrong and I was spending too much time on it.  
...



Part I - Mark (7 /10)
-----------------------------
Use of String methods 

line 327 & 337 length() used in an if statement to return the length of the string, if it's greater than 20 it would be too big for the screen.
line 328 & 338 subString()  used to cut the string if too large to just the first 20 characters
line 330 & 340 toUpperCase() converts the string to upper case

I used 3 string methods which is very good so I am scoring myself 7/10
...


Part J - Mark (3 /3)
-----------------------------
Use of .PNG methods 

line 361 calls the method saveMySketch which saves my sketch as a PNG file every time the right mouse button is pressed.  


*/
