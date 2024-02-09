Page p;
int BARS = 15;
int BH = 20;
int RELATIONS = 8;
int GROUP_MIN_SIZE = 0;
int BAR_MAX_SIZE = 100;
int BAR_SIZE = 50;
int GROUP_PROXIMITY = 3;
String BAR_GENERATION_STYLE = "RANDOM SIZE";
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
 size(600,600); 
 background(0);
 p = new Page();
 p.bars = p.generateRandomBars(BARS);
 background(0);
 p.display();
 p.initialiseAM();
 p.sortGroupsByQuality();
 p.displayGroups();
 p.colourGroup(0);

}
