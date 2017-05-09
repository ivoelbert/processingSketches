PImage img;
static float minStripSz = 1;
static float maxStripSz = 10;
static float sep = 1.5;
static int stripDots = 200;

static float scl = 1;
static float wiggleAmp = 50;

float wiggle(float x)
{
  float ret = 0;
  float px = map(x, 0, stripDots, 0, 3*TWO_PI);
  ret = map(sin(px), -1, 1, -wiggleAmp, wiggleAmp);
  return ret;
}

class strip
{
  float x;
  float[] px;
  float[] w;
  
  strip(float xx)
  {
    x = xx;
    px = new float[stripDots];
    w = new float[stripDots];
    for(int i = 0; i < stripDots; i++)
    { 
      px[i] = wiggle(i) + x;
      float py = map(i, 0, stripDots-1, 1, height-1);
      
      if(int(px[i]) > 0 && int(px[i]) < width)
      {
        int index = int(px[i]) + int(py) * width-1;
        float b = brightness(img.pixels[index]);
        w[i] = map(b, 0, 256, maxStripSz, minStripSz);
      }
      else
        w[i] = minStripSz;
    }
  }
  
  void updatepx(float s)
  {
    for(int i = 0; i < stripDots; i++)
    { 
      px[i] = wiggle(i + frameCount*s) + x;
    }
  }
  
  void mostrar()
  {
    noStroke();
    fill(0);
    beginShape();
    curveVertex(px[0] - w[0]/2, 0); 
    for(int i = 0; i < stripDots; i++)
    {
      float py = map(i, 0, stripDots-1, 0, height);
      curveVertex(px[i] - w[i]/2, py);
    }
    for(int i = stripDots - 1; i >= 0; i--)
    {
      float py = map(i, 0, stripDots-1, 0, height);
      curveVertex(px[i] + w[i]/2, py);
    }
    curveVertex(px[0] + w[0]/2, 0);
    endShape(CLOSE);
  }
}

strip[] s;
int cant;

void setup()
{
  size(1000, 1000);
  smooth(8);
  frameRate(30);
  
  cant = int(width/(maxStripSz * sep));
  
  img = loadImage("img.jpg");
  img.loadPixels();
  
  s = new strip[cant];
  for(int i = 0; i < cant; i++)
  {
    float x = map(i, 0, cant-1, -wiggleAmp, width+wiggleAmp);
    s[i] = new strip(x);
  }
}

void draw()
{
  background(250);
  for(int i = 0; i < cant; i++)
  {
    //s[i].updatepx(scl);
    s[i].mostrar();
  }
    //saveFrame("anim####.jpg");
    
}

void mousePressed()
{
  saveFrame("preview.jpg");
}