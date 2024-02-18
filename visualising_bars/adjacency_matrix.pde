class AdjacencyMatrix{
  int numberOfBars;
  int[][] matrix;
  Relation[][] Vmatrix;
  
  AdjacencyMatrix(){
    matrix = new int[BARS][BARS];
    Vmatrix = new Relation[BARS][BARS];
  }
  
  void populate(ArrayList<Bar> bars){
    for(int i = 0; i < BARS; i++){
       for(int j = 0; j < BARS; j++){
          if(j != i){
          matrix[i][j] = bars.get(i).compare(p.bars.get(j));
         }
      }
    }
    proximityCull();
    display();
  }
  
  void VPopulate(ArrayList<VBar> vbars){
    for(int i = 0; i < BARS; i++){
      for(int j = i; j < BARS; j++){
        if(j!=i){
          Relation entry = new Relation();
          entry.compare(vbars.get(i),vbars.get(j));
          Vmatrix[i][j] = entry;
          Vmatrix[j][i] = entry.inverse();
        }
      }
    }
  }
  
  
  void proximityCull(){
    for(int i = 0; i < BARS; i++){
       for(int j = 0; j < BARS; j++){
         if(j < i - GROUP_PROXIMITY || j > i + GROUP_PROXIMITY){
          matrix[i][j] = -1;
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
  
  ArrayList<Group> generateGroupsByFrequency(){
    ArrayList<Group> groups = new ArrayList<Group>();
    for(int j = 0; j < BARS;j++){
      for(int i = 0; i < RELATIONS;i++){
         groups.add(new Group(j,i,"FREQUENCY"));
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
  
  //ArrayList<Group> generateGroupsBySubTree(){
  //  ArrayList<Group> groups = new ArrayList<Group>();
  //  for(int j = 0; j < BARS;j++){
  //    for(int i = 0; i < RELATIONS;i++){
  //       Group newGroup = new Group(j,i,"SUBTREE");
  //       newGroup.members = findSubTreeGroup(j,i);
  //       newGroup.disincludeRoot();
  //       groups.add(newGroup);
  //    }
  //  }
  //  return groups;
  //}
  
  ArrayList<Integer> findSubTreeGroup(int root){
    ArrayList<Integer> visitedNodes = new ArrayList<Integer>();
    ArrayList<Integer> maximalSubtree = new ArrayList<Integer>();
    vdfs(root,visitedNodes,maximalSubtree);
  
    //print(maximalSubtree,"\n");
    return maximalSubtree;
  }
  
  void dfs(int node, ArrayList<Integer> visitedNodes,ArrayList<Integer> maximalSubtree,int symbol){
    visitedNodes.add(node);
    maximalSubtree.add(node);
    for(int i = 0; i < BARS;i++){
      boolean inList = contains(visitedNodes,i);
      if(matrix[node][i]==symbol && !inList){
        dfs(i,visitedNodes,maximalSubtree,symbol);
      }
    }
  }
  void vdfs(int node, ArrayList<Integer> visitedNodes,ArrayList<Integer> maximalSubtree){
    visitedNodes.add(node);
    maximalSubtree.add(node);
    for(int i = 0; i < BARS;i++){
      boolean inList = contains(visitedNodes,i);
      if(Vmatrix[node][i].intercepting && !inList){
        vdfs(i,visitedNodes,maximalSubtree);
      }
    }
  }
  

}


  
