class Property{
  String name;
  String symbol;
  int propagates;
  Boolean value;
  
  Property(String tempName,Boolean tempValue, String tempSymbol, int propT){
    name = tempName;
    symbol = tempSymbol;
    propagates = propT;
    value = tempValue;
  }
  
 void setValue(boolean v){
   value = v;
 }
 
 boolean getValue(){
   return value;
 }
 
 void setName(String n){
   name = n;
 }
 String getName(){
   return name;
 }
}
