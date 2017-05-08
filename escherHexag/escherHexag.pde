static float lado = 60;
static float maxoff = 3*lado/4;

static int ladoDots = 7;
PVector lado1[];
PVector lado2[];
PVector ladoAct[];
PVector ladoPlano[];

color R, B, N;

static int animationFrames = 90;

void setup()
{
  size(1280, 800);
  smooth(8);
  frameRate(30);
  R = color(#CC5045);
  B = color(#EAEAEA);
  N = color(#231F20);
  
  createLados();
}

void draw()
{
  background(255);
  drawGrid();
  if(frameCount%animationFrames == 0)
    actualizarLados();
  animarLado(frameCount%animationFrames);
}

void drawGrid()
{
  drawHexags();
  drawPuntas();
}