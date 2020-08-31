ArrayList<Region> regions = new ArrayList<Region>();
float pSize = 10;
int rN = 30;//number of regions
float polyDst = 100;//500polygon vertex distribute(for testing)
float basehue;
float lSW = 2;//10
int power = 1;
boolean render = false;

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

void keyPressed(){
  if(key == 'g'){
    regions = new ArrayList<Region>();
    basehue = random(360);
    for(int i = 0; i < rN; i++){
      color col = color(basehue, random(100), 100);
      PVector p = new PVector(random(width), random(height));
      regions.add(new Region(p, col));
    }
  }
  if(key == 'r'){
    render = !render;
  }
}

void draw(){
  background(255);
  noStroke();
  float t = pSize;
  if(render){
    pSize = 1;
  }else{
    pSize = 10;
  }
  for(int x = 0; x < width; x+=t){
    for(int y = 0; y < height; y+=t){
      fill(nearestColor(power, new PVector(x, y)));
      rect(x, y, pSize, pSize);
    }
  }
  
  for(Region region : regions){
    region.show();
  }
}

color nearestColor(int val, PVector p){
  float minDist = Float.POSITIVE_INFINITY;
  color col = color(0);
  for(Region region : regions){
    float dst = region.calcDist(p);
    if(minDist > dst){
      minDist = dst;
      col = region.col;
    }
  }
  return col;
}
