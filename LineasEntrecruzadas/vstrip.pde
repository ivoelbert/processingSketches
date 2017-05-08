class vstrip
{
  float px;
  float py;
  float pz;
  float len;
  float dep;
  int par;
  float sep;

  vstrip(float x, float y, float z, float l, float d, int p, float s)
  {
    px = x;
    py = y;
    len = l;
    dep = d;
    par = p;
    sep = s;
    pz = z;
  }

  void mostrar(color c)
  {
    int res = 100;
    fill(c);
    noStroke();
    for (int i = 0; i < res; i++)
    {
      float x1 = px;
      float y1 = map(i, 0, res-1, py + len / 2, py - len / 2);
      float z1 = par * cos(map(y1, 0, sep*2, 0, TWO_PI)) * 50 + pz;
      
      float x2 = px;
      float y2 = map(i+1, 0, res-1, py + len / 2, py - len / 2);
      float z2 = par * cos(map(y2, 0, sep*2, 0, TWO_PI)) * 50 + pz;
      
      beginShape();
      vertex(x1 - dep/2, y1, z1);
      vertex(x1 + dep/2, y1, z1);
      vertex(x2 + dep/2, y2, z2);
      vertex(x2 - dep/2, y2, z2);
      endShape(CLOSE);
    }
  }
}