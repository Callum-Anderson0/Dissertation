
class AdjacencyMatrix{
  int numberOfBars;
  int[][] matrix;
  Table altMatrix = new Table();//definately look at this!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Relation[][] Vmatrix;
  
  AdjacencyMatrix(){
    matrix = new int[BARS][BARS];
    Vmatrix = new Relation[BARS][BARS];
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
  
  void cullProperties(String logic){
    for(int i = 0; i < BARS; i++){
      for(int j = 0; j < BARS; j++){
        if(j!=i){
          Vmatrix[i][j].cullProperties(logic);
          Vmatrix[i][j].displayRelation();
        }
      }
    }
  }
}


  
