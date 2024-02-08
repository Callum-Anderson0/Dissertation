class Page{
  ArrayList<Bar> bars;
  ArrayList<Group> groups;
  AdjacencyMatrix AM;
  int barHeight;
  
  Page(){
     bars = new ArrayList<Bar>();
  }
  
  ArrayList<Bar> generateRandomBars(int x){ 
    ArrayList<Bar> tempBars = new ArrayList<Bar>();
    for(int i = 0; i < x; i++){
      int random_start = int(random(0,600));
      int random_end = int(random(0,600));
      if(random_end < random_start){
        int temp = random_start;
        random_start = random_end;
        random_end = temp;
      }
      tempBars.add(new Bar(tempBars.size(),random_start,random_end));
    }
    return tempBars;
  }

  void initialiseAM(){
    AM = new AdjacencyMatrix();
    AM.populate(p.bars);
    groups = AM.generateGroups();
  }
  
  void sortGroupsBySize(){
    for(int i = 0; i < groups.size();i++){
      groups.get(i).setSize();
    }
    for(int i = 0; i < groups.size()-1;i++){
      for(int j = 0; j < groups.size()-i-1;j++){
        if(groups.get(j).size < groups.get(j+1).size){
          Group tempGroup = groups.get(j);
          groups.set(j,groups.get(j+1));
          groups.set(j+1,tempGroup);
        }
      }
    }
  }
  
  void displayGroups(){
    for(int i = 0; i < groups.size(); i++){
       groups.get(i).display();
    }
  }
  
  void displayGroup(int index){
    groups.get(index).display();
  }
  
  void colourGroup(int index){
    fill(0,200,200);
    for(int i = 0;i < groups.get(index).members.size(); i++){
      bars.get(groups.get(index).members.get(i)).display();
    }
  }
  
  
  void display(){
    fill(255);
    for(int i = 0;i < bars.size();i++){
      Bar b = bars.get(i);
      b.display();
    }
  }
  
  
}
