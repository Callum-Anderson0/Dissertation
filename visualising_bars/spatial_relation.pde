class Relation{
  VBar a,b;
  
  boolean intercepting; 
  boolean meets;
  boolean continues;
  int proximity;
  float similarity;
  int angleBetween;
  
  Relation(){
    intercepting = false;
  }
  
  void compare(VBar tempA, VBar tempB){
    a = tempA;
    b = tempB;
    intercepting = interceptingCheck();
    meets = meetsCheck();
    continues = continuesCheck();
    proximity = proximityCheck();
    similarity = similarityCheck();
    angleBetween = angleBetweenCheck();
    println(a.id,b.id,intercepting,proximity,angleBetween,similarity);
  }
  
  boolean interceptingCheck(){
    float d = (a.start.x - a.end.x) * (b.start.y - b.end.y) - (a.start.y - a.end.y) * (b.start.x - b.end.x);
    if (d == 0){
      return false;
    }
    float t = ((a.start.x - b.start.x) * (b.start.y - b.end.y) - (a.start.y - b.start.y) * (b.start.x - b.end.x)) / d;
    
    float u = -((a.start.x - a.end.x) * (a.start.y - b.start.y) - (a.start.y - a.end.y) * (a.start.x - b.start.x)) / d;
    return (t >= 0 && t <= 1 && u >= 0 && u <= 1);
  }
  
  boolean meetsCheck(){
    return a.end.x == b.end.x && a.end.y == b.end.y;
    //maybe add a range;
  }
  
  boolean continuesCheck(){
    return a.end.x==b.start.x && a.end.x == b.start.x;
    //maybe add a range;
  }
  
  int proximityCheck(){
    return int(PVector.dist(a.start,b.start))/PROXIMITY_GRANULARITY;
    //implement loci proximity;
  } 
  
  int angleBetweenCheck(){
    return (int)(PVector.angleBetween(a.span,b.span)/(PI/180))/(180/ANGLE_GRANULARITY);
  }
  
  Relation inverse(){
    Relation inverse = new Relation();
    inverse.compare(b,a);
    return inverse;
  }
  
  float similarityCheck(){
    return (a.span.mag()/b.span.mag()); 
  }
}
