class Group{
  int id;
  ArrayList<Integer> members;
  int symbol;
  int size;
  
  Group(int tempId,int tempSymbol){
    id = tempId;
    symbol = tempSymbol;
    members = new ArrayList<Integer>();
    size = members.size();
  }
  
  void display(){
    print("Bars which are",relationDict(symbol),id,"are:",members);
    println();
  }
  
  int size(){
    size = members.size();
    return size;
  }
  
  void addMember(int index){
    members.add(index);
  }
  
  
  void setSize(){
    size = members.size();
  }
  
  //ArrayList<Integer> Complement(){
  //   ArrayList<Integer> nonMembers = new ArrayList<Integer>();
  //   for(int i = 0; i < BARS; i++){
  //     for(int j = 0; j < members.size();j++)
       
  //   }
  //   return nonMembers;
  //  }
}
