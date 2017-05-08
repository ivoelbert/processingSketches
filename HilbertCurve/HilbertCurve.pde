String c;
ArrayList<PVector> p;

static float lado = 600;
static int it = 6;
float l;

int h;
static int vel = 2;

void setup()
{
  size(800, 800);
  smooth(4);
  frameRate(30);
  colorMode(HSB);
  
  l = lado/(pow(2, it)-1);
  h = 1;
  
  c = "A";
  for(int i = 0; i < it; i++)
    iterate();
  genDots();
  
  strokeWeight(1);
}

void iterate()
{
  String next = "";
  for(int i = 0; i < c.length(); i++)
  {
    switch(c.charAt(i))
    {
      case 'A':
      next += "-BF+AFA+FB-";
      break;
      
      case 'B':
      next += "+AF-BFB-FA+";
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
      float h = map(i, 0, c.length(), 0, 256);
      stroke(h, 255, 250);
      line(0, 0, l, 0);
      translate(l, 0);
      break;
      
      case '+':
      rotate(HALF_PI);
      break;
      
      case '-':
      rotate(-HALF_PI);
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
      currentAng += HALF_PI;
      break;
      
      case '-':
      currentAng -= HALF_PI;
      break;
      
      default:
      break;
    }
  }
}

void drawCurve(int hasta)
{
  noFill();
  stroke(250);
  beginShape();
  PVector init = p.get(0);
  curveVertex(init.x, init.y);
      
  for(int i = 0; i < hasta; i++)
  {
    PVector v = p.get(i);
    curveVertex(v.x, v.y);
  }
  
  PVector last = p.get(hasta-1);
  curveVertex(last.x, last.y);
  endShape();
}

void draw()
{
  float d = width - lado;
  translate(d/2, height - d/2);
  background(20);
  
  drawCurve(h);
  if(h < p.size() - 1)
    h += vel;
}