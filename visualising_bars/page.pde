class Page{
  ArrayList<Bar> bars;
  AdjacencyMatrix AM;
  int barHeight;
  
  Page(int tempBH){
     bars = new ArrayList<Bar>();
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
    AM = new AdjacencyMatrix();
  }
  
  
  void display(){
    for(int i = 0;i < bars.size();i++){
      Bar b = bars.get(i);
      b.display(barHeight);
    }
  }
  
  
}
