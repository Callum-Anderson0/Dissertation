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
    proximityCull();
    display();
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
  
  ArrayList<Group> generateGroupsBySubTree(){
    ArrayList<Group> groups = new ArrayList<Group>();
    
    return groups;
  }
  
  ArrayList<Integer> findSubTreeGroup(int root,int symbol){
    ArrayList<Integer> visitedNodes = new ArrayList<Integer>();
    ArrayList<Integer> maximalSubtree = new ArrayList<Integer>();
    dfs(root,visitedNodes,maximalSubtree,symbol);
    print(maximalSubtree);
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
  
  boolean contains(ArrayList<Integer>list,int value){
    boolean found = false;
    for(int i = 0; i < list.size();i++){
      if(list.get(i) == value){
        found = true;
      }
    }
    return found;
  }
  
}


  
