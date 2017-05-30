static float rad = 250;
static float phiInc = 0.001;
static float thetaInc = 0.1;

void setup() {
  size(800, 800, P3D);
  smooth(8);
  frameRate(30);
  stroke(#1C1D21);
  //ortho();
}

void draw() {
  background(#F2F7F2);
  translate(width/2, height/2);
  drawSphere();
  /*
  if(frameCount * 0.03 < TWO_PI)
    saveFrame("sph####.jpg");
  */
}

void mousePressed() {
  saveFrame("preview.jpg");
}

void drawSphere() {
  float theta = 0;
  float offset = frameCount * 0.03;
  for(float phi = 0; phi < PI; phi += phiInc) {
    float r = rad;
    
    float x1, y1, z1;
    x1 = r * sin(phi) * cos(theta + offset);
    z1 = r * sin(phi) * sin(theta + offset);
    y1 = r * cos(phi);
    
    theta += thetaInc;
    phi += phiInc;
        
    float x2, y2, z2;
    x2 = r * sin(phi) * cos(theta + offset);
    z2 = r * sin(phi) * sin(theta + offset);
    y2 = r * cos(phi);
    
    PVector vec = new PVector(x2, z2, y2);
    vec.normalize();
    float u = vec.x;
    float v = vec.y;
    float w = vec.z;
    float ang = offset*8;
    
    float x = x1 - x2;
    float y = y1 - y2;
    float z = z1 - z2;
    
    float nx = u*(u*x + v*y + w*z)*(1 - cos(ang)) + x*cos(ang) + (-w*y + v*z)*sin(ang);
    float ny = v*(u*x + v*y + w*z)*(1 - cos(ang)) + y*cos(ang) + (w*x - u*z)*sin(ang);
    float nz = w*(u*x + v*y + w*z)*(1 - cos(ang)) + z*cos(ang) + (-v*x + u*y)*sin(ang);
    
    x1 = nx + x2;
    y1 = ny + y2;
    z1 = nz + z2;
    
    strokeWeight(map(z1, -rad, rad, 0.5, 4));
    line(x1, y1, z1, x2, y2, z2);
    
    theta += thetaInc;
  }
  
}