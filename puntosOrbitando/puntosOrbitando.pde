PVector punto[];
PVector vel[];
PVector acc[];

static int cant = 500;
static float sphSZ = 5;
static float scl = 50;

static float v0 = 0.05;
static float g = 0.005;

float myNormal(float x, float s, float u)
{
    float t = 1 / (s * sqrt(2 * PI));
    float ex = -0.5 * pow((x - u) / s, 2);
    return t * exp(ex);
}

float crearPunto(float s, float u)
{
    float x1 = 0, x2 = 1;
    float t = 1 / (s * sqrt(2 * PI));
    float x = random(u - 5*s, u + 5*s);

    while(x1 < x2)
    {
        x = random(u - 5*s, u + 5*s);
        x1 = myNormal(x, s, u);
        x2 = random(0, t);
    }

    return x;
}

void generarDatos(int d, int n, float c)
{
    punto = new PVector[cant];
    vel = new PVector[cant];
    acc = new PVector[cant];
    
    //desviacion estandar
    float sigma = c*sqrt(d);
    
    //lleno los puntos
    for(int i = 0; i < n; i++)
    {
      float x1 = crearPunto(sigma, 0);
      float x2 = crearPunto(sigma, 0);
      float x3 = crearPunto(sigma, 0);
      
      punto[i] = new PVector(x1, x2, x3);
      vel[i] = PVector.random3D();
      vel[i].setMag(v0);
      acc[i] = new PVector(-punto[i].x, -punto[i].y, -punto[i].z);
      acc[i].setMag(g);
    }
}

color c1;
color c2;

void setup()
{
  size(800, 800, P3D);
  smooth(8);
  frameRate(30);
  c1 = color(#FC4747);
  c2 = color(#BC0909);
  generarDatos(3, cant, 1);
}

void draw()
{
  background(20);
  translate(width/2, height/2);
  actualizarPuntos();
  mostrarPuntos();
}

void actualizarPuntos()
{
  for(int i = 0; i < cant; i++)
  {
    vel[i].add(acc[i]);
    punto[i].add(vel[i]);
    acc[i].set(-punto[i].x, -punto[i].y, -punto[i].z);
    acc[i].setMag(g);
  }
}

void mostrarPuntos()
{ 
  for(int i = 0; i < cant; i++)
  {
    pushMatrix();
    translate(punto[i].x * scl, punto[i].y * scl, punto[i].z * scl);
    float sw = map(punto[i].z, -3, 3, 2, 15);
    float v = vel[i].mag();
    float scl = constrain(map(v, 0, 0.5, 0, 1), 0, 1);
    color s = lerpColor(c1, c2, scl);
    stroke(s);
    strokeWeight(sw);
    
    point(0, 0, 0);
    popMatrix();
  }
}

void mousePressed()
{
  saveFrame("preview.jpg");
}