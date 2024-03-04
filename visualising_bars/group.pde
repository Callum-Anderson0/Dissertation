class Group{
  int id;
  ArrayList<Integer> members;
  
  Group(int tempId){
    id = tempId;
    members = new ArrayList<Integer>();
  }

  void addMember(int index){
    members.add(index);
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
