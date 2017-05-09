String c;
ArrayList<PVector> p;

static int it = 5;
static float l = 10;
static float ang = 60;

int h;
static int vel = 4;

void setup()
{
  size(800, 800, P3D);
  smooth(4);
  frameRate(30);
  colorMode(HSB);
  
  h = 1;
  
  c = "X";
  for(int i = 0; i < it; i++)
    iterate();
  genDots();
  
  strokeWeight(2);
}

void iterate()
{
  String next = "";
  for(int i = 0; i < c.length(); i++)
  {
    switch(c.charAt(i))
    {
      case 'X':
      next += "X+YF++YF-FX--FXFX-YF+";
      break;
      
      case 'Y':
      next += "-FX+YFYF++YF+FX--FX-Y";
      break;
      
      default:
      next += c.charAt(i);
      break;
    }
  }
  
  c = next;
}

void drawLine()
{
  for(int i = 0; i < c.length(); i++)
  {
    switch(c.charAt(i))
    {
      case 'F':
      line(0, 0, l, 0);
      translate(l, 0);
      break;
      
      case '+':
      rotate(radians(ang));
      break;
      
      case '-':
      rotate(-radians(ang));
      break;
      
      default:
      break;
    }
  }
}


void genDots()
{
  p = new ArrayList<PVector>();
  
  float currentX = 0;
  float currentY = 0;
  float currentAng = 0;
  
  for(int i = 0; i < c.length(); i++)
  {
    switch(c.charAt(i))
    {
      case 'F':
      float nextX = l * cos(currentAng);
      float nextY = l * sin(currentAng);
      
      currentX += nextX;
      currentY += nextY;
      
      PVector pos = new PVector(currentX, currentY);
      p.add(pos);
      break;
      
      case '+':
      currentAng += radians(ang);
      break;
      
      case '-':
      currentAng -= radians(ang);
      break;
      
      default:
      break;
    }
  }
}

void drawCurve(int hasta)
{
  color c1 = color(#EE4266);
  color c2 = color(#3CBBB1);
  color c = c1;
  
  noFill();
  beginShape();
  PVector init = p.get(0);
  curveVertex(init.x, init.y);
  stroke(c);
      
  for(int i = 0; i < hasta; i++)
  {
    float ler = map(i, 0, hasta, 0, 1);
    c = lerpColor(c1, c2, ler);
    stroke(c);
    PVector v = p.get(i);
    
    float nx = map(noise(frameCount*0.1, i, 0), 0, 1, -3, 3);
    float ny = map(noise(frameCount*0.1, i, 1), 0, 1, -3, 3);
    
    curveVertex(v.x + nx, v.y + ny);
  }
  
  PVector last = p.get(hasta-1);
  curveVertex(last.x, last.y);
  endShape();
}

void draw()
{
  translate(width - 50, -150);
  background(20);
  
  drawCurve(p.size());
  
  /*
  if(frameCount < 90)
    saveFrame("asi####.jpg");
  */
}

void mousePressed()
{
  saveFrame("preview.jpg");
}