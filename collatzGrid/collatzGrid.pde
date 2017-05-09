static int end = 10000;
static float tramoSZ = 8;
float pang;
float nang;


void setup()
{
  size(1900, 1000, P2D);
  smooth(8);
  frameRate(10);
  
  stroke(250, 10);
  strokeWeight(1);
  
  pang = 0.1;
  nang = -0.1;
  
  background(30);
  translate(width/2, height/2+100);
  rotate(HALF_PI);
  for(int i = 0; i < end; i++)
    drawLine(i);
  
}

void draw()
{
  
}

void mousePressed()
{
  saveFrame("preview.jpg");
}

void drawLine(int val)
{ 
  ArrayList<Integer> path = new ArrayList<Integer>();
  int c = 0;
  
  //creo el path
  while(val >= 2)
  {
    path.add(val);
    if(val % 2 == 0)
      val = val / 2;
    else
      val = val * 3 + 1;
    
    c++;
  }
  
  pushMatrix();
  for(int i = c-1; i > 0; i--)
  {
    int v2 = path.get(i);
    int vv = path.get(i - 1);
    
    if(vv % 2 == 0)
    {
      //voy para la derecha
      rotate(pang);
      line(0, 0, tramoSZ, 0);
      translate(tramoSZ, 0);
    }
    else
    {
      //voy para la izquierda
      rotate(nang);
      line(0, 0, tramoSZ, 0);
      translate(tramoSZ, 0);
    }
  }
  popMatrix();
}

boolean nearZero(float x)
{
  return (x < 0.000001 && -x > 0.000001); 
}