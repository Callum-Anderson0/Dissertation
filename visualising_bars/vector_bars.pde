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
    restyle();
  }
  
  void display(color c){
    stroke(c);
    strokeWeight(5);
    if(VBAR_STYLE == "VECTOR"){
      circle(start.x,start.y,5);
    }
    line(start.x,start.y,end.x,end.y);
    textSize(20);
    fill(c);
    text(id,start.x,start.y+20);
  }
  
  void restyle(){
    if(VBAR_STYLE == "LINE"){
      if(end.x < start.x){
        float temp = end.x;
        end.x = start.x;
        start.x = temp;
      }
      if(end.y < start.y){
        float temp = end.y;
        end.y = start.y;
        start.y = temp;
      }
    }
  }
}
