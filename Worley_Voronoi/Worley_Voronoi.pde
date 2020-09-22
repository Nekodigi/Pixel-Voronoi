ArrayList<Region> regions = new ArrayList<Region>();
float pSize = 1;
int rN = 100;//number of regions
float basehue;
float pSW = 10;
//int power = 2;
boolean render = true;

void setup(){
  size(500, 500);
  //fullScreen();
  colorMode(HSB, 360, 100, 100);
  basehue = random(360);
  for(int i = 0; i < rN; i++){
    color col = color(basehue, random(100), 100);
    PVector p = new PVector(random(width), random(height));
    regions.add(new Region(p, col));
  }
}

//void keyPressed(){
//  if(keyCode == UP){
//    power++;
//  }else if(keyCode == DOWN){
//    power--;
//  }
//  if(key == 'r'){
//    render = !render;
//  }
//}

void draw(){
  background(255);
  noStroke();
  float t = pSize;
  if(render){
    pSize = 1;
  }
  for(int x = 0; x < width; x+=t){
    for(int y = 0; y < height; y+=t){
      ColDst colDst = nearestColor(new PVector(x, y));
      fill(hue(colDst.col), saturation(colDst.col), 100-colDst.dst);
      rect(x, y, pSize, pSize);
    }
  }
  
  for(Region region : regions){
    region.show();
  }
}

ColDst nearestColor(PVector p){
  float minDist = Float.POSITIVE_INFINITY;
  color col = color(0);
  for(Region region : regions){
    float dst = PVector.dist(region.p, p);
    if(minDist > dst){
      minDist = dst;
      col = region.col;
    }
  }
  return new ColDst(col, minDist);
}

class ColDst{
  color col;
  float dst;
  
  ColDst(color col, float dst){
    this.col = col;
    this.dst = dst;
  }
}
