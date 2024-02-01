class Group{
  int id;
  ArrayList<Integer> members;
  int symbol;
  
  Group(int tempId,int tempSymbol){
    id = tempId;
    symbol = tempSymbol;
    members = new ArrayList<Integer>();
  }
  
  void display(){
    print("Bars related to",id,"by the relation",symbol,"are:",members);
    println();
  }
  
  void addMember(int index){
    members.add(index);
  }
  
}
