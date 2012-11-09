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
    imageMode(CENTER);
    bottle = loadImage("beerSmall.png");
    pushMatrix();
      image(bottle, pos.x, pos.y);
      rotate(angle);
    popMatrix();
    angle += 0.01;
  }
  
  void spin()
  {
    if(keyPressed)  {
      if(key == 's' || key == 'S')  {
        angle += TWO_PI + random(TWO_PI);
        //rotate(angle);
      }
    }
  } 
}
