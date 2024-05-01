class Relation{
  VBar a,b;
  ArrayList<Property> properties;
  
  
  Relation(){
    properties = new ArrayList<Property>();
  }
  
  void compare(VBar tempA, VBar tempB){
    
    a = tempA;
    b = tempB;
    properties.add(new Property("Intercepting",interceptingCheck(),"A",1));
    properties.add(new Property("Meets",meetsCheck(5),"B",0));
    properties.add(new Property("Near",nearCheck(),"C",0));
    properties.add(new Property("Aligned",alignedCheck(0.8),"D",0));
    properties.add(new Property("Continues",continuesCheck(5),"E",0));
    properties.add(new Property("Shares Start",shareStartCheck(5),"F",0));
    properties.add(new Property("Preceeds",preceedsCheck(5),"G",0));
    
    //displayRelation();
  }
  void displayRelation(){
    print(a.id,b.id,":");
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
  
  boolean anyPropertyTrue(){
    boolean found = false;
    for(Property p: properties){
      if(p.value){
        found = true;
      }
    }
    return found; 
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
  
  boolean meetsCheck(int tolerance){
    return dist(a.end.x,a.end.y,b.end.x,b.end.y) < tolerance;
  }
  
  boolean continuesCheck(int tolerance){
     return dist(a.start.x,a.start.y,b.end.x,b.end.y) < tolerance;
  }
  
  boolean shareStartCheck(int tolerance){
     return dist(a.start.x,a.start.y,b.start.x,b.start.y) < tolerance;

  }
  
  boolean nearCheck(){
    float maxDistance = a.span.mag() + b.span.mag();
    float distance = dist(a.start.x,a.start.y,b.start.x,b.start.y);
    return distance < maxDistance;
  }
  
  boolean alignedCheck(float minimumAlignment){
    //print(a.id,b.id," ");
    float dotProduct = a.span.copy().normalize().dot(b.span.copy().normalize());
    //println(dotProduct);
    return dotProduct > minimumAlignment;
  }
  
  boolean preceedsCheck(int tolerance){
       return dist(a.end.x,a.end.y,b.start.x,b.start.y) < tolerance;
  }
  
  

  Relation inverse(){
    Relation inverse = new Relation();
    inverse.compare(b,a);
    return inverse;
  }

  
}
