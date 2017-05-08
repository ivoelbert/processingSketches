
giron[][] g;
static int cant = 25;
static float lado = 800;
static int gSz = 15;

static float timeScl = 0.05;

void setup()
{
  size(800, 800, P3D);
  smooth(8);
  frameRate(30);
  ortho();
  createGirones();
}

void draw()
{
  background(50);
  translate(width/2, height/2);
  
  pointLight(255, 255, 255, 0, 0, 200);
  
  for(int i = 0; i < cant; i++)
  for(int j = 0; j < cant; j++)
  {
    float d = g[i][j].getDistToCenter();
    float a = -frameCount * timeScl + map(d, 0, width, 0, TWO_PI);
    g[i][j].setAng(a);
    g[i][j].mostrar();
  }
  
  /*
  if(frameCount * timeScl < TWO_PI)
    saveFrame("cuboRot####.jpg");
  */
}

void createGirones()
{
  g = new giron[cant][cant];
  for(int i = 0; i < cant; i++)
  for(int j = 0; j < cant; j++)
  {
    float x = map(i, 0, cant-1, -lado/2, lado/2);
    float y = map(j, 0, cant-1, -lado/2, lado/2);
    g[i][j] = new giron(x, y, gSz);
  }
}