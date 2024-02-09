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
    print("Quality:",quality,"Bars which are",relationDict(symbol),id,"are:",members);
    println();
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
  
  //ArrayList<Integer> Complement(){
  //   ArrayList<Integer> nonMembers = new ArrayList<Integer>();
  //   for(int i = 0; i < BARS; i++){
  //     for(int j = 0; j < members.size();j++)
       
  //   }
  //   return nonMembers;
  //  }
}
