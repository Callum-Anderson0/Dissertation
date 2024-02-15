class Group{
  int id;
  ArrayList<Integer> members;
  int symbol;
  int size;
  String generationType;
  float quality;
  
  Group(int tempId,int tempSymbol,String type){
    id = tempId;
    symbol = tempSymbol;
    members = new ArrayList<Integer>();
    size = members.size();
    generationType = type;

  }
  
  void display(){
    setQuality();
    if(generationType == "FREQUENCY"){
      println("Quality:",quality,"Bars which are",relationDict(symbol),id,"are:",members);
    }
    if(generationType == "SUBTREE"){
      println("Quality:",quality,"Bars in the subtree with the root bar",id,"where members of the group are on the path of relation type",relationDict(symbol)," other members of the group are ",members);
    }
  }
  
  void addMember(int index){
    members.add(index);
  }
  
  void setSize(){
    size = members.size();
  }
  
  void setQuality(){
    setSize();
    quality = size*SYMBOL_WEIGHT[symbol];
  }
  
  void disincludeRoot(){
    members.remove(0);
    
  }
  
  ArrayList<Integer> Complement(){
     ArrayList<Integer> nonMembers = new ArrayList<Integer>();
     for(int i = 0; i < BARS; i++){
       if(!contains(members,i)){
         nonMembers.add(i);
       }
     }
     return nonMembers;
    }
}
