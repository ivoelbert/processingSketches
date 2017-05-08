
// un prisma en (0, 0, 0)
void prisma(float dx, float dy, float dz)
{
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