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
    float dy = alto / 2;
    float dz = prof / 2;
    
    fill(c);
    
    //cara arriba
    beginShape();
    vertex(-dx, -dy, dz);
    vertex(dx, -dy, dz);
    vertex(dx, -dy, -dz);
    vertex(-dx, -dy, -dz);
    endShape(CLOSE);
    
    //cara abajo
    beginShape();
    vertex(-dx, dy, dz);
    vertex(dx, dy, dz);
    vertex(dx, dy, -dz);
    vertex(-dx, dy, -dz);
    endShape(CLOSE);
    
    //cara frente
    beginShape();
    vertex(-dx, dy, -dz);
    vertex(dx, dy, -dz);
    vertex(dx, -dy, -dz);
    vertex(-dx, -dy, -dz);
    endShape(CLOSE);
    
    //cara atras
    beginShape();
    vertex(-dx, dy, dz);
    vertex(dx, dy, dz);
    vertex(dx, -dy, dz);
    vertex(-dx, -dy, dz);
    endShape(CLOSE);
    
    //cara derecha
    beginShape();
    vertex(dx, dy, dz);
    vertex(dx, dy, -dz);
    vertex(dx, -dy, -dz);
    vertex(dx, -dy, dz);
    endShape(CLOSE);
    
    //cara izquierda
    beginShape();
    vertex(-dx, dy, dz);
    vertex(-dx, dy, -dz);
    vertex(-dx, -dy, -dz);
    vertex(-dx, -dy, dz);
    endShape(CLOSE);
  }
}

class cubo
{
  PVector pos;
  float lado;
  color c;
  
  cubo(float x, float y, float z, float l, color c1)
  {
    pos = new PVector(x, y, z);
    lado = l;
    c = c1;
  }
  
  void mostrar()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    
    ////////////////// eje x ////////////////////
    prisma xAxis;
    xAxis = new prisma(lado - 2*sw, sw, sw, c);
    
    float deltax = lado/2 - sw/2;
    pushMatrix();
    translate(0, deltax, deltax);
    xAxis.mostrar();
    popMatrix();
    
    pushMatrix();
    translate(0, -deltax, deltax);
    xAxis.mostrar();
    popMatrix();
    
    pushMatrix();
    translate(0, -deltax, -deltax);
    xAxis.mostrar();
    popMatrix();
    
    pushMatrix();
    translate(0, deltax, -deltax);
    xAxis.mostrar();
    popMatrix();
    
    ////////////////// eje y ////////////////////
    prisma yAxis;
    yAxis = new prisma(sw, lado, sw, c);
    
    float deltay = lado/2 - sw/2;
    pushMatrix();
    translate(deltay, 0, deltay);
    yAxis.mostrar();
    popMatrix();
    
    pushMatrix();
    translate(-deltay, 0, deltay);
    yAxis.mostrar();
    popMatrix();
    
    pushMatrix();
    translate(-deltay, 0, -deltay);
    yAxis.mostrar();
    popMatrix();
    
    pushMatrix();
    translate(deltay, 0, -deltay);
    yAxis.mostrar();
    popMatrix();
    
    ////////////////// eje z ////////////////////
    prisma zAxis;
    zAxis = new prisma(sw, sw, lado - 2*sw, c);
    
    float deltaz = lado/2 - sw/2;
    pushMatrix();
    translate(deltaz, deltaz, 0);
    zAxis.mostrar();
    popMatrix();
    
    pushMatrix();
    translate(-deltaz, deltaz, 0);
    zAxis.mostrar();
    popMatrix();
    
    pushMatrix();
    translate(-deltaz, -deltaz, 0);
    zAxis.mostrar();
    popMatrix();
    
    pushMatrix();
    translate(deltaz, -deltaz, 0);
    zAxis.mostrar();
    popMatrix();
    
    popMatrix();
  }
  
  void setPos(float px, float py, float pz)
  {
    pos.set(px, py, pz);
  }
}

static int sw = 30;
static int lado = 300;
static int cant = 5;

cubo[] c;

void setup()
{
  size(800, 800, P3D);
  smooth(8);
  frameRate(30);
  ortho();
  noStroke();
  colorMode(HSB);
  
  c = new cubo[cant];
  for(int i = 0; i < cant; i++)
  {
    float sz = map(i, 0, 1, lado, lado - 2*sw);
    float hue = map(i, 0, cant-1, 150, 250) % 256;
    color col = color(hue, 256, 256);
    c[i] = new cubo(0, 0, 0, sz, col);
  }
}

void draw()
{
  background(#F2EDCD);
  translate(width/2, height/2, 0);
  rotateY(-QUARTER_PI);
  
  lights();
  PVector v1 = new PVector(1, 0, -1);
  rotateOver(v1, radians(-35.3));
  
  actualizarCubos();
  
  for(int i = 0; i < cant; i++)
  {
    c[i].mostrar();
  }
  
  /*
  if(frameCount * 0.2 < 3*TWO_PI)
    saveFrame("nido####.jpg");
    */
}


void actualizarCubos()
{
  for(int i = 0; i < cant; i++)
  {
    float px = map(i, 0, 1, 0, sw*3);
    float py = -map(i, 0, 1, 0, sw*3);
    float pz = map(i, 0, 1, 0, sw*3);
    
    float dx = sinHop(frameCount * 0.2, 0) * px;
    float dy = sinHop(frameCount * 0.2, TWO_PI) * py;
    float dz = sinHop(frameCount * 0.2, 2*TWO_PI) * pz;
    
    
    c[i].setPos(dx, dy, dz);
  }
}

float sinHop(float x, float init)
{
  float ret = 0;
  if(x - init < TWO_PI && x - init > 0)
    ret = (-cos(x - init) + 1) * 0.5;
  
  return ret;
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