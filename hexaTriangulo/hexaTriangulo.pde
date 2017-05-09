class hexaLinea
{
  float hexaL;
  float lineL;
  float apot;
  float angL;
  PVector pos;
  
  hexaLinea(float hl, float ll, float x, float y)
  {
    hexaL = hl;
    lineL = ll;
    apot = sqrt(hexaL*hexaL - (hexaL/2)*(hexaL/2));
    angL = 0;
    pos = new PVector(x, y);
  }
  
  void mostrar()
  {
    stroke(#071013);
    strokeWeight(8);
    pushMatrix();
    translate(pos.x, pos.y);
    for(int i = 0; i < 6; i++)
    {
      pushMatrix();
      float ang = map(i, 0, 5, radians(0), radians(300));
      rotate(ang);
      pushMatrix();
      translate(apot, 0);
      rotate(angL);
      line(0, -lineL/2, 0, lineL/2);
      popMatrix();
      popMatrix();
    }
    popMatrix();
  }
  
  void rotarL(float a)
  {
    angL = a;
  }
  
  void setL(float l)
  {
    lineL = l;
  }
  
  float dis()
  {
    return pos.mag();
  }
}

hexaLinea[][] h;
static float lado = 50;
int cantx, canty;

void setup()
{
  size(800, 800);
  smooth(8);
  frameRate(30);
  createH();
}

void draw()
{
  background(#1B8AA0);
  
  animarH();
  mostrarH();
  /*
  if(frameCount <= 120)
    saveFrame("hex####.jpg");
  */
}

void animarH()
{
  for(int x = 0; x < cantx; x++)
  for(int y = 0; y < canty; y++)
  {
    float fr = map(frameCount, 0, 120, 0, 6*PI) + map(h[x][y].dis(), 0, width, -4, 1);
    float a = getAng(fr);
    float l = map(a, 0, HALF_PI, lado, lado + 35);
    h[x][y].rotarL(a);
    h[x][y].setL(l);
  }
}

float getAng(float x)
{
  float ret = 0;
  if(x < PI)
    ret = 0;
  else if(x < 2*PI)
    ret = map(cos(x), -1, 1, 0, HALF_PI);
  else if(x < 4*PI)
    ret = HALF_PI;
  else if(x < 5*PI)
    ret = map(cos(x), -1, 1, 0, HALF_PI);
  else
    ret = 0;
   
  return ret;
}

void mostrarH()
{
  for(int x = 0; x < cantx; x++)
  for(int y = 0; y < canty; y++)
  {
    h[x][y].mostrar();
  }
}

void createH()
{
  float apot = sqrt(lado*lado - (lado/2)*(lado/2));
  cantx = ceil(width/lado);
  canty = ceil(height/apot);
  h = new hexaLinea[cantx][canty];
  for(int x = 0; x < cantx; x++)
  for(int y = 0; y < canty; y++)
  {
    float px = x * apot * 2;
    if(y % 2 == 0)
      px += apot;
    float py = y * 1.5 * lado;
    
    h[x][y] = new hexaLinea(lado, lado, px, py);
  }
}

void mousePressed()
{
  saveFrame("preview.jpg");
}