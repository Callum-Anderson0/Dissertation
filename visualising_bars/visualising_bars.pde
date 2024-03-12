Page p;

int BARS = 10;
int BH = 20;
int BAR_MAX_SIZE = 100;
int BAR_MIN_SIZE = 100;
int BAR_SIZE = 50;
String BAR_GENERATION_STYLE = "RANDOM SIZE";
String VBAR_GENERATION_STYLE = "EVEN RANDOM";
String VBAR_STYLE = "VECTOR";



boolean contains(ArrayList<Integer>list,int value){
  boolean found = false;
  for(int i = 0; i < list.size();i++){
    if(list.get(i) == value){
      found = true;
    }
  }
  return found;
}


void setup(){
 size(800,800); 
 background(0);
 p = new Page();
 p.vbars = p.generateRandomVBars(BARS);
 p.displayVBars();
 p.AM.populate(p.vbars);
 p.generateGroups();
 p.displayGroups();
}
