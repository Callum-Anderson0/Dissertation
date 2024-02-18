Page p;

int BARS = 5;
int BH = 20;
int RELATIONS = 8;
int GROUP_MIN_SIZE = 0;
int BAR_MAX_SIZE = 100;
int BAR_MIN_SIZE = 100;
int BAR_SIZE = 50;
int GROUP_PROXIMITY = 2;
int PROXIMITY_GRANULARITY = 50;
int SIMILARITY_GRANULARITY = 180;
int ANGLE_GRANULARITY = 5;
String BAR_GENERATION_STYLE = "RANDOM SIZE";
String VBAR_GENERATION_STYLE = "EVEN RANDOM";
String VBAR_STYLE = "LINE";
float[] SYMBOL_WEIGHT = {0.5,1,1,1,0.5,1,1,1};
boolean describe = false;

boolean contains(ArrayList<Integer>list,int value){
  boolean found = false;
  for(int i = 0; i < list.size();i++){
    if(list.get(i) == value){
      found = true;
    }
  }
  return found;
}


String relationDict(int code){
  switch(code){
    case 0:
      return "to the right of";
    case 1:
      return "following";
    case 2:
      return "overlapping the end of";
    case 3:
      return "inside of";
    case 4:
      return "to the left of";
    case 5:
      return "preceeding";
    case 6:
      return "overlapping the beginning of";
    case 7:
      return "enclosed by";
      
  }
  return "";
}

int i = 0;

void setup(){
 size(800,800); 
 background(0);
 p = new Page();
 //p.oneDfunctionality();
 p.vbars = p.generateRandomVBars(BARS);
 stroke(255);
 p.displayVBars();
 p.AM.VPopulate(p.vbars);
 p.saveBarsToCSV();
}

void draw(){
  //p.oneDanimate();
}
