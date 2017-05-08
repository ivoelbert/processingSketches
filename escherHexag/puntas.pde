
// dibuja las puntas
void drawPuntas()
{
  float h = sqrt(3) * lado * 0.5;
  int ity = 0;
  
  for(float y = -h; y < height + h; y += 3*lado/2)
  {
    float py = y;
    int itx = 0;
    for(float x = -h; x < width + h; x += 2*h)
    {
      float px = x;
      
      color fill = color(0);
      color neg = color(0);
      
      if(ity % 2 == 0)
      {
        px += h;
        
        switch(itx % 3)
        {
          case 0:
          fill = B;
          neg = N;
          break;
          
          case 1:
          fill = R;
          neg = B;
          break;
          
          case 2:
          fill = N;
          neg = R;
          break;
        }
      }
      else
      {
        switch(itx % 3)
        {
          case 0:
          fill = R;
          neg = B;
          break;
          
          case 1:
          fill = N;
          neg = R;
          break;
          
          case 2:
          fill = B;
          neg = N;
          break;
        }
      }
      
      float off = map(x, -h, width + h, 0, 1);
      puntas(px, py, off, fill, neg);
      
      itx++;
    }
    ity++;
  }
}


void puntas(float x, float y, float off, color f, color n)
{
  float h = sqrt(3) * lado * 0.5; 
  
  pushMatrix();
  translate(x, y);
  
  //lado positivo
    fill(f);
    stroke(f);
    lineaMutada(h, -lado/2, off, 1);
  
  //lados negativos
    fill(n);
    stroke(n);
    pushMatrix();
    rotate(radians(60));
    lineaMutada(h, -lado/2, off, -1);
    popMatrix();
    
    pushMatrix();
    rotate(-radians(60));
    lineaMutada(h, -lado/2, off, -1);
    popMatrix();
  
  popMatrix();
}

//lineaMutada vertical con (x, y) arriba, tamaño lado, offset off
void lineaMutada(float x, float y, float off, int pos)
{
  //correccion
  float c = 0;
  if(pos == -1)
    c = 1;
    
  //linea actual
  pushMatrix();
  translate(x, y);
  beginShape();
  for(int i = 0; i < ladoDots; i++)
  {
    PVector ladoPos[];
    ladoPos = new PVector[ladoDots];
    for(int j = 0; j < ladoDots; j++)
    {
      ladoPos[i] = PVector.lerp(ladoPlano[i], ladoAct[i], off);
      ladoPos[i].set(pos * ladoPos[i].x, ladoPos[i].y);
    }
    vertex(ladoPos[i].x + c, ladoPos[i].y);
  }
  endShape(CLOSE);
  popMatrix();
}