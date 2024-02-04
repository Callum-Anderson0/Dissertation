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
    print("Bars related to",id,"by the relation",relationDict(symbol),"are:",members);
    println();
  }
  
  int size(){
    size = members.size();
    return size;
  }
  
  void addMember(int index){
    members.add(index);
  }
  
}
