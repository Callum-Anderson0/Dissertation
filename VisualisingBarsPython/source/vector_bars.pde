class VBar{
  PVector start;
  PVector end;
  PVector span;
  int id;
  float bearing;
  color colour;
  
  VBar(int tempId, PVector tempStart,PVector tempEnd, String colourT){
    start = tempStart;
    end = tempEnd;
    id = tempId;
    colour = color(unhex(colourT));
    print(unhex(colourT),"\n");
    span = end.copy().sub(start);
    bearing = PVector.angleBetween(span,new PVector(0,-1));
    if(span.x < 0){
      bearing = (PI-bearing)+PI;
    }
    restyle();
  }
  
  void display(color c){
    stroke(colour);
    strokeWeight(2);
    if(VBAR_STYLE == "VECTOR"){
      circle(start.x,start.y,3);
    }
    line(start.x,start.y,end.x,end.y);
    textSize(15);
    fill(colour);
    text(id,start.x,start.y+15);
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
