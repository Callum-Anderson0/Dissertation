class AdjacencyMatrix{
  int elements;
  char[][] matrix;
  
  AdjacencyMatrix(ArrayList<Bar> Bars){
    elements = Bars.size();
    matrix = new char[elements][elements];
    Populate();
    //Display();
  }
  
  void Populate(){
    for(int i = 0; i < elements;i++){
      for(int j = 0; j < elements;j++){
        matrix[i][j] = '0';
      }
    }

  }

  void Display(){
    for(int i = 0; i < elements;i++){
      for(int j = 0; j < elements;j++){
        print("(",i,",",j,"):",matrix[i][j]);
      }
      print("\n");
    }
  }

}
  
