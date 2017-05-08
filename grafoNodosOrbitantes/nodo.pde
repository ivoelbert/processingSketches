class nodo
{
  float x;
  float y;
  float r;
  float ang;
  float vAng;
  
  nodo(float px, float py, float rad, float a, float va)
  {
    x = px;
    y = py;
    r = rad;
    ang = a;
    vAng = va;
  }
  
  void mostrarOrb(color or, color no)
  {
    pushMatrix();
      translate(x, y);
      
      //orbita
      noFill();
      stroke(or);
      strokeWeight(2);
      ellipse(0, 0, 2*r, 2*r);
      
    popMatrix();
  }
  
  void mostrarDot(color or, color no)
  {
    pushMatrix();
      translate(x, y);
      
      //dot
      float px = r * cos(ang);
      float py = r * sin(ang);
      noFill();
      stroke(no);
      strokeWeight(10);
      point(px, py);
      
    popMatrix();
  }
  
  void rotar()
  {
    ang += vAng;
  }
  
  PVector dotPos()
  {
    float px = r * cos(ang);
    float py = r * sin(ang);
    PVector p = new PVector(x + px, y + py);
    return p;
  }
}