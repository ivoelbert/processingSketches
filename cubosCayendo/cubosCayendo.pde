class prisma
{
  float ancho;
  float alto;
  float prof;
  color c;
  
  prisma(float an, float al, float pr, color c1)
  {
    ancho = an;
    alto = al;
    prof = pr;
    c = c1;
  }
  
  void mostrar()
  {
    float dx = ancho / 2;
    float dy = alto;
    float dz = prof / 2;
    
    fill(c);
    
    //cara arriba
    beginShape();
    vertex(-dx, 0, dz);
    vertex(dx, 0, dz);
    vertex(dx, 0, -dz);
    vertex(-dx, 0, -dz);
    endShape(CLOSE);
    
    //cara abajo
    beginShape();
    vertex(-dx, -dy, dz);
    vertex(dx, -dy, dz);
    vertex(dx, -dy, -dz);
    vertex(-dx, -dy, -dz);
    endShape(CLOSE);
    
    //cara frente
    beginShape();
    vertex(-dx, -dy, -dz);
    vertex(dx, -dy, -dz);
    vertex(dx, 0, -dz);
    vertex(-dx, 0, -dz);
    endShape(CLOSE);
    
    //cara atras
    beginShape();
    vertex(-dx, -dy, dz);
    vertex(dx, -dy, dz);
    vertex(dx, 0, dz);
    vertex(-dx, 0, dz);
    endShape(CLOSE);
    
    //cara derecha
    beginShape();
    vertex(dx, -dy, dz);
    vertex(dx, -dy, -dz);
    vertex(dx, 0, -dz);
    vertex(dx, 0, dz);
    endShape(CLOSE);
    
    //cara izquierda
    beginShape();
    vertex(-dx, -dy, dz);
    vertex(-dx, -dy, -dz);
    vertex(-dx, 0, -dz);
    vertex(-dx, 0, dz);
    endShape(CLOSE);
  }
}

class cubo
{
  float lado;
  PVector pos;
  float maxY;
  prisma p;
  
  cubo(float px, float py, float pz, float my, float sz)
  {
    lado = sz;
    pos = new PVector(px, py, pz);
    maxY = my;
    p = new prisma(lado, lado, lado, color(#FFF69B));
  }
  
  void update()
  {
    float yVel = map(pos.y, -height, maxY, 50, 50);
    
    float newY = pos.y + yVel;
    if(newY > maxY)
      newY = maxY;
      
    pos.set(pos.x, newY, pos.z);
  }
  
  void mostrar()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    p.mostrar();
    popMatrix();
  }
  
  boolean finished()
  {
    boolean ret = false;
    if(pos.y >= maxY)
      ret = true;
    
    return ret;
  }
}

static float cLado = 100;
float off = cLado * 4;
cubo[] c;

void setup()
{
  size(800, 800, P3D);
  smooth(8);
  frameRate(30);
  ortho();
  noStroke();
  
  c = new cubo[26];
  c[0] = new cubo(-cLado, -height, -cLado, 0, cLado);
  c[1] = new cubo(0, -height-1*off, -cLado, 0, cLado);
  c[2] = new cubo(cLado, -height-2*off, -cLado, 0, cLado);
  c[3] = new cubo(-cLado, -height-3*off, 0, 0, cLado);
  c[4] = new cubo(cLado, -height-4*off, 0, 0, cLado);
  c[5] = new cubo(-cLado, -height-5*off, cLado, 0, cLado);
  c[6] = new cubo(0, -height-6*off, cLado, 0, cLado);
  c[7] = new cubo(cLado, -height-7*off, cLado, 0, cLado);
  
  for(int i = 8; i < 17; i++)
  {
    float px = 0;
    if(i % 3 == 0)
      px = 0;
    if(i % 3 == 1)
      px = cLado;
    if(i % 3 == 2)
      px = -cLado;
    
    float pz = 0;
    int j = floor((i - 8) / 3);
    if(j == 0)
      pz = -cLado;
    if(j == 1)
      pz = 0;
    if(j == 2)
      pz = cLado;
    
    float yoffset = i*off;
    c[i] = new cubo(px, -height-yoffset, pz, -cLado, cLado); 
  }
  
  for(int i = 17; i < 26; i++)
  {
    float px = 0;
    if(i % 3 == 0)
      px = 0;
    if(i % 3 == 1)
      px = cLado;
    if(i % 3 == 2)
      px = -cLado;
    
    float pz = 0;
    int j = floor((i - 17) / 3);
    if(j == 0)
      pz = -cLado;
    if(j == 1)
      pz = 0;
    if(j == 2)
      pz = cLado;
    
    float yoffset = i*off;
    c[i] = new cubo(px, -height-yoffset, pz, -2*cLado, cLado); 
  }
}

void draw()
{
  background(#151C12);
  
  translate(width/2, 200+height/2, 0);
  float scl = map(frameCount, 0, 212, 1, 0.333);
  
  scale(scl);
  rotateY(-QUARTER_PI);
  lights();
  PVector v1 = new PVector(1, 0, -1);
  rotateOver(v1, radians(-35.3));
  
  float roff = map(frameCount, 0, 212, 0, PI);
  PVector v2 = new PVector(0, -1, 0);
  rotateOver(v2, roff);
  
  drawFloor(600);
  
  for(int i = 0; i < 26; i++)
  {
    c[i].update();
    c[i].mostrar();
  }
  /*
  if(frameCount <= 212)
    saveFrame("lluvia####.jpg");  
  */
}


void mousePressed()
{
  saveFrame("preview.jpg");
}


void drawFloor(float nsz)
{
  /*
  float sz = nsz * 10;
  noStroke();
  fill(#090C08);
  beginShape();
  vertex(-sz, 0, -sz);
  vertex(-sz, 0, sz);
  vertex(sz, 0, sz);
  vertex(sz, 0, -sz);
  endShape(CLOSE);
  
  noStroke();
  fill(50);
  beginShape();
  vertex(-sz, 0, -sz);
  vertex(-sz, 0, sz);
  vertex(sz, 0, sz);
  vertex(sz, 0, -sz);
  endShape(CLOSE);
  
  
  noStroke();
  fill(100);
  beginShape();
  vertex(-sz, 0, -sz);
  vertex(-sz, -sz, -sz);
  vertex(-sz, -sz, sz);
  vertex(-sz, 0, sz);
  endShape(CLOSE);
  
  noStroke();
  fill(150);
  beginShape();
  vertex(-sz, 0, -sz);
  vertex(-sz, -sz, -sz);
  vertex(sz, -sz, -sz);
  vertex(sz, 0, -sz);
  endShape(CLOSE);
  
  */
  
  prisma p = new prisma(cLado, cLado, cLado, color(#FFF69B));
  p.mostrar();
}

void rotateOver(PVector rot, float ang)
{
  rot.normalize();
  float u = rot.x;
  float v = rot.y;
  float w = rot.z;
  
  float a, b, c;
  float d, e, f;
  float g, h, i;
  
  a = u*u + (1 - u*u) * cos(ang);
  b = u * v * (1 - cos(ang)) - w * sin(ang);
  c = u * w * (1 - cos(ang)) + v * sin(ang);
  
  d = u * v * (1 - cos(ang)) + w * sin(ang);
  e = v*v + (1 - v*v) * cos(ang);
  f = v * w * (1 - cos(ang)) - u * sin(ang);
  
  g = u * w * (1 - cos(ang)) - v * sin(ang);
  h = v * w * (1 - cos(ang)) + u * sin(ang);
  i = w*w + (1 - w*w) * cos(ang);
  
  applyMatrix( a, b, c, 0,
               d, e, f, 0,
               g, h, i, 0,
               0, 0, 0, 1);
}