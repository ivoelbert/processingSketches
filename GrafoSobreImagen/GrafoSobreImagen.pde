static int cant = 100000;

PVector[] p;
PImage img;

void setup()
{
  size(800, 800);
  smooth(4);
  
  img = loadImage("img.jpg");
  createDots();
  
  background(255);
  drawDots();
}

void draw()
{
  
}

void createDots()
{
  p = new PVector[cant];
  
  img.loadPixels();
  
  for(int i = 0; i < cant; i++)
  {
    int x = int(random(img.width));
    int y = int(random(img.height));
    
    int index = x + y * img.width;
    
    float b = brightness(img.pixels[index]);
    float r = random(256);
    
    while(r < b)
    {
      x = int(random(img.width));
      y = int(random(img.height));
      index = x + y * img.width;
      
      b = brightness(img.pixels[index]);
      r = random(256);
    }
    p[i] = new PVector(x, y);
  }
}

void drawDots()
{
  stroke(0);
  strokeWeight(1);
  for(int i = 0; i < cant; i++)
  {
    point(p[i].x, p[i].y);
  }
}

void mousePressed()
{
  saveFrame("preview.jpg");
}