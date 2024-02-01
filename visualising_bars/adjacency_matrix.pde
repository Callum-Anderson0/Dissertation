class AdjacencyMatrix{
  int numberOfBars;
  char[][] matrix;
  
  AdjacencyMatrix(){
    matrix = new char[BARS][BARS];
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
}
  
