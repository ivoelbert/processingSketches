
void drawPlanet()
{
  color c = color(#83B692);
  
  pushMatrix();
  float offset = map(sin(frameCount * 0.04), -1, 1, -planetOff, planetOff);
  translate(width/2, height + 200 + offset, 200);
  rotateZ(-frameCount*0.02);
  
  noStroke();
  fill(c);
  sphere(planetR);
  
  //nuves
  for(int i = 0; i < cantNubes; i++)
  {
    pushMatrix();
    float ang = map(i, 0, cantNubes, 0, TWO_PI);
    rotateZ(ang);
    
    float deltaY = map(sin(ang), -1, 1, 0, 100);
    float deltaSZ = map(sin(ang), -1, 1, 0, 50);
    
      pushMatrix();
      float cloudY = -planetR - planetR/3 - deltaY;
      float cloudZ = 400;
      translate(0, cloudY, -cloudZ);
      
      //main puff
        float puffSZ = 100 + deltaSZ;
        float trans = 128;
        pushMatrix();
        rotateY(QUARTER_PI/2);
        noStroke();
        fill(255, trans);
        box(puffSZ);
        
        popMatrix();
      
      //izq puff (2/3 main)
        pushMatrix();
        float izqPuffX = -puffSZ/2 - puffSZ/3;
        translate(izqPuffX, 0, 0);
        rotateX(QUARTER_PI);
        
        noStroke();
        fill(255, trans);
        box(0.66 * puffSZ);
        
        popMatrix();
      
      //der puff (1/2 main)
        pushMatrix();
        float derPuffX = puffSZ/2 + puffSZ/4;
        translate(derPuffX, 0, 0);
        rotateX(QUARTER_PI);
        
        noStroke();
        fill(255, trans);
        box(0.5 * puffSZ);
        
        popMatrix();
      
      popMatrix();
      
    popMatrix();
  }
  
  popMatrix();
}