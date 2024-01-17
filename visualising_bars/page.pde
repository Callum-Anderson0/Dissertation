class Page{
  ArrayList<Bar> Bars;
  int barHeight;
  
  Page(int tempBH){
     Bars = new ArrayList<Bar>();
     Bars = generateRandomBars(30);
     barHeight = tempBH;
  }
  
  ArrayList<Bar> generateRandomBars(int x){ 
    ArrayList<Bar> tempBars = new ArrayList<Bar>();
    for(int i = 0; i < x; i++){
      int random_start = int(random(0,600));
      int random_size = (int)random(0,600-random_start);
      tempBars.add(new Bar(tempBars.size(),random_start,random_size));
    }
    return tempBars;
  }

  
  void display(){
    for(int i = 0;i < Bars.size();i++){
      Bar b = Bars.get(i);
      b.display(barHeight);
    }
  }
}
  
