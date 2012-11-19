/*
  Kim Ash
  Makematics - Fall 2012
  folkSongDP - uses dynamic programming to find LCS of 2 folk songs:
  "Scarborough Fair" and Bob Dylan's "Girl from the North Country"
*/

import dynamicprogramming.*;

String scartext[];  //text of "Scarborough Fair"
String northtext[];  //text of "Girl from the North Country"
String scar;  //composite string of SF lyrics
String north;  //composite string of GNC lyrics

LongestCommonSubsequence folkLCS;

void setup() {
  size(1040, 900);
  background(255);
  scartext = loadStrings("scarboroughFair.txt");
  northtext = loadStrings("northCountry.txt");
  
  //create composite string of SF lyrics
  for(int i=0; i<scartext.length; i++)  {
    scartext[i] = scartext[i].toUpperCase();
    scar = join(scartext, "\n");
  }
  
  //create composite string of GNC lyrics
  for(int i=0; i<northtext.length; i++)  { 
    northtext[i] = northtext[i].toUpperCase();
    north = join(northtext, "\n");
  }
  
  //find longest common subsequence
  folkLCS = new LongestCommonSubsequence(scar, north);
  println(folkLCS.getLongestCommonSubsequence());
}

void draw() 
{
  noStroke();
  fill(#55D3FF, 150);
  rect(0, 0, 560, 900);
  fill(#FFFA55, 150);
  rect(480, 0, 600, 900);
  fill(#8DFF55);
  rect(0, 610, 1040, 300);
  
  fill(0);
  textSize(15);
  text(scar, 40, 30);
  text(north, 600, 30);
  text(folkLCS.getLongestCommonSubsequence(), 20, 640);
}

