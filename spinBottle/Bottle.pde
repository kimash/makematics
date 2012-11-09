class Bottle
{
  PImage bottle;
  PVector pos;
  float angle = 0;
  
  Bottle(float xpos, float ypos)
  {
    pos = new PVector(xpos, ypos);
  }
  
  void display()
  {
    bottle = loadImage("beerSmall.png");
    //pushMatrix();
    imageMode(CENTER);
    image(bottle, -pos.x/16, -pos.y/16);
    //popMatrix();
  }
  
  void spin()
  {
    angle += .03;
    translate(width/2, height/2);
    rotate(angle);
//    if(keyPressed)  {
//      if(key == 's' || key == 'S')  {
//        angle += TWO_PI + random(TWO_PI);
//        rotate(angle);
//      }
//    }
  } 
}
