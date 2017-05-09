static float rad = 300;
static int childs = 7;
static int animationFrames = 90;

color c1, c2;

void setup()
{
  size(800, 800, P2D);
  smooth(8);
  frameRate(30);
  c1 = color(#052E30);
  c2 = color(#EFEAD5);
  noStroke();
}

void draw()
{
  background(c1);
  translate(width/2, height/2);
  drawCirc(rad, 0);
  
  /*
  if(frameCount < animationFrames)
    saveFrame("circ####.jpg");
  */
}

void drawCirc(float r, int it)
{   
  //calculo el color y la rotación
  color f = color(0);
  int rot;
  if(it % 2 == 1)
  {
    f = c1;
    rot = 1;
  }
  else
  {
    f = c2;
    rot = -1;
  }
  
  //dibujo el circulo grande
  fill(f);
  ellipse(0, 0, 2*r, 2*r);
  
  //los hijos
  float newR = r / (1 + sqrt(2));
  for(int c = 0; c < 4; c++)
  {
    float off = map(-cos(map(frameCount, 0, animationFrames, 0, PI)), -1, 1, 0, HALF_PI);
    float ang = map(c, 0, 3, QUARTER_PI, TWO_PI - QUARTER_PI) + rot * off;
    float pos = newR * sqrt(2);
    drawChild(newR, ang, pos, it);
  }
}

void drawChild(float r, float a, float p, int c)
{
  if(c >= childs)
    return;
  else
  {
    pushMatrix();
    rotate(a);
    translate(p, 0);
    drawCirc(r, c + 1);
    popMatrix();
  }
}

void mousePressed()
{
  saveFrame("preview.jpg");
}