class hstrip
{
  float px;
  float py;
  float pz;
  float len;
  float dep;

  hstrip(float x, float y, float z, float l, float d)
  {
    px = x;
    py = y;
    len = l;
    dep = d;
    pz = z;
  }

  void mostrar(color c)
  {
    fill(c);
    noStroke();
    
    float dx = len/2;
    float dy = dep/2;
    
    beginShape();
    vertex(px - dx, py - dy, pz);
    vertex(px + dx, py - dy, pz);
    vertex(px + dx, py + dy, pz);
    vertex(px - dx, py + dy, pz);
    endShape(CLOSE);
  }
}