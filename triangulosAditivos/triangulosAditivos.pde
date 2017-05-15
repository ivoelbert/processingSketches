triang t1, t2, t3, t4, t5, t6, t;
static float lado = 250;
float h;
color bg;

static float timeScl = 0.5;

static int rotFrames = 30;

void setup()
{
  size(800, 800, P2D);
  smooth(8);
  frameRate(30);
  h = sqrt(3) * 0.5 * lado;
  t = new triang(0, -h/2, lado, color(255, 255, 255));
  t1 = new triang(0, -h/2, lado, color(255, 0, 0));
  t2 = new triang(lado/2, h/2, lado, color(0, 255, 0));
  t3 = new triang(-lado/2, h/2, lado, color(0, 0, 255));
  t4 = new triang(0, -h/2, lado, color(255, 0, 0));
  t5 = new triang(lado/2, h/2, lado, color(0, 255, 0));
  t6 = new triang(-lado/2, h/2, lado, color(0, 0, 255));
  t1.setAng(0);
  t2.setAng(radians(120));
  t3.setAng(radians(240));
  t4.setAng(0);
  t5.setAng(radians(120));
  t6.setAng(radians(240));
  bg = color(0);
}

void draw()
{
  background(bg);
  
  translate(width/2, height/2-h/2);
  blendMode(ADD);
  t.mostrar();
  t1.mostrar();
  t2.mostrar();
  t3.mostrar();
  if(frameCount <= rotFrames)
    rotarTriangulos();
  else
  {
    setNewState();
  }
  /*
  if(frameCount <= rotFrames*3)
    saveFrame("tria####.jpg");
    */
}

void setNewState()
{
  //blendMode(SUBTRACT);
  t4.mostrar();
  t5.mostrar();
  t6.mostrar();
  if(frameCount <= rotFrames*2)
    rotarTriangulos2();
  else if(frameCount <= rotFrames*3)
    rotarTriangulos3();
}

void rotarTriangulos3()
{
  t1.setAng(map(frameCount, rotFrames*2, rotFrames*3, radians(60), 0));
  t2.setAng(map(frameCount, rotFrames*2, rotFrames*3, radians(180), radians(120)));
  t3.setAng(map(frameCount, rotFrames*2, rotFrames*3, radians(300), radians(240)));
  t4.setAng(map(frameCount, rotFrames*2, rotFrames*3, radians(60), 0));
  t5.setAng(map(frameCount, rotFrames*2, rotFrames*3, radians(180), radians(120)));
  t6.setAng(map(frameCount, rotFrames*2, rotFrames*3, radians(300), radians(240)));
}

void rotarTriangulos()
{
  t1.setAng(map(frameCount, 0, rotFrames, 0, radians(60)));
  t2.setAng(map(frameCount, 0, rotFrames, radians(120), radians(180)));
  t3.setAng(map(frameCount, 0, rotFrames, radians(240), radians(300)));
}

void rotarTriangulos2()
{
  t4.setAng(map(frameCount, rotFrames, rotFrames*2, 0, radians(60)));
  t5.setAng(map(frameCount, rotFrames, rotFrames*2, radians(120), radians(180)));
  t6.setAng(map(frameCount, rotFrames, rotFrames*2, radians(240), radians(300)));
}

class triang
{
  PVector p;
  float l;
  float ang;
  color c;
  
  triang(float x, float y, float la, color c1)
  {
    p = new PVector(x, y);
    l = la;
    c = c1;
  }
  
  void setAng(float a)
  {
    ang = a;
  }
  
  void setColor(color c1)
  {
    c = c1;
  }
  
  void mostrar()
  {
    noStroke();
    fill(c);
    pushMatrix();
    translate(p.x, p.y);
    rotate(ang);
    beginShape();
    vertex(0, 0);
    vertex(0.5 * l, sqrt(3) * 0.5 * l);
    vertex(-0.5 * l, sqrt(3) * 0.5 * l);
    endShape(CLOSE);
    popMatrix();
  }
}

void mousePressed()
{
  saveFrame("preview.jpg");
}