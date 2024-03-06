Page p;

int BARS = 30;
int BH = 20;
int BAR_MAX_SIZE = 150;
int BAR_MIN_SIZE = 150;
int BAR_SIZE = 50;
String BAR_GENERATION_STYLE = "RANDOM SIZE";
String VBAR_GENERATION_STYLE = "EVEN RANDOM";
String VBAR_STYLE = "VECTOR";

ArrayList<Rule> RULES = new ArrayList<Rule>();



/////////////testing for rules;



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
 //RULES.add(new Rule("C","Cc","",false));
 RULES.add(new Rule("A","Aa","",false));
 //RULES.add(new Rule("AC","acd","",false));
 size(800,800); 
 background(0);
 p = new Page();
 
 //ArrayList<String> symbols = new ArrayList<String>();
 //symbols.add("G");
 //symbols.add("G");
 //symbols.add("G");
 //symbols.add("G");
 //Rule r = new Rule("AC","DE","S",true);
 //print(r.ruleParse(symbols));

 //p.loadBarsFromCSV("bars2024-02-18 14-02-52.csv");
 p.vbars = p.generateRandomVBars(BARS);
 stroke(255);
 p.displayVBars();
 p.AM.Populate(p.vbars);
 p.AM.update();
 ArrayList<ArrayList<Integer>> groups =p.AM.defineGroups();
 for(int j = 0; j< groups.size();j++){
   color groupColour = color(random(255),random(255),random(255));
   for(int i = 0; i < groups.get(j).size();i++){
     p.vbars.get(groups.get(j).get(i)).display(groupColour);
   }
 }
 //p.AM.cullProperties(RULES);
 
 //p.saveBarsToCSV();
}

void draw(){
  //p.oneDanimate();
}
