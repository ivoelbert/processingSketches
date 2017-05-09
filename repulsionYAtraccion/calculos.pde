
void actualizarCentro()
{
  centroAng += centroV;
  float x = centroRad * cos(centroAng) + width/2;
  float y = centroRad * sin(centroAng) + height/2;
  
  centro.set(x, y);
  
  return;
}

void moverParticulas()
{
  for(int i = 0; i < dots.length; i++)
  {
    PVector atraccion = new PVector(orig[i].x - dots[i].x, orig[i].y - dots[i].y);
    atraccion.mult(atrac);
    
    PVector repulsion = new PVector(dots[i].x - centro.x, dots[i].y - centro.y);
    float mag = repulsion.mag();
    
    if(mag < rad)
    {
      float sz = (rad - mag) * repul;
      repulsion.setMag(sz);
    }
    else
    {
      repulsion.setMag(0);
    }
    
    dots[i].add(atraccion);
    dots[i].add(repulsion);
  }
  return;
}

void calcularRotacion()
{
  for(int i = 0; i < dots.length; i++)
  {
    float d = orig[i].dist(dots[i]);
    angs[i] = calcAng(d);
  }
}

float calcAng(float x)
{
  float ret = 0;
  if(x < rad/2)
  {
    ret = map(x, 0, rad/2, 0, PI);
  }
  else
  {
    ret = PI;
  }
  return ret;
}

void mostrarParticulas()
{
  for(int i = 0;i < dots.length; i++)
  {
    pushMatrix();
    translate(orig[i].x, orig[i].y);
    rotateY(angs[i]);
    p[i].mostrar();
    popMatrix();
  }
}

void createDots()
{
  dots = new PVector[ladoCant * ladoCant];
  orig = new PVector[ladoCant * ladoCant];
  p = new prisma[ladoCant * ladoCant];
  angs = new float[ladoCant * ladoCant];
  
  for(int y = 0; y < ladoCant; y++)
  for(int x = 0; x < ladoCant; x++)
  {
    float px = map(x, 0, ladoCant-1, 0, width);
    float py = map(y, 0, ladoCant-1, 0, width);
    int index = x + y * ladoCant;
    orig[index] = new PVector(px, py);
    dots[index] = new PVector(px, py);
    
    p[index] = new prisma(dotSz, dotSz, dotProf, cfrente, catras, cdemas);
    angs[index] = 0;
  }
}