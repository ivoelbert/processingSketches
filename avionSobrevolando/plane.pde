// Dibuja el avion
void drawPlane()
{
  pushMatrix();
  /*
  //OFFSET para animación
  float offset = map(sin(frameCount * 0.08), -1, 1, -planeOff, planeOff);
  */
  
  //OFFSET para juego
  float offset = map(mouseY, 0, height, -150, 50);
  
  /*
  //OFFSET para debug
  float offset = 0;
  */
  
  float ang = map(sin(frameCount*0.04), -1, 1, -planeRot, planeRot);
  translate(width/2, height/2 + offset, 200);
  rotateY(radians(-10));
  rotateX(ang);
  rotateZ(map(pmouseY - mouseY, 0, height, 0, -HALF_PI));
  
  plane(150);
  
  popMatrix();
}

//el avion en cuestion en (0, 0, 0)
void plane(float largo)
{
  color c = color(#D16666);
  float motorProportion = 0.2;
  float aletasH = 5;
  float aletasW = 20;
  float alasSZ = largo;
  
  noStroke();
  fill(c);
    
  //motor
    float motorSZ = motorProportion * largo;
    float motorX = motorSZ/2;
    pushMatrix();
    translate(motorX, 0, 0);
    
    box(motorSZ);
    
    popMatrix();
  
  //cuerpo
    float tipX = -(1 - motorProportion) * largo;
    
    //cara frente
    float baseDY = motorSZ*0.5;
    float baseDZ = motorSZ*0.5;
    
    beginShape();
    vertex(0, -baseDY, baseDZ);
    vertex(0, baseDY, baseDZ);
    vertex(tipX, 0, 0);
    endShape(CLOSE);
    
    //cara arriba
    beginShape();
    vertex(0, -baseDY, -baseDZ);
    vertex(0, -baseDY, baseDZ);
    vertex(tipX, 0, 0);
    endShape(CLOSE);
    
    //cara abajo
    beginShape();
    vertex(0, baseDY, -baseDZ);
    vertex(0, baseDY, baseDZ);
    vertex(tipX, 0, 0);
    endShape(CLOSE);
    
  //aleta trasera
    float dx = aletasW / 2;
    float dy = aletasH / 2;
    float dz = motorSZ / 1.5;
    
    pushMatrix();
    translate(tipX, 0, 0);
    
    prisma(dx, dy, dz);
    
    popMatrix();
    
  //timon trasero
    
    float temp = dy;
    dy = dz / 2;
    dz = temp;
    
    pushMatrix();
    translate(tipX, -dy, 0);
    
    prisma(dx, dy, dz);
    
    popMatrix();
    
  //ala abajo
    pushMatrix();
    float alaAbajoY = motorSZ/2 - aletasH/2;
    translate(0, alaAbajoY, 0);
    
    dx = aletasW;
    dy = aletasH / 2;
    dz = alasSZ / 2;
    
    prisma(dx, dy, dz);
    popMatrix();
  
  //ala arriba
    float offset = motorSZ / 4;
    float alaArribaY = -motorSZ - offset;
    pushMatrix();
    translate(0, alaArribaY, 0);
    
    dx = aletasW;
    dy = aletasH / 2;
    dz = alasSZ / 2;
    
    prisma(dx, dy, dz);
    popMatrix();
  
  //postes
    pushMatrix();
    float alasDif = abs(alaArribaY) + abs(alaAbajoY);
    float postesY = alasDif / 2 - abs(alaAbajoY);
    float postesZ = 0.75 * alasSZ / 2;
    translate(0, -postesY, postesZ);
    
    dx = aletasH /2;
    dy = alasDif / 2;
    dz = aletasH /2;
    prisma(dx, dy, dz);
    
    popMatrix();
    
    pushMatrix();
    translate(0, -postesY, -postesZ);
    
    prisma(dx, dy, dz);
    
    popMatrix();
  
  //rotor
    pushMatrix();
    translate(motorSZ, 0, 0);
    
    //eje
      pushMatrix();
      translate(aletasH / 2, 0, 0);
      
      fill(#454545);
      box(aletasH);
      
      popMatrix();
    
    //rotor
      pushMatrix();
      translate(aletasH * 1.5, 0, 0);
      rotateX(frameCount*0.8);
      
      float rotorSZ = aletasH * 2;
      fill(c);
      dx = rotorSZ / 4;
      dy = rotorSZ / 2;
      dz = rotorSZ / 2;
      prisma(dx, dy, dz);
      
      //pala arriba
        pushMatrix();
        translate(0, -rotorSZ, 0);
        
        fill(#FAFFD8);
        dx = rotorSZ / 8;
        dy = rotorSZ / 2;
        dz = rotorSZ / 4;
        prisma(dx, dy, dz);
        
        popMatrix();
      
      //pala arriba
        pushMatrix();
        translate(0, rotorSZ, 0);
        
        fill(#FAFFD8);
        dx = rotorSZ / 8;
        dy = rotorSZ / 2;
        dz = rotorSZ / 4;
        prisma(dx, dy, dz);
        
        popMatrix();
      
      popMatrix();
    
    popMatrix();
  
  //cabeza
    float cabezaSZ = motorSZ / 4;
    pushMatrix();
    translate(-2 * cabezaSZ, -motorSZ/2, 0);
    
    fill(#FAFFD8);
    box(cabezaSZ);
    
    //gorra
    translate(0, -cabezaSZ/2 - cabezaSZ/4, 0);
    fill(#454545);
    dx = cabezaSZ/2;
    dy = cabezaSZ/4;
    dz = cabezaSZ/2;
    prisma(dx, dy, dz);
    popMatrix();
}