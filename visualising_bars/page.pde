class Page{
  ArrayList<Bar> Bars;
  AdjacencyMatrix AM;
  int barHeight;
  
  Page(int tempBH){
     Bars = new ArrayList<Bar>();
     barHeight = tempBH;
  }
  
  ArrayList<Bar> generateRandomBars(int x){ 
    ArrayList<Bar> tempBars = new ArrayList<Bar>();
    for(int i = 0; i < x; i++){
      int random_start = int(random(0,600));
      int random_end = random_start + (int)random(0,600-random_start);
      //int random_start = 20;
      tempBars.add(new Bar(tempBars.size(),random_start,random_end));
    }
    return tempBars;
  }

  void initialiseAM(){
    AM = new AdjacencyMatrix(Bars);
  }
  
  
  void display(){
    for(int i = 0;i < Bars.size();i++){
      Bar b = Bars.get(i);
      b.display(barHeight);
    }
  }
  
  
}
