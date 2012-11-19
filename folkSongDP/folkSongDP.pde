import dynamicprogramming.*;

//String text1 = "Are you going to scartextborough Fair\n Parsley, sage, rosemary and thyme\n Remember me to one who lives there\n She onorthe was a true love of mine ";
//String text2 = "Well if you’re travelin’ in the northtext country fair\n Where the winds hit heavy on the borderline\n Remember me to one who lives there\n She onorthe was a true love of mine ";

String scartext[];
String northtext[];
String scar;
String north;

//LongestCommonSubsequence lcs;
LongestCommonSubsequence folkLCS;

void setup() {
  size(1200, 800);
  scartext = loadStrings("scarboroughFair.txt");
  northtext = loadStrings("northCountry.txt");
  //text1 = text1.toUpperCase();
  //text2 = text2.toUpperCase();
  //lcs = new LongestCommonSubsequence(text1, text2);
  //println(lcs.getLongestCommonSubsequence());
  
  for(int i=0; i<scartext.length; i++)  {
    scartext[i] = scartext[i].toUpperCase();
    scar = join(scartext, "\n");
    //println(scar);
  }
  
  for(int i=0; i<northtext.length; i++)  { 
    northtext[i] = northtext[i].toUpperCase();
    north = join(northtext, "\n");
    //println(north);
  }
  
  folkLCS = new LongestCommonSubsequence(scar, north);
  println(folkLCS.getLongestCommonSubsequence());
}

void draw() 
{
  noStroke();
  fill(#55D3FF);
  rect(0, 0, 400, 800);
  fill(#FFFA55);
  rect(400, 0, 400, 800);
  fill(#8DFF55);
  rect(800, 0, 400, 800);
  
  fill(0);
  textSize(15);
  text(scar, 10, 0);
  text(north, 410, 0);
}

