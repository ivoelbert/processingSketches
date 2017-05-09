static int cubeSZ = 200;
cubote c;
PFont font;

static int textSZ = 60;

void setup()
{
  size(800, 800, P3D);
  smooth(8);
  frameRate(30);
  //ortho();
  font = createFont("font1.ttf", textSZ);
  textSize(textSZ);
  textFont(font);
  textAlign(CENTER, CENTER);
  c = new cubote(cubeSZ);
}

void draw()
{
  background(50);
  translate(width/2, height/2);
  rotateY(QUARTER_PI);
  
  stroke(100);
  fill(200);
  strokeWeight(1);
  box(cubeSZ);
  strokeWeight(2);
  
  fill(50);
  noStroke();
  text("CUBO", 0, 0, cubeSZ/2);
  
  pushMatrix();
  rotateY(-HALF_PI);
  fill(60);
  noStroke();
  text("CUBO", 0, 0, cubeSZ/2);
  popMatrix();
  
  float px = map(frameCount, 0, 120, -PI, 4*PI);
  float de = 250;
  c.mover(px, de);
  c.mostrar();
  
  /*
  if(px < 4*PI)
    saveFrame("cubo####.jpg");
  */
}

class piramide
{
  float h;
  float baseSZ;
  
  piramide(float he, float ba)
  {
    h = he;
    baseSZ = ba;
  }
  
  void mostrar(color s, color f)
  {
    float dx = baseSZ/2;
    float dz = baseSZ/2;
    
    stroke(s);
    fill(f);
    
    //cara frente
    beginShape();
    vertex(-dx, 0, dz);
    vertex(dx, 0, dz);
    vertex(0, -h, 0);
    endShape(CLOSE);
    
    //cara atras
    beginShape();
    vertex(-dx, 0, -dz);
    vertex(dx, 0, -dz);
    vertex(0, -h, 0);
    endShape(CLOSE);
    
    //cara izquierda
    beginShape();
    vertex(-dx, 0, dz);
    vertex(-dx, 0, -dz);
    vertex(0, -h, 0);
    endShape(CLOSE);
    
    //cara derecha
    beginShape();
    vertex(dx, 0, dz);
    vertex(dx, 0, -dz);
    vertex(0, -h, 0);
    endShape(CLOSE);
  }
}

class cubote
{
  float sz;
  float origSZ;
  float ang;
  float origANG;
  
  piramide pTope, pBase, pFrente, pAtras, pIzq, pDer;
  
  cubote(float s)
  {
    sz = s;
    origSZ = s;
    ang = 0;
    origANG = 0;
    
    float t1 = sqrt(2) * sz * 0.5;
    float t2 = sz * 0.5;
    float h = sqrt(t1*t1 - t2*t2);
    pTope = new piramide(h, sz);
    pBase = new piramide(h, sz);
    pFrente = new piramide(h, sz);
    pAtras = new piramide(h, sz);
    pIzq = new piramide(h, sz);
    pDer = new piramide(h, sz);
  }
  
  void mostrar()
  {
    color s = color(200);
    color f = color(50);
    
    pushMatrix();
    rotateY(ang);
    
      pushMatrix();
      translate(0, -sz/2, 0);
      pTope.mostrar(s, f);
      popMatrix();
      
      pushMatrix();
      rotateZ(-HALF_PI);
      translate(0, -sz/2, 0);
      pDer.mostrar(s, f);
      popMatrix();
      
      pushMatrix();
      rotateZ(-PI);
      translate(0, -sz/2, 0);
      pBase.mostrar(s, f);
      popMatrix();
      
      pushMatrix();
      rotateZ(-1.5*PI);
      translate(0, -sz/2, 0);
      pIzq.mostrar(s, f);
      popMatrix();
      
      pushMatrix();
      rotateX(-HALF_PI);
      translate(0, -sz/2, 0);
      pAtras.mostrar(s, f);
      popMatrix();
      
      pushMatrix();
      rotateX(HALF_PI);
      translate(0, -sz/2, 0);
      pFrente.mostrar(s, f);
      popMatrix();
      
    popMatrix();
  }
  
  void mover(float x, float delta)
  {
    sz = origSZ + wave(x) * delta;
    ang = rot(x);
  }
}

float rot(float x)
{
  float ret = 0;
  if(x >= HALF_PI && x < 2.5*PI)
  {
    float nx = map(x, HALF_PI, 2.5*PI, HALF_PI, 1.5*PI);
    ret = map(-sin(nx), -1, 1, 0, HALF_PI);
  }
  if(x >= 2.5*PI)
  {
    ret = HALF_PI;
  }
  
  return ret;
}

float wave(float x)
{
  float ret = 0;
  if(x >= 0 && x < HALF_PI)
  {
    ret = sin(x);
  }
  if(x >= 0.5*PI && x < 2.5*PI)
  {
    ret = 1;
  }
  if(x >= 2.5*PI && x < 3*PI)
  {
    ret = sin(x);
  }
  if(x >= 3*PI)
  {
    ret = 0;
  }
  
  return ret;
}

void mousePressed()
{
  saveFrame("preview.jpg");
}