//Kim Ash
//Makematics - Fall 2012
//spinBottle - uses PCA to show orientation of a spinning bottle

PImage wood;
Bottle bottle;

void setup()
{
  size(800, 800);
  wood = loadImage("wood.jpg");
  bottle = new Bottle(width/2, height/2);
}

void draw()
{
  background(wood);
  bottle.spin();
  bottle.display();
}


