vstrip[] v1;
vstrip[] v2;

hstrip[] h1;
hstrip[] h2;

static int cant = 11;
static float sz = 800;
static float anchoTir = 20;
static float anchoTot = 30;

void setup()
{
  size(800, 800, P3D);
  smooth(8);
  frameRate(30);
  ortho();
  v1 = new vstrip[cant];
  v2 = new vstrip[cant];
  h1 = new hstrip[cant];
  h2 = new hstrip[cant];
  for (int i = 0; i < cant; i++)
  {
    int par = int(map(i % 2, 0, 1, 1, -1));
    float px = map(i, 0, cant-1, -sz/2, sz/2);
    float py = map(i, 0, cant-1, -sz/2, sz/2);
    float s = sz / (cant-1);
    float off = s;

    v1[i] = new vstrip(px, 0, 0, sz + off, anchoTir, par, s);
    h1[i] = new hstrip(0, py, 0, sz + off, anchoTir);
    v2[i] = new vstrip(px, 0, -1, sz + off, anchoTot, par, s);
    h2[i] = new hstrip(0, py, -1, sz + off, anchoTot);
  }
}

void draw()
{
  background(#1C2C33);
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, QUARTER_PI/2, -QUARTER_PI/2));
  for (int i = 0; i < cant; i++)
  {
    v1[i].mostrar(color(#BD632F));
    h1[i].mostrar(color(#D8973C));
    v2[i].mostrar(color(#1C2C33));
    h2[i].mostrar(color(#1C2C33));
  }
  /*
  if (frameCount*0.02 < TWO_PI)
    saveFrame("telar####.jpg");
  */
}

void mousePressed()
{
  saveFrame("preview.jpg");
}