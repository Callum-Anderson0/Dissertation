class VBar{
  PVector start;
  PVector end;
  PVector span;
  int id;
  float bearing;
  
  VBar(int tempId, PVector tempStart,PVector tempEnd){
    start = tempStart;
    end = tempEnd;
    id = tempId;
    span = end.copy().sub(start);
    bearing = PVector.angleBetween(span,new PVector(0,-1));
    if(span.x < 0){
      bearing = (PI-bearing)+PI;
    }
  }
  
  void display(){
    strokeWeight(5);
    circle(start.x,start.y,5);
    line(start.x,start.y,end.x,end.y);
    textSize(10);
    text(id,start.x,start.y+20);
  }
}
