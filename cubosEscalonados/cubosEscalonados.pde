
static float lado = 81;
static int cols = 15;
static int rows = 15;

color ca, cf, ci;

boolean[][] tra;

void setup()
{
  size(600, 600, P3D);
  smooth(8);
  frameRate(30);
  ortho();
  
  ca = color(#E6AA68);
  cf = color(#CA3C25);
  ci = color(#1D1A05);
  noStroke();
  
  tra = new boolean[rows][cols];
  for(int i = 0; i < rows; i++)
  for(int j = 0; j < cols; j++)
  {
    tra[i][j] = false;
  }
}

void draw()
{
  background(20);
  translate(0, -width/2, -width);
  rotateY(-QUARTER_PI);
  PVector v1 = new PVector(1, 0, -1);
  rotateOver(v1, radians(-35.3));
  for(int i = 0; i < rows; i++)
  for(int j = 0; j < cols; j++)
  { 
    float cx = (i * lado/2) + (j * lado);
    float cy = (i * lado) + (j * lado/2);
    float cz = (i * lado/2) - (j * lado/2);
    
    float offset = map(sqrt((cx-0.72*width)*(cx-0.72*width) + (cy-0.85*width)*(cy-0.85*width) + cz*cz), 0, width, 0, 10);
    
    pushMatrix();
    translate(cx, cy, cz);
    PVector v = new PVector(1, -1, 1);
    float ang = map(sinFlash(frameCount * 0.2 + offset), -1, 1, 0, radians(30));
    rotateOver(v, ang);
    caja(lado, tra[i][j]);
    popMatrix();
  }
  
  /*
  if(frameCount * 0.2 < 6*PI)
    saveFrame("escal####.jpg");
    */
    
}

float sinFlash(float dx)
{
  float x = dx;
  while(x > 6*PI)
    x -= 6*PI;
  float ret = 0;
  if(x < HALF_PI)
    ret = sin(x);
  else if(x < 2.5*PI)
    ret = 1;
  else if(x < 3.5*PI)
    ret = sin(x);
  else if(x < 5.5*PI)
    ret = -1;
  else if(x < 6*PI)
    ret = sin(x);
    
  return ret;
}

void caja(float l, boolean t)
{
  float dx = l / 2;
  float dy = l / 2;
  float dz = l / 2;
  if(t)
  {
    noFill();
    stroke(230);
  }
  else
  {
    noStroke();
  }
  //cara arriba
  if(!t)
    fill(ca);
  beginShape();
  vertex(-dx, -dy, dz);
  vertex(dx, -dy, dz);
  vertex(dx, -dy, -dz);
  vertex(-dx, -dy, -dz);
  endShape(CLOSE);
  
  //cara abajo
  if(!t)
    fill(ca);
  beginShape();
  vertex(-dx, dy, dz);
  vertex(dx, dy, dz);
  vertex(dx, dy, -dz);
  vertex(-dx, dy, -dz);
  endShape(CLOSE);
  
  //cara frente
  if(!t)
    fill(cf);
  beginShape();
  vertex(-dx, dy, -dz);
  vertex(dx, dy, -dz);
  vertex(dx, -dy, -dz);
  vertex(-dx, -dy, -dz);
  endShape(CLOSE);
  
  //cara atras
  if(!t)
    fill(cf);
  beginShape();
  vertex(-dx, dy, dz);
  vertex(dx, dy, dz);
  vertex(dx, -dy, dz);
  vertex(-dx, -dy, dz);
  endShape(CLOSE);
  
  //cara derecha
  if(!t)
    fill(ci);
  beginShape();
  vertex(dx, dy, dz);
  vertex(dx, dy, -dz);
  vertex(dx, -dy, -dz);
  vertex(dx, -dy, dz);
  endShape(CLOSE);
  
  //cara izquierda
  if(!t)
    fill(ci);
  beginShape();
  vertex(-dx, dy, dz);
  vertex(-dx, dy, -dz);
  vertex(-dx, -dy, -dz);
  vertex(-dx, -dy, dz);
  endShape(CLOSE);
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

void mousePressed()
{
  saveFrame("preview.jpg");
}