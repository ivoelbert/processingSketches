
class prisma
{
  float ancho;
  float alto;
  float prof;
  color cf;
  color ca;
  color c;
  
  prisma(float an, float al, float pr, color cff, color caa, color cc)
  {
    ancho = an;
    alto = al;
    prof = pr;
    cf = cff;
    ca = caa;
    c = cc;
  }
  
  void mostrar()
  {
    float dx = ancho / 2;
    float dy = alto / 2;
    float dz = prof / 2;
    noStroke();
    
    //cara arriba
    fill(c);
    beginShape();
    vertex(-dx, -dy, dz);
    vertex(dx, -dy, dz);
    vertex(dx, -dy, -dz);
    vertex(-dx, -dy, -dz);
    endShape(CLOSE);
    
    //cara abajo
    fill(c);
    beginShape();
    vertex(-dx, dy, dz);
    vertex(dx, dy, dz);
    vertex(dx, dy, -dz);
    vertex(-dx, dy, -dz);
    endShape(CLOSE);
    
    //cara frente
    fill(cf);
    beginShape();
    vertex(-dx, dy, -dz);
    vertex(dx, dy, -dz);
    vertex(dx, -dy, -dz);
    vertex(-dx, -dy, -dz);
    endShape(CLOSE);
    
    //cara atras
    fill(ca);
    beginShape();
    vertex(-dx, dy, dz);
    vertex(dx, dy, dz);
    vertex(dx, -dy, dz);
    vertex(-dx, -dy, dz);
    endShape(CLOSE);
    
    //cara derecha
    fill(c);
    beginShape();
    vertex(dx, dy, dz);
    vertex(dx, dy, -dz);
    vertex(dx, -dy, -dz);
    vertex(dx, -dy, dz);
    endShape(CLOSE);
    
    //cara izquierda
    fill(c);
    beginShape();
    vertex(-dx, dy, dz);
    vertex(-dx, dy, -dz);
    vertex(-dx, -dy, -dz);
    vertex(-dx, -dy, dz);
    endShape(CLOSE);
  }
}