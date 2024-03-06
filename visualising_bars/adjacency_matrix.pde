import java.util.Collections;
class AdjacencyMatrix{
  int numberOfBars;
  Relation[][] matrix;
  
  AdjacencyMatrix(){
    matrix = new Relation[BARS][BARS];
  }
  
  void Populate(ArrayList<VBar> vbars){
    for(int i = 0; i < BARS; i++){
      for(int j = i; j < BARS; j++){
        if(j!=i){
          Relation entry = new Relation();
          entry.compare(vbars.get(i),vbars.get(j));
          matrix[i][j] = entry;
          matrix[j][i] = entry.inverse();
        }
      }
    }
  }
  
  void update(){
    for(int i = 0; i < BARS; i++){
      for(int j = 0; j < BARS; j++){
        if(j!=i){
          matrix[i][j].selfParse(RULES);
        }
      }
    }
  }
  
  ArrayList<ArrayList<Integer>> defineGroups(){
    ArrayList<ArrayList<Integer>> potentialGroups = new ArrayList<ArrayList<Integer>>();
    for(int i = 0; i < BARS;i++){
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
      ArrayList<Integer> neighbours = findNeighbours(current_node);
      for(int i = 0; i < neighbours.size();i++){
        if(!contains(Visited,neighbours.get(i))){
          Queue.add(neighbours.get(i));
          Visited.add(neighbours.get(i));
        }
        
      }
    }
    return Visited;
  }

   
        
  ArrayList<Integer> findNeighbours(int id){
    ArrayList<Integer> neighbours = new ArrayList<Integer>();
    for(int i = 0; i < BARS; i++){
      if(id!=i){;
        for(int j = 0; j < matrix[id][i].properties.size();j++){
          if(matrix[id][i].properties.get(j).value == true){
            neighbours.add(i);
            j = matrix[id][i].properties.size();
          }
        }
      }
    }
    return neighbours;
  }
}


  
