color c1, c2, c3;

//hexágono de radio r, simil cubo isométrico pero no.
class hexag
{
  float r;
  float ang;
  
  hexag(float rad)
  {
    r = rad;
    ang = 0;
  }
  
  void mostrar()
  {
    pushMatrix();
      rotate(ang);
      noStroke();
      
      //cara tope
      fill(c1);
      beginShape();
      vertex(0, 0);
      vertex(r*cos(radians(-30)), r*sin(radians(-30)));
      vertex(0, -r);
      vertex(-r*cos(radians(-30)), r*sin(radians(-30)));
      endShape(CLOSE);
      
      
      //cara izq
      fill(c2);
      beginShape();
      vertex(0, 0);
      vertex(-r*cos(radians(-30)), r*sin(radians(-30)));
      vertex(-r*cos(radians(-30)), -r*sin(radians(-30)));
      vertex(0, r);
      endShape(CLOSE);
      
      //cara der
      fill(c3);
      beginShape();
      vertex(0, 0);
      vertex(r*cos(radians(-30)), r*sin(radians(-30)));
      vertex(r*cos(radians(-30)), -r*sin(radians(-30)));
      vertex(0, r);
      endShape(CLOSE);
      
    popMatrix();
  }
  
  void setAng(float a)
  {
    ang = a;
  }
  
  void setRad(float nr)
  {
    r = nr;
  }
  
  float getRad()
  {
    return r;
  }
}

hexag t1, t2, t3;
static float vel = 8;
static float bigR = 700;

void setup()
{
  size(800, 800);
  smooth(8);
  frameRate(30);
  
  c1 = color(#75DEFF);
  c2 = color(#23B5D3);
  c3 = color(#245363);
  
  t1 = new hexag(bigR);
  t2 = new hexag(bigR/2);
  t3 = new hexag(bigR/4);
  
  t2.setAng(PI);
}

void draw()
{
  background(255);
  translate(width/2, height/2);
  
  animarHexags();
  
  t1.mostrar();
  t2.mostrar();
  t3.mostrar();
  
  
  if(frameCount < 120)
    saveFrame("hexacubo####.jpg");
  
}

void animarHexags()
{
  if(frameCount < 30)
  {
    float x = map(frameCount, 0, 30, 0, TWO_PI);
    t1.setRad(growRad(x, bigR, 2*bigR));
    t2.setRad(growRad(x, bigR/2, bigR));
    t3.setRad(growRad(x, bigR/4, bigR/2));
  }
  else if(frameCount == 30)
  {
    t1.setRad(bigR);
    t2.setRad(bigR/2);
    t3.setRad(bigR/4);
    
    t1.setAng(PI);
    t2.setAng(0);
  }
  else if(frameCount < 60)
  {
    float x = map(frameCount, 30, 59, 0, TWO_PI);
    t3.setAng(growAng(x, 0, PI));
  }
  else if(frameCount < 90)
  {
    float x = map(frameCount, 60, 90, 0, TWO_PI);
    t1.setRad(growRad(x, bigR, 2*bigR));
    t2.setRad(growRad(x, bigR/2, bigR));
    t3.setRad(growRad(x, bigR/4, bigR/2));
  }
  else if(frameCount == 90)
  {
    t1.setRad(bigR);
    t2.setRad(bigR/2);
    t3.setRad(bigR/4);
    
    t1.setAng(0);
    t2.setAng(PI);
    t3.setAng(PI);
  }
  
  else if(frameCount < 120)
  {
    float x1 = map(frameCount, 90, 119, 0, TWO_PI);
    t3.setAng(growAng(x1, PI, TWO_PI));
  }
  
}


float growRad(float x, float sz1, float sz2)
{
  float ret = 0;
  
  if(x < PI)
  {
    ret = sz1;
  }
  else if(x < TWO_PI)
  {
    ret = map(cos(x), -1, 1, sz1, sz2);
  }
  else
  {
    ret = sz2;
  }
  
  return ret;
}

float growAng(float x, float a1, float a2)
{
  float ret = 0;
  
  if(x < PI)
  {
    ret = a1;
  }
  else if(x < TWO_PI)
  {
    ret = map(cos(x), -1, 1, a1, a2);
  }
  else
  {
    ret = a2;
  }
  
  return ret;
}