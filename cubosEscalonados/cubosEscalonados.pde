
static float lado = 100;
static int cols = 15;
static int rows = 15;

color cc;

boolean[][] tra;

void setup()
{
  size(800, 800, P3D);
  smooth(8);
  frameRate(30);
  ortho();
  
  cc = color(#FFE2A2);
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
  PVector v = new PVector(1, 0, -1);
  rotateOver(v, radians(-35.3));
  for(int i = 0; i < rows; i++)
  for(int j = 0; j < cols; j++)
  { 
    float cx = (i * lado/2) + (j * lado);
    float cy = (i * lado) + (j * lado/2);
    float cz = (i * lado/2) - (j * lado/2);
    
    pushMatrix();
    translate(cx, cy, cz);
    caja(lado, cc, tra[i][j]);
    popMatrix();
  }
}

void caja(float l, color c, boolean t)
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
    fill(lerpColor(c, color(0), 0));
  beginShape();
  vertex(-dx, -dy, dz);
  vertex(dx, -dy, dz);
  vertex(dx, -dy, -dz);
  vertex(-dx, -dy, -dz);
  endShape(CLOSE);
  
  //cara abajo
  if(!t)
    fill(lerpColor(c, color(0), 0));
  beginShape();
  vertex(-dx, dy, dz);
  vertex(dx, dy, dz);
  vertex(dx, dy, -dz);
  vertex(-dx, dy, -dz);
  endShape(CLOSE);
  
  //cara frente
  if(!t)
    fill(lerpColor(c, color(0), 0.33));
  beginShape();
  vertex(-dx, dy, -dz);
  vertex(dx, dy, -dz);
  vertex(dx, -dy, -dz);
  vertex(-dx, -dy, -dz);
  endShape(CLOSE);
  
  //cara atras
  if(!t)
    fill(lerpColor(c, color(0), 0.33));
  beginShape();
  vertex(-dx, dy, dz);
  vertex(dx, dy, dz);
  vertex(dx, -dy, dz);
  vertex(-dx, -dy, dz);
  endShape(CLOSE);
  
  //cara derecha
  if(!t)
    fill(lerpColor(c, color(0), 0.66));
  beginShape();
  vertex(dx, dy, dz);
  vertex(dx, dy, -dz);
  vertex(dx, -dy, -dz);
  vertex(dx, -dy, dz);
  endShape(CLOSE);
  
  //cara izquierda
  if(!t)
    fill(lerpColor(c, color(0), 0.66));
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