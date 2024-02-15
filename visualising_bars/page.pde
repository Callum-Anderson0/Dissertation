class Page{
  ArrayList<Bar> bars;
  ArrayList<Group> groups;
  AdjacencyMatrix AM;
  int barHeight;
  int animationIndex = 0;
  
  ArrayList<VBar> vbars;
  
  Page(){
     bars = new ArrayList<Bar>();
     vbars = new ArrayList<VBar>();
     AM = new AdjacencyMatrix();
  }
  
  ArrayList<VBar> generateRandomVBars(int x){
    ArrayList<VBar> tempBars = new ArrayList<VBar>();
    
    for(int i = 0; i < x;i++){
      PVector start = new PVector();
      PVector end = new PVector();
      VBar candidateVBar;
      if(VBAR_GENERATION_STYLE == "TRUE RANDOM"){
        start = new PVector(random(width),random(height));
        end = new PVector(random(width),random(height));
      }
      if(VBAR_GENERATION_STYLE == "EVEN RANDOM"){
        int randomx = (int)random(BAR_MAX_SIZE,width-BAR_MAX_SIZE);
        int randomy = (int)random(BAR_MAX_SIZE,height-BAR_MAX_SIZE);
        start = new PVector(randomx,randomy);
        PVector randomDirection = PVector.random2D();
        int randomSize = int(random(BAR_MIN_SIZE,BAR_MAX_SIZE));
        PVector span = randomDirection.copy().mult(randomSize);
        
        end.set(start.copy().add(span));
        //println(start,span,end);
      }
      candidateVBar = new VBar(i,start,end);
      tempBars.add(candidateVBar);

    }
    return tempBars;
  }
  
  void displayVBars(){
    for(int i = 0 ; i < vbars.size();i++){
      vbars.get(i).display();
    }
  }
  
  ArrayList<Bar> generateRandomBars(int x){ 
    ArrayList<Bar> tempBars = new ArrayList<Bar>();
    int random_start = 0;
    int random_end = 0;
    for(int i = 0; i < x; i++){
      if(BAR_GENERATION_STYLE == "RANDOM SIZE"){
        random_start = int(random(0,600));
        random_end = int(random(0,600));
        if(random_end < random_start){
          int temp = random_start;
          random_start = random_end;
          random_end = temp;
        }
      }
      if(BAR_GENERATION_STYLE == "MAX SIZED BARS"){
        random_start = int(random(0,600));
        int random_length = int(random(0,BAR_MAX_SIZE));
        random_end = random_length + random_start;
      }
      if(BAR_GENERATION_STYLE == "SET SIZE"){
        random_start = int(random(0,600-BAR_SIZE));
        random_end = random_start + BAR_SIZE;
      }
      tempBars.add(new Bar(tempBars.size(),random_start,random_end));
    }
    return tempBars;
  }

  void initialiseAM(){
    AM = new AdjacencyMatrix();
    AM.populate(p.bars);
    //groups = AM.generateGroupsByFrequency();
    groups = AM.generateGroupsBySubTree();
    
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
  
   void sortGroupsByQuality(){
    for(int i = 0; i < groups.size();i++){
      groups.get(i).setQuality();
    }
    for(int i = 0; i < groups.size()-1;i++){
      for(int j = 0; j < groups.size()-i-1;j++){
        if(groups.get(j).quality < groups.get(j+1).quality){
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
    colorMode(HSB);
    fill(random(255),255,255);
    for(int i = 0;i < groups.get(index).members.size(); i++){
      bars.get(groups.get(index).members.get(i)).display();
    }
    colorMode(RGB);
    fill(255);
  }
  

  
  
  void display(){
    colorMode(RGB);
    fill(255);
    for(int i = 0;i < bars.size();i++){
      Bar b = bars.get(i);
      b.display();
    }
  }
  
  void oneDfunctionality(){
    bars = generateRandomBars(BARS);
    display();
    initialiseAM();
    sortGroupsByQuality();
    sortGroupsByQuality();
    displayGroups();
    colourGroup(0);
  }
  
  void oneDanimate(){
   display();
   colourGroup(animationIndex);
   delay(1000);
   animationIndex++;
   if(animationIndex > 10){
      animationIndex = 0;
   }
  }
}
