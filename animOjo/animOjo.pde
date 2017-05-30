PImage ojoc;
PImage ojoa1, ojoa2, ojoa3, ojoa4;
PImage ojoi1, ojoi2, ojoi3, ojoi4;

static float imgSz = 100;
int imgPerAxis;

static int staticFrames = 3;
static int totalFrames = 16;
int currentImg;
int selector;


void setup()
{
  size(800, 800);
  frameRate(30);
  smooth(4);
  loadImages();
  imgPerAxis = round(width/imgSz);
  currentImg = 0;
  selector = 0;
}

void draw()
{
  if(selector % staticFrames == 0)
      currentImg++;
      
  for(int x = 0; x < imgPerAxis; x++)
  for(int y = 0; y < imgPerAxis; y++)
  {
    float px = map(x, 0, imgPerAxis, 0, width);
    float py = map(y, 0, imgPerAxis, 0, height);
    
    int offset = getOffset(x, y);
    
    int which = (currentImg + offset) % totalFrames; 
    
    showImg(which, px, py);
  }
  selector++;
  if(currentImg > 16)
  {
    selector = 0;
    currentImg = 0;
  }
}

int getOffset(int a, int b)
{
  int off = 0;
  if(a == 0 || a == 7 || b == 0 || b == 7)
    off = 6;
  if((a == 1 && b > 0 && b < 7) || (a == 6 && b > 0 && b < 7) || (b == 1 && a > 0 && a < 7) || (b == 6 && a > 0 && a < 7))
    off = 4;
  if((a == 2 && b > 1 && b < 6) || (a == 5 && b > 1 && b < 6) || (b == 2 && a > 1 && a < 6) || (b == 5 && a > 1 && a < 6))
    off = 2;
  
  return off;
}

void loadImages()
{
  ojoc = loadImage("ojoc.jpg");
  ojoa1 = loadImage("ojoa1.jpg");
  ojoa2 = loadImage("ojoa2.jpg");
  ojoa3 = loadImage("ojoa3.jpg");
  ojoa4 = loadImage("ojoa4.jpg");
  ojoi1 = loadImage("ojoi1.jpg");
  ojoi2 = loadImage("ojoi2.jpg");
  ojoi3 = loadImage("ojoi3.jpg");
  ojoi4 = loadImage("ojoi4.jpg");
}

void showImg(int which, float x, float y)
{
  switch(which)
  {
    case 0:
    image(ojoc, x, y, imgSz, imgSz);
    break;
    
    case 1:
    image(ojoa2, x, y, imgSz, imgSz);
    break;
    
    case 2:
    image(ojoa1, x, y, imgSz, imgSz);
    break;
    
    case 3:
    image(ojoa2, x, y, imgSz, imgSz);
    break;
    
    case 4:
    image(ojoc, x, y, imgSz, imgSz);
    break;
    
    case 5:
    image(ojoi3, x, y, imgSz, imgSz);
    break;
    
    case 6:
    image(ojoi4, x, y, imgSz, imgSz);
    break;
    
    case 7:
    image(ojoi3, x, y, imgSz, imgSz);
    break;
    
    case 8:
    image(ojoc, x, y, imgSz, imgSz);
    break;
    
    case 9:
    image(ojoa3, x, y, imgSz, imgSz);
    break;
    
    case 10:
    image(ojoa4, x, y, imgSz, imgSz);
    break;
    
    case 11:
    image(ojoa3, x, y, imgSz, imgSz);
    break;
    
    case 12:
    image(ojoc, x, y, imgSz, imgSz);
    break;
    
    case 13:
    image(ojoi2, x, y, imgSz, imgSz);
    break;
    
    case 14:
    image(ojoi1, x, y, imgSz, imgSz);
    break;
    
    case 15:
    image(ojoi2, x, y, imgSz, imgSz);
    break;
    
    case 16:
    image(ojoc, x, y, imgSz, imgSz);
    break;
  }
}