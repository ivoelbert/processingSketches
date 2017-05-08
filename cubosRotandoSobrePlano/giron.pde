
class giron
{
  float px;
  float py;
  float sz;
  float ang;
  
  giron(float x, float y, float s)
  {
    px = x;
    py = y;
    sz = s;
    ang = 0;
  }
  
  void setAng(float a)
  {
    ang = a;
  }
  
  float getDistToCenter()
  {
    PVector p = new PVector(px, py);
    float d = p.mag();
    return d;
  }
  
  void mostrar()
  {
    noStroke();
    fill(200);
    
    pushMatrix();
    translate(px, py);
    
    rotateX(QUARTER_PI);
    rotateY(-QUARTER_PI);
    
    PVector rot = new PVector(1, 1, 1);
    rot.normalize();
    float u = rot.x;
    float v = rot.y;
    float w = rot.z;
    
    float a, b, c;
    float d, e, f;
    float g, h, i;
    
    a = u*u + (1 - u*u) * cos(ang);
    b = u * v * (1 - cos(ang)) - w * sin(ang);
    c = u * w * (1 - cos(ang)) + v * sin(ang);
    
    d = u * v * (1 - cos(ang)) + w * sin(ang);
    e = v*v + (1 - v*v) * cos(ang);
    f = v * w * (1 - cos(ang)) - u * sin(ang);
    
    g = u * w * (1 - cos(ang)) - v * sin(ang);
    h = v * w * (1 - cos(ang)) + u * sin(ang);
    i = w*w + (1 - w*w) * cos(ang);
    
    applyMatrix( a, b, c, 0,
                 d, e, f, 0,
                 g, h, i, 0,
                 0, 0, 0, 1);
    
    box(sz);
    popMatrix();
  }
}