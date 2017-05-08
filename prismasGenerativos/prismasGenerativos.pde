int cant = 6;
prisma p[];
float vols[];

void setup()
{
  size(800, 800, P3D);
  smooth(8);
  ortho();
  p = new prisma[cant];
  vols = new float[cant];
  for(int i = 0; i < cant; i++)
  {
    vols[i] = 20000000 / map(i, 0, cant-1, 1, 4);
  }
  color base = color(random(255), random(255), random(255));
  color shading;
  
  if(brightness(base) > 150)
  {
    shading = color(0);
  }
  else
  {
    shading = color(255);
  }
  
  for(int i = 0; i < cant; i++)
  {
    color c = lerpColor(base, shading, map(i, 0, cant, 0, 1));
    
    float d[];
    d = new float[3];
    d[0] = random(50, 0.5*width);
    d[1] = random(50, 0.5*width);
    d[2] = vols[i] / (d[0] * d[1]);
    
    for(int j = 0; j < 3; j++)
    {
      int pRan = int(random(3));
      float aux = d[j];
      d[j] = d[pRan];
      d[pRan] = aux;
    }
    
    p[i] = new prisma(d[0], d[1], d[2], c);
  }
  lights();
  translate(width/2, height/2);
  rotateX(-QUARTER_PI);
  rotateY(-QUARTER_PI);
  background(50);
  for(int i = 0; i < cant; i++)
  {
    p[i].mostrar();
  }
  /*
  save("prisma.png");
  exit();
  */
}