class AdjacencyMatrix{
  int initial_dimension;
  ArrayList<ArrayList<Integer>> matrix;
  
  AdjacencyMatrix(ArrayList<Bar> Bars){
    initial_dimension = Bars.size();
    matrix = new ArrayList<ArrayList<Integer>>();
    for(int i = 0;i<initial_dimension;i++){
      ArrayList<Integer> row = new ArrayList<Integer>();
      matrix.add(row);
    }
  }
  
  void initialize(){
    for(int i = 0;i<initial_dimension;i++){
      ArrayList<Integer> tempRow = new ArrayList<Integer>();
      for(int j = 0;j<initial_dimension;j++){
        tempRow.add(0);
      }
      matrix.add(tempRow);
    }
  }
  
  void display(){
    for(int i = 0;i<initial_dimension;i++){
      println(matrix.get(i));
    }
  }
  
  
  
}
  
