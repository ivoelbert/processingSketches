PVector[] dots;
PVector[] orig;

prisma[] p;
float[] angs;

PVector centro;
float centroAng;
static float centroRad = 200;
static float centroV = 0.02; 

static int ladoCant = 30;
static float dotSz = 15;
static float dotProf = 5;

static float atrac = 0.1;
static float repul = 0.2;
static float rad = 200;

color cfrente, catras, cdemas;
color cfondo;

void setup()
{
  size(800, 800, P3D);
  smooth(8);
  frameRate(30);
  
  cfrente = color(#D00000);
  catras = color(#FFBA08);
  cdemas = color(#032B43);
  cfondo = color(20);
  
  createDots();
  centro = new PVector(0, 0);
  centroAng = 0;
}

void draw()
{
  background(cfondo);
  actualizarCentro();
  moverParticulas();
  calcularRotacion();
  mostrarParticulas();
}