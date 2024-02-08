class AdjacencyMatrix{
  int numberOfBars;
  int[][] matrix;
  
  AdjacencyMatrix(){
    matrix = new int[BARS][BARS];
  }
  
  void populate(ArrayList<Bar> bars){
    for(int i = 0; i < BARS; i++){
       for(int j = 0; j < BARS; j++){
          if(j != i){
          matrix[i][j] = bars.get(i).compare(p.bars.get(j));
         }
      }
    }
  }
  
  void display(){
    for(int i = 0; i < BARS;i++){
      for(int j = 0; j < BARS;j++){
        print(matrix[i][j]," ");
      }
      print("\n");
    }
  }
  
  ArrayList<Group> generateGroups(){
    ArrayList<Group> groups = new ArrayList<Group>();
    for(int j = 0; j < BARS;j++){
      for(int i = 0; i < RELATIONS;i++){
         groups.add(new Group(j,i));
      }
    }
    
    for(int i = 0; i < BARS; i++){
      for(int j = 0; j < BARS; j++){
        if(i != j){
          for(int ii = 0; ii < groups.size();ii++){ // all the groups
            if(groups.get(ii).id == i && groups.get(ii).symbol == matrix[i][j]){
              groups.get(ii).addMember(j);
            }
          }
        }
      }
    }
    for(int i = groups.size()-1; i >= 0;i--){
      if(groups.get(i).members.size() < GROUP_MIN_SIZE){
        groups.remove(i);
      }
    }
        
   return groups;
  }
  
}


  
