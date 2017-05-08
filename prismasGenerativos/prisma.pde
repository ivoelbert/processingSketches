//prisma centrado en (0, 0, 0)

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
    color s = lerpColor(c, color(0), 0.5);
    
    fill(c);
    stroke(s);
    
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