class Group{
  int id;
  //ArrayList<Integer> members;
  ArrayList<VBar> members;
  AdjacencyMatrix graph; 
  color c;
  
  Group(int idT,ArrayList<Integer> indices,ArrayList<VBar> allVbars){
    id = idT;
    c = color(random(255),random(255),random(255));
    members = new ArrayList<VBar>();
    
    for(int i = 0; i < indices.size();i++){
      members.add(allVbars.get(indices.get(i)));
    }
    if(members.size() == 1){
      c = color(255);
    }
    groupAnalysis();
    println("Group id:",id);
    textDisplay();
    graph.bronKerboschAlg();
  }
  

  
  void display(){
    for(int i = 0; i < members.size(); i++){
      members.get(i).display(c);
    }
  }
  
  void textDisplay(){
    for(int i = 0;i < members.size();i++){
      for(int j = 0;j < members.size();j++){
        if(i!=j){
          graph.matrix[i][j].displayRelation();
        }
      }
    }
  }
  
  void groupAnalysis(){
    graph = new AdjacencyMatrix(members.size());
    graph.populate(members);    
  }
 
}
