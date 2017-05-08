static float planetR = 500;
static float planetOff = 10;
static float planeOff = 20;
static float planeRot = radians(10);

static int cantNubes = 6;

float avionY;

void setup()
{
  size(800, 800, P3D);
  smooth(8);
  frameRate(30);
}

void draw()
{
  background(#ADE1E5);
  
  avionY = map(mouseY, 0, height, -150, 50) + height / 2;
  
  light();
  drawPlane();
  drawPlanet();
}