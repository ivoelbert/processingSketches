//3
void createLados()
{
  lado1 = new PVector[ladoDots];
  lado2 = new PVector[ladoDots];
  ladoAct = new PVector[ladoDots];
  ladoPlano = new PVector[ladoDots];
  
  float dy = lado / (ladoDots - 1);
  
  lado1[0] = new PVector(0, 0*dy);
  lado1[1] = new PVector(0, 1*dy);
  lado1[2] = new PVector(0, 2*dy);
  lado1[3] = new PVector(2*lado/3, 3*dy);
  lado1[4] = new PVector(0, 4*dy);
  lado1[5] = new PVector(0, 5*dy);
  lado1[6] = new PVector(0, 6*dy);
  
  lado2[0] = new PVector(0, 0*dy);
  lado2[1] = new PVector(2*lado/3, 1*dy);
  lado2[2] = new PVector(2*lado/3, 2*dy);
  lado2[3] = new PVector(0, 3*dy);
  lado2[4] = new PVector(2*lado/3, 4*dy);
  lado2[5] = new PVector(2*lado/3, 5*dy);
  lado2[6] = new PVector(0, 6*dy);
  
  for(int i = 0; i < ladoDots; i++)
  {
    float y = map(i, 0, ladoDots-1, 0, lado);
    ladoPlano[i] = new PVector(0, y); 
    
    ladoAct[i] = lado1[i].copy();
  }
}

void actualizarLados()
{
  float dy = lado / (ladoDots - 1);
  
  for(int i = 0; i < ladoDots; i++)
  {
    lado1[i] = lado2[i].copy();
  }
  
  lado2[0].set(0, 0);
  for(int i = 1; i < ladoDots - 1; i++)
  {
    lado2[i].set(random(0, 3*lado/4), i*dy);
  }
  lado2[ladoDots-1].set(0,6*dy);
}