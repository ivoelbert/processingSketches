
// dibuja los hexágonos
void drawHexags()
{
  float h = sqrt(3) * lado * 0.5;
  int ity = 0;
  
  noStroke();
  for(float y = -h; y < height + h; y += 3*lado/2)
  {
    float py = y;
    int itx = 0;
    for(float x = -h; x < width + h; x += 2*h)
    {
      float px = x;
      
      if(ity % 2 == 0)
      {
        px += h;
        
        switch(itx % 3)
        {
          case 0:
          fill(B);
          break;
          
          case 1:
          fill(R);
          break;
          
          case 2:
          fill(N);
          break;
        }
      }
      else
      {
        switch(itx % 3)
        {
          case 0:
          fill(R);
          break;
          
          case 1:
          fill(N);
          break;
          
          case 2:
          fill(B);
          break;
        }
      }
      
      hexagFill(px, py);
      
      itx++;
    }
    ity++;
  }
}

void hexagFill(float x, float y)
{
  pushMatrix();
  translate(x, y);
  float h = sqrt(3) * lado * 0.5;
  beginShape();
  vertex(h, -lado/2);
  vertex(h, lado/2);
  vertex(0, lado);
  vertex(-h, lado/2);
  vertex(-h, -lado/2);
  vertex(0, -lado);
  endShape(CLOSE);
  popMatrix();
}