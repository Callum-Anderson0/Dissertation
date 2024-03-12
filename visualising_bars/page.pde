class Page{
  ArrayList<Group> groups;
  AdjacencyMatrix AM;
  int barHeight;
  int animationIndex = 0;
  
  ArrayList<VBar> vbars;
  
  Page(){
     vbars = new ArrayList<VBar>();
     groups = new ArrayList<Group>();
     AM = new AdjacencyMatrix(BARS);
  }
  
  void generateGroups(){
     ArrayList<ArrayList<Integer>> allGroups = p.AM.defineGroups();
     for(int i = 0; i < allGroups.size();i++){
       groups.add(new Group(i,allGroups.get(i),vbars));
     }
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
      vbars.get(i).display(255);
    }
  }
  
  void displayGroups(){
    for(Group group : groups){
      if(group.members.size()>1){
        group.display();
      }
    }
  }
  
  
  


 
  void saveBarsToCSV(){
    Table save = new Table();
    save.addColumn("id");
    save.addColumn("start.x");
    save.addColumn("start.y");
    save.addColumn("end.x");
    save.addColumn("end.y");
    for(int i=0; i < vbars.size();i++){
      TableRow newRow = save.addRow();
      newRow.setInt("id",i);
      newRow.setInt("start.x",(int)vbars.get(i).start.x);
      newRow.setInt("start.y",(int)vbars.get(i).start.y);
      newRow.setInt("end.x",(int)vbars.get(i).end.x);
      newRow.setInt("end.y",(int)vbars.get(i).end.x);
    }
    String time = getCurrentDateTime();
    String path = "data/bars" + time +".csv";
    saveTable(save,path);
  }
  
  void loadBarsFromCSV(String path){
    Table load = new Table();
    load = loadTable(path,"header");
    for(TableRow row: load.rows()){
      int id = row.getInt("id");
      PVector start = new PVector(row.getInt("start.x"),row.getInt("start.y"));
      PVector end = new PVector(row.getInt("end.x"),row.getInt("end.y"));
      VBar entry = new VBar(id,start,end);
      vbars.add(entry);
    }
  }
  
  String getCurrentDateTime() {
    int year = year();
    int month = month();
    int day = day();
    int hour = hour();
    int minute = minute();
    int second = second();
    
    String dateTime = String.format("%04d-%02d-%02d %02d-%02d-%02d", year, month, day, hour, minute, second);
    return dateTime;
}
}
