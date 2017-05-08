nodo n[];
nodo c;
static int cant = 6;
static float r = 100;
static float vang = -TWO_PI/120;
float ang;

color orb;
color nod;

void setup()
{
  size(800, 800);
  smooth(8);
  frameRate(30);
  
  orb = color(0);
  nod = color(#C9F2C7);
  
  n = new nodo[cant];
  ang = 0;
  for(int i = 0; i < cant; i++)
  {
    float a = map(i, 0, cant, 0, TWO_PI); 
    PVector pos = PVector.fromAngle(a);
    pos.mult(200);
    n[i] = new nodo(pos.x, pos.y, r, PI, vang);
  }
  c = new nodo(0, 0, r, PI, vang);
}

void draw()
{
  background(#001016);
  float dx = map(ang, 0, -PI, 0, 2*r);
  translate(width/2 - dx, height/2);
  drawCirc();
  for(int i = 0; i < cant; i++)
  {
    n[i].rotar();
    n[i].mostrarOrb(orb, nod);
  }
  c.rotar();
  c.mostrarOrb(orb, nod);
  for(int i = 0; i < cant; i++)
  {
    n[i].mostrarDot(orb, nod);
  }
  c.mostrarDot(orb, nod);
  
  
  drawFaces();
  
  ang += vang;
  
  
  if(ang > -PI)
  {
    saveFrame("sndScroll####.jpg");
  }
  
}

void drawCirc()
{
  for(int x = 0; x < 9; x++)
  for(int y = 0; y < 9; y++)
  {
    int notC = y % 2;
    float px = map(x, 4, 5, 0 + notC*r, 2*r + notC*r);
    float py = map(y, 4, 5, 0, sqrt(4*r*r - r*r));
    if( !( ((y == 3 || y == 4 || y == 5) && (x == 3 || x == 4)) || (y == 4 && x == 5) ) )
    {
      noFill();
      stroke(orb);
      strokeWeight(2);
      ellipse(px, py, 2*r, 2*r);
    }
  }
}

void drawFaces()
{
  stroke(nod);
  fill(nod, 50);
  strokeWeight(1);
  
  //cara 1
  PVector v0 = n[0].dotPos().copy();
  PVector v1 = n[1].dotPos().copy();
  PVector v2 = c.dotPos().copy();
  PVector v3 = n[5].dotPos().copy();
  beginShape();
  vertex(v0.x, v0.y);
  vertex(v1.x, v1.y);
  vertex(v2.x, v2.y);
  vertex(v3.x, v3.y);
  endShape(CLOSE);
  
  //cara 2
  v0 = n[1].dotPos().copy();
  v1 = n[2].dotPos().copy();
  v2 = n[3].dotPos().copy();
  v3 = c.dotPos().copy();
  beginShape();
  vertex(v0.x, v0.y);
  vertex(v1.x, v1.y);
  vertex(v2.x, v2.y);
  vertex(v3.x, v3.y);
  endShape(CLOSE);
  
  //cara 2
  v0 = c.dotPos().copy();
  v1 = n[3].dotPos().copy();
  v2 = n[4].dotPos().copy();
  v3 = n[5].dotPos().copy();
  beginShape();
  vertex(v0.x, v0.y);
  vertex(v1.x, v1.y);
  vertex(v2.x, v2.y);
  vertex(v3.x, v3.y);
  endShape(CLOSE);
}

int next(int x)
{
  int ret = 0;
  if(x < cant - 1)
    ret = x + 1;
  return ret;
}