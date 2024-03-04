class Property{
  String name;
  String symbol;
  Boolean value;
  
  Property(String tempName,Boolean tempValue, String tempSymbol){
    name = tempName;
    symbol = tempSymbol;
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
