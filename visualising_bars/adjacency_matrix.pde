import java.util.Collections;
class AdjacencyMatrix{
  int numBars ;
  Relation[][] matrix;
  
  AdjacencyMatrix(int numBarsT){
    numBars = numBarsT;
    matrix = new Relation[numBars][numBars];
  }
  
  void populate(ArrayList<VBar> vbars){
    for(int i = 0; i < numBars; i++){
      for(int j = i; j < numBars; j++){
        if(j!=i){
          Relation entry = new Relation();
          entry.compare(vbars.get(i),vbars.get(j));
          matrix[i][j] = entry;
          matrix[j][i] = entry.inverse();
        }
      }
    }
  }
  
  //void update(){
  //  for(int i = 0; i < numBars;i++){
  //    for(int j = 0; j < numBars; j++){
  //      if(j!=i){
  //        matrix[i][j].selfParse(RULES);
  //      }
  //    }
  //  }
  //}
  
  ArrayList<ArrayList<Integer>> defineGroups(){
    ArrayList<ArrayList<Integer>> potentialGroups = new ArrayList<ArrayList<Integer>>();
    for(int i = 0; i < numBars;i++){
      ArrayList<Integer> group = BreadthFirstSearch(i);
      Collections.sort(group);
      boolean found = false;
      for(int j = 0; j < potentialGroups.size();j++){
        if(group.equals(potentialGroups.get(j))){
          found = true;
        }
      }
      if(found == false){
              potentialGroups.add(group);
      }
    }
    return potentialGroups;
  }
  
  ArrayList<Integer> BreadthFirstSearch(int start){
    ArrayList<Integer> Queue = new ArrayList<Integer>();
    ArrayList<Integer> Visited = new ArrayList<Integer>();
    Queue.add(start);
    Visited.add(start);
    while(Queue.size()>0){

      int current_node = Queue.remove(0);
      ArrayList<ArrayList<Integer>> allNeighbours = findNeighbours(current_node);
      ArrayList<Integer> neighbours = allNeighbours.get(0);
      ArrayList<Integer> nonExpandingNeighbours = allNeighbours.get(1); 
      for(int i = 0; i < neighbours.size();i++){
        if(!Visited.contains(neighbours.get(i))){
          Queue.add(neighbours.get(i));
          Visited.add(neighbours.get(i));
        }
      }
      for(int i = 0; i < nonExpandingNeighbours.size();i++){
        if(!Visited.contains(nonExpandingNeighbours.get(i))){
          Visited.add(nonExpandingNeighbours.get(i));
        }
      }
    }
    return Visited;
  }

   
        
  ArrayList<ArrayList<Integer>> findNeighbours(int id){
    ArrayList<ArrayList<Integer>> results = new ArrayList<ArrayList<Integer>>();
    ArrayList<Integer> neighbours = new ArrayList<Integer>();
    ArrayList<Integer> nonExpandingNeighbours = new ArrayList<Integer>();
    for(int i = 0; i < numBars; i++){
      if(id!=i){;
        for(int j = 0; j < matrix[id][i].properties.size();j++){
          if(matrix[id][i].properties.get(j).value == true && matrix[id][i].properties.get(j).propagates == 1){
            if(!neighbours.contains(i));
              neighbours.add(i);
          }
          if(matrix[id][i].properties.get(j).value == true && matrix[id][i].properties.get(j).propagates == 2){
          if(!nonExpandingNeighbours.contains(i));
            nonExpandingNeighbours.add(i);
          }
        }
      }
      
    }
    results.add(neighbours);
    results.add(nonExpandingNeighbours);

    return results;
  }
  
  
  void bronKerboschAlg(){
    ArrayList<ArrayList<Integer>> maximalCliques = new ArrayList<ArrayList<Integer>>();
    boolean[] visited = new boolean[numBars];
    boolean[] candidates = new boolean[numBars];
    boolean[] excluded = new boolean[numBars];
    bronKerbosch(visited,candidates,excluded,0,new ArrayList<Integer>(),maximalCliques);
    print(maximalCliques);
  }
  
  void bronKerbosch(boolean[] visited,boolean[]candidates,boolean[] excluded,int pivot,ArrayList<Integer> clique, ArrayList<ArrayList<Integer>> maximalCliques){
    boolean noNeighbours = true;
    for(int i =0 ; i < numBars;i++){
      if(!excluded[i] && !candidates[i]){
        pivot = i;
        noNeighbours = false;
      }
    }
    if(noNeighbours){
      maximalCliques.add(new ArrayList<Integer>(clique));
      return;
    }
    
    for(int i = pivot; i < numBars;i++){
      if(!excluded[pivot] && !candidates[i]){
        boolean isClique = true;
        for(int j = 0; j < numBars; j++){
          if(i!=j){
            if(matrix[i][j].anyPropertyTrue() && !candidates[j]){
              isClique = false;
              break;
            }
          }
        }
        if(isClique){
          candidates[i] = true;
          clique.add(i);
          for(int j = 0; j < numBars;j++){
            if(i!=j){
              if(matrix[i][j].anyPropertyTrue()){
                  candidates[j]=true;
              }
            }
          }
          bronKerbosch(visited,candidates,excluded,pivot+1,clique,maximalCliques);
          clique.remove(clique.size()-1);
          candidates[i]=false;
          for(int j = 0; j < numBars;j++){
            if(i!=j){
              if(matrix[i][j].anyPropertyTrue()){
                candidates[j]=false;
              }
            }
          }
          excluded[i]=true;
        }
      }
    }
  }
}


  
