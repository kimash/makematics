//Kim Ash
//Makematics - Fall 2012
//spinBottle - uses PCA to show orientation of a bottle after spinning

PImage wood;
PImage bottle;

void setup()
{
  size(800, 800);
  wood = loadImage("wood.jpg");
  bottle = loadImage("beerSmall.png");
  background(wood);
}

void draw()
{
  imageMode(CENTER);
  image(bottle, width/2, height/2);
}
