class Region{
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  PVector p;
  color col;
  
  Region(PVector p, color col){
    this.p = p;
    vertices.add(p);
    vertices.add(PVector.add(p, new PVector(random(-polyDst, polyDst), random(-polyDst, polyDst))));
    vertices.add(PVector.add(p, new PVector(random(-polyDst, polyDst), random(-polyDst, polyDst))));
    this.col = col;
  }
  
  float calcDist(PVector target){
    float dst = Float.POSITIVE_INFINITY;
    for(int i=0; i<vertices.size()-1; i++){
      PVector A = vertices.get(i);
      PVector B = vertices.get(i+1);
      dst = min(dst, lineDist(target, A, B));
    }
    return dst;
  }
  
  void show(){
    if(!render){
      stroke(360);
      noFill();
      strokeWeight(lSW);
      //point(p.x, p.y);
      beginShape();
      for(PVector v : vertices){
        vertex(v.x, v.y);
      }
      endShape(CLOSE);
    }
  }
}
