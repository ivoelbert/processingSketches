void animarLado(int frame)
{
  float t = map(frame, 0, animationFrames, 0, 1);
  
  for(int i = 0; i < ladoDots; i++)
  {
    ladoAct[i] = PVector.lerp(lado1[i], lado2[i], t);
  }
}