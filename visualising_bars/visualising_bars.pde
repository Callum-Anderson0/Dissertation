Page p;
int BARS = 10;
int RELATIONS = 8;
boolean describe = false;

String relationDict(int code){
  switch(code){
    case 0:
      return "left";
    case 1:
      return "follows";
    case 2:
      return "overlaps end";
    case 3:
      return "inside";
    case 4:
      return "right";
    case 5:
      return "preceeds";
    case 6:
      return "overlaps beginning";
    case 7:
      return "enclose";
      
  }
  return "";
}



void setup(){
 size(600,600); 
 background(0);
 p = new Page(20);
 p.bars = p.generateRandomBars(BARS);
 background(0);
 p.display();
 p.initialiseAM();
 p.AM.populate(p.bars);
 p.AM.generateGroups();
 p.AM.display();
}
