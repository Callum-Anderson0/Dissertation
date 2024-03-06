class Relation{
  VBar a,b;
  ArrayList<Property> properties;
  
  
  Relation(){
    properties = new ArrayList<Property>();
  }
  
  void compare(VBar tempA, VBar tempB){
    
    a = tempA;
    b = tempB;
    properties.add(new Property("Intercepting",interceptingCheck(),"A"));
    properties.add(new Property("Meets",meetsCheck(),"B"));
    properties.add(new Property("Near",nearCheck(),"C"));
    
    
    //displayRelation();
  }
  void displayRelation(){
    print(a.id,b.id,":\n");
    for(int i = 0; i < properties.size();i++){
      print(properties.get(i).getName(),properties.get(i).getValue(),"");
    }
    println();
  }
  
  ArrayList<String> generateInclusionArray(){
    ArrayList<String> trueSymbols = new ArrayList<String>();
    for(int i = 0; i < properties.size();i++){
      if(properties.get(i).value){
        trueSymbols.add(properties.get(i).symbol);
      }
    }
    return trueSymbols;
  }
  
  void selfParse(ArrayList<Rule> rules){
    ArrayList<String> symbols = generateInclusionArray();   
    for(int i = 0; i < rules.size();i++){
      symbols = rules.get(i).ruleParse(symbols);

    }
    updateBasedOnParsing(symbols);
  }
  
  void updateBasedOnParsing(ArrayList<String> symbol){
    for(int i = 0; i < properties.size();i++){
      boolean found = false;
      for(int j = 0; j < symbol.size();j++){
        if(symbol.get(j).equals(properties.get(i).symbol.toLowerCase())){
          found = true;
        }
      }
      properties.get(i).value = found && properties.get(i).value;
    }
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
  }
  
  boolean continuesCheck(){
    return a.end.x==b.start.x && a.end.x == b.start.x;
  }
  
  boolean nearCheck(){
    float maxDistance = a.span.mag() + b.span.mag();
    float distance = dist(a.start.x,a.start.y,b.start.x,b.start.y);
    return distance < maxDistance;
  }
  
  

  Relation inverse(){
    Relation inverse = new Relation();
    inverse.compare(b,a);
    return inverse;
  }

  
}
