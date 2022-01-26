/*Margaret McCarthy //<>// //<>//
 Student Number : 20095610
 This is a DJ station with two record decks, a mixer in the middle and two speakers.  The flashing background is to give the effect of a party or disco going on in the background.  
 You can load the decks by hovering the mouse over each one and left clicking.  Right clicking deselects your record.  The speakers start booming as if there is music coming from 
 them when you hover the mouse over them.  You can move the crossfader which is in reality turns the output audio left if you push it left and vice versa.  It plays both equalyy 
 if it is in the middle.  You can activate the Cue, Sync and Play buttons by left clicking and deactivate them by right clicking on the buttons.  If you hover over the circular 
 controls you are given the option to read these instructions or not.  
 */

import javax.swing.JOptionPane;

float diameterDeckLeft = 50;                                //declare global variables
float diameterDeckRight = 50;
int diameterSpeaker = 0;
boolean deckColorLeft = false;
boolean deckColorRight = false;
boolean controlOn = false;
int r=255;
boolean instructions = true;

String tuneLeft = JOptionPane.showInputDialog("Please input a tune you want to play", "Starman");
String tuneRight = JOptionPane.showInputDialog("Please input another tune you want to play", "Brother Louie");

void setup()
{
  size(1280, 720);
  frameRate(30);
}

void draw()
{

  background (random(r), random(r), random(r));              //to give the effect of a disco/party in the background
  fill(50);                                                    //draw DJ station
  rect(20, 10, 1240, 680);
  fill(0);
  stroke(255);                                                //draw Mixer
  rect(465, 25, 340, 610);
  for (int i=0; i<15; i++)                                    //3D effect on Mixer
  {                                                         
    stroke(150-i*10);
    rect(465+i, 635+i, 340, 1);
    rect(805+i, 25+i, 1, 610);
  }
  for (float i=0; i<10; i++)                                    //3D effect on Master Volume
  {
    fill(255-i*15);                                                  
    ellipse(640+i*0.5, 80+i*0.5, 55, 55);
  }
  strokeWeight(3);
  stroke(255, 0, 0);
  fill(0);
  ellipse(640, 80, 50, 50);                                     //Master Volume
  line(640, 80, 615, 80);

  crossFader(620, 550);                                        //Call crossfader method to draw the Crossfader 
  for (int i=0; i<3; i++)                                      //draw circle controls and square buttons using a for loop to call the methods drawControls and drawButtons
  {
    drawControls(255, 540, 100+i*60, 40);    
    drawButtons(510, 400+i*50, 50, 30);
  }

  if (((mouseX>= 450 && mouseX<= 750) && (mouseY >= 35 && mouseY<= 250)) && (instructions)) //if mouse hovers over circular controls, instructions message window pops up.  
  {

    int reply = JOptionPane.showConfirmDialog(null, "Do you need further instructions", "Instructions", JOptionPane.YES_NO_OPTION);
    if (reply==JOptionPane.YES_OPTION)
    {
      JOptionPane.showMessageDialog(null, "Hover mouse over speakers to get them pumping.\n\nLeft click the decks to load a record, right click to unload\n\nMove the crossfader left or right by moving the mouse over it.\n\nLeft click the square buttons to activate, right click to deactivate.", "Instructions", JOptionPane.PLAIN_MESSAGE);
      instructions = false;
    }
  }

  //SPEAKERS
  for (int j=0; j<2; j++)                                            //draw left and right speakers
  {
    stroke(255);                                                    
    strokeWeight(2);
    fill(0);
    rect(155+j*780, 35, 190, 210);                                    //black outter rectangle

    for (int i=0; i<15; i++)                                         //for loop to creat 3D effect
    {                                       
      stroke(150-i*10);
      rect(155+i, 245+i, 190, 1);
      rect(345+i, 35+i, 1, 210);
      rect(935+i, 245+i, 190, 1);
      rect(1125+i, 35+i, 1, 210);
    }
    noStroke();                                                        //small grey upper circle
    fill(100);
    ellipse(250+j*780, 70, 50, 50); 
    fill(0);                                                           //small black inner circle
    ellipse(250+j*780, 70, 30, 30); 
    fill(255);                                                         //text Choons
    textSize(10);
    text("Choons", 280+j*770, 100); 

    if (((mouseX>150 && mouseX <350) &&  (mouseY >30 && mouseY<250)) || ((mouseX>930 && mouseX <1130) &&  (mouseY >30 && mouseY<250)) )  //speakers pumping
    {
      diameterSpeaker=diameterSpeaker +1;
      if (diameterSpeaker>73) 
        diameterSpeaker=0;

      fill(#E0FF00);
      stroke(100);
      strokeWeight(3);
      ellipse(250+j*780, 160, 100+diameterSpeaker, 100+diameterSpeaker);   //yellow circle expanding
      fill(0);
      ellipse(250+j*780, 160, diameterSpeaker++, diameterSpeaker++);       //black inner circle expanding
    } else 
    {
      fill(#E0FF00);
      stroke(100);
      strokeWeight(3);
      ellipse(250+j*780, 160, 90, 90);                                       //yellow circle
      fill(0);
      ellipse(250+j*780, 160, 40, 40);                                       //black inner circle
    }
  }

  //DECKS  
  stroke(255);                                                             //left deck                                                 
  strokeWeight(3);
  fill(0);
  rect(170, 360, 250, 250);
  for (int i=0; i<15; i++)                                                  //for loop to give 3D effect on left deck
  {
    stroke(150-i*10);
    rect(170+i, 610+i, 250, 1);
    rect(420+i, 360+i, 1, 250);
  }
  stroke(100);
  strokeWeight(3);

  if (deckColorLeft) { 
    displayLeftTunes(tuneLeft);                                          //if statement to ensure left deck color stays red if it was loaded or black if unloaded
    fill(255, 0, 0);
  } else 
  fill(0);

  ellipse(295, 485, diameterDeckLeft, diameterDeckLeft);
  fill(100);
  ellipse(295, 485, 30, 30);
  fill(255);
  rect(295, 480, 100, 15);
  rect(395, 478, 25, 20);

  stroke(255);                                                                //right deck
  strokeWeight(3);
  fill(0);
  rect(860, 360, 250, 250);
  for (int i=0; i<15; i++)                                                     //for loop to give 3D effect on right deck
  {                                                  
    stroke(150-i*10);
    rect(860+i, 610+i, 250, 1);
    rect(1110+i, 360+i, 1, 250);
  }
  stroke(100);
  strokeWeight(3);

  if (deckColorRight) {
    displayRightTunes(tuneRight);                                                //if statement to ensure right deck color stays red if it was loaded or black if unloaded
    fill(255, 0, 0);
  } else 
  fill(0);

  ellipse(985, 485, diameterDeckRight, diameterDeckRight);
  fill(100);
  ellipse(985, 485, 30, 30);                                                    //draws inner circle
  fill(255);
  rect(985, 480, 100, 15);                                                      //draws record arm
  rect(1085, 478, 25, 20);

  if ((mouseX>170 && mouseX <420) && (mouseY >360 && mouseY < 610))             //if statement to call methods when mouse hovers over the left deck  
  {   
    instructionsDisplay(178, 380);                                             //Calls method to display instructions on how to load left deck
    loadLeftDeck();                                                            //calls method to load/unload the decks with a left or right click
  }


  if ((mouseX>860 && mouseX <1110) && (mouseY >360 && mouseY < 610))           //if statement to call methods when mouse hovers over the left deck
  {   
    instructionsDisplay(868, 380);                                              //Calls method to display instructions on how to load right deck
    loadRightDeck();                                                             //calls method to load/unload the decks with a left or right click
  }

  fill(100);                                                                    //draws the centre circles and record arms
  ellipse(295, 485, 30, 30);
  ellipse(985, 485, 30, 30);
  fill(255);
  rect(295, 480, 100, 15);
  rect(395, 478, 25, 20);
  rect(985, 480, 100, 15);
  rect(1085, 478, 25, 20);
}                                                                                //END DRAW

//METHODS

void crossFader(int xCrossPos, int yCrossPos)                                     // draw the Crossfader
{ 
  stroke(0);                                              
  fill(0, 0, 255);
  rect(485, 580, 300, 10);

  if ((mouseX>480 && mouseX <780) && (mouseY > 570 && mouseY<600))               //if mouse is within the parameters of the sliding bar the crossfader slides along this bar
  {      
    crossFader();
    xCrossPos = mouseX;
    yCrossPos = mouseY-30;
  }
  stroke(0);
  rect(xCrossPos, yCrossPos, 30, 60);
}

void crossFader()                                                                   //Displays Crossfader text 
{
  fill(0, 0, 255);
  textSize(15);  
  text("Crossfader", 600, 500);
}

void drawControls(int colour, int xPos, int yPos, int diameter)                    //draw circular controls
{
  noStroke();                                                                      //Green controls
  fill(150);
  ellipse(xPos, yPos, diameter+6, diameter+6);
  ellipse(xPos+200, yPos, diameter+6, diameter+6);
  ellipse(xPos+100, yPos+50, diameter+6, diameter+6);
  strokeWeight(3);
  stroke(0, colour, 0);                                                             //Blue controls
  fill(0);
  ellipse(xPos, yPos, diameter, diameter);
  line(xPos, yPos, xPos-diameter/2, yPos);
  stroke(0, 0, colour);
  ellipse(xPos+200, yPos, diameter, diameter);
  line(xPos+200, yPos, xPos+200-diameter/2, yPos);
  stroke(colour, 0, 0);                                                            //Red controls
  ellipse(xPos+100, yPos+50, diameter, diameter);
  line(xPos+100, yPos+50, xPos+100-diameter/2, yPos+50);
}

void drawButtons(int xPos, int yPos, int wdth, int hght)                            //Method drawButtons to draw the square CUE, SYNC and PLAY buttons
{
  if (controlOn)                                                                    //activate buttons if right clicked using Boolean variable controlOn
    fill(random(r), random(r), random(r));
  else 
  fill(255, 0, 0);

  for (int i=0; i<5; i++)                                                           //for loop to draw 3D effect on square buttons
  {
    stroke(150-i*10);
    rect(xPos+i, (yPos+hght)+i, wdth, 1);
    rect((xPos+50)+i, yPos+i, 1, hght);
    rect((xPos+200)+i, (yPos+hght)+i, wdth, 1);
    rect((xPos+250)+i, yPos+i, 1, hght);
  }
  stroke(#FAE608);
  rect (xPos, yPos, wdth, hght);
  rect (xPos+200, yPos, wdth, hght);
  //activates square buttons when any of them are left clicked or deactivates them if they are right clicked.  Also hovering over them gives instructions. 
  if (((mouseX >= xPos && mouseX <= xPos+wdth) && (mouseY >= yPos && mouseY <= yPos+hght))  ||  ((mouseX >= xPos+200 && mouseX <= xPos+200+wdth) && (mouseY >= yPos && mouseY <= yPos+hght)))  
  {
    loadButtonInstructions();                                                         //calls method to display instructions if mouse hovers over the buttons

    if (mouseButton==LEFT)                                                            //if statement using boolean variable so that the buttons will stay activated after the mouse moves away
      controlOn = true;
    if (mouseButton==RIGHT)
      controlOn = false;
  }

  fill(0);
  textSize(13);
  int textXPos = 520;                                                                  //while loop to create text on the buttons
  int textYPos = 420;
  int i=0;
  while (i<3) 
  {
    text("CUE", textXPos+i*200, textYPos);
    text("SYNC", textXPos+i*200, textYPos+50);
    text("PLAY", textXPos+i*200, textYPos+100);
    i++;
  }
}

void loadLeftDeck()                                                                          //Method to load left deck
{

  if (mouseButton==LEFT)                                                                     //if left mouse button pressed deck goes red and is loaded
  {
    fill(255, 0, 0);
    ellipse(295, 485, diameterDeckLeft, diameterDeckLeft);
    deckColorLeft=true;
  }
  if (mouseButton==RIGHT) {                                                                  //if right mouse button pressed deck goes black and is unloaded
    fill(0);
    ellipse(295, 485, diameterDeckLeft, diameterDeckLeft);
    deckColorLeft=false;
  }
  if (diameterDeckLeft <= 190)       
    diameterDeckLeft = diameterDeckLeft + 10;
}


void loadRightDeck()                                                                        //Method to load right deck
{
  if (mouseButton==LEFT) {                                                                  //if left mouse button pressed deck goes red and is loaded
    fill(255, 0, 0);
    ellipse(985, 485, diameterDeckRight, diameterDeckRight);
    deckColorRight=true;
  }
  if (mouseButton==RIGHT)                                                                     //if right mouse button pressed deck goes black and is unloaded
  {
    fill(0);
    ellipse(985, 485, diameterDeckRight, diameterDeckRight);
    deckColorRight=false;
  }
  if  (diameterDeckRight <= 190)
    diameterDeckRight = diameterDeckRight + 10;
}

void displayLeftTunes(String tuneL)                                                        //Displays user input of selected tune on left deck
{
  fill(random(r), random(r), random(r));
  textSize(15);

  if (tuneL.length()>20)                                                                  //if statement to make sure string isn't too long for screen
    tuneL = tuneL.substring(0, 20);

  text(tuneL.toUpperCase(), 250, 330);
}
void displayRightTunes(String tuneR)                                                      //Displays user input of selected tune on right deck
{
  fill(random(r), random(r), random(r));
  textSize(15);

  if (tuneR.length()>20)                                                                  //if statement to make sure string isn't too long for screen
    tuneR = tuneR.substring(0, 20);

  text(tuneR.toUpperCase(), 940, 330);
}

void instructionsDisplay(int xPos, int yPos)                                             //Instructions displayed for decks when mouse hovers over them
{
  textSize(10);
  text("Left click to load record. Right click to deselect", xPos, yPos);
}

void loadButtonInstructions()                                                            //Instructions displayed for CUE, SYNC and PLAY buttons when mouse hovers over them.
{
  textSize(10);
  text("Left click to activate controls, right click to deselect", 510, 350);
}

void mouseClicked()                                                                        //Mouse method to call the saveMySketch method to save image as a PNG when the mouse is right clicked
{
  if (mouseButton==RIGHT)
    saveMySketchInPNG();
}

void saveMySketchInPNG()                                                                    //Saves sketch as a png                                                                  
{
  save("Assignment01.PNG");
}
