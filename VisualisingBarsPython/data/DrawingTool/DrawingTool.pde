
boolean SE = false;
ArrayList<Point> Points;
PVector startp;
PImage background;
PVector endp;

class Point{
  PVector start;
  PVector end;
  
  Point(PVector tempS, PVector tempE){
    start = tempS;
    end = tempE;
  }
}

void setup(){
  size(800,800);
  stroke(255,0,0);
  strokeWeight(1);
  Points = new ArrayList<Point>();
  background = loadImage("background.png");
  background(0);
  background.resize(0,800);
  image(background,0,0);
}

void draw(){  
  for(int i = 0; i < Points.size();i++){
    Point p = Points.get(i);
    line(p.start.x, p.start.y, p.end.x, p.end.y);
  }
}
void keyPressed(){
  saveToCSV();
}

void mousePressed(){
   startp = new PVector(mouseX,mouseY);
}
void mouseReleased(){
  endp = new PVector(mouseX,mouseY);
  print(startp,endp);
  Points.add(new Point(startp,endp));
}

void saveToCSV(){
    Table save = new Table();
    save.addColumn("id");
    save.addColumn("start.x");
    save.addColumn("start.y");
    save.addColumn("end.x");
    save.addColumn("end.y");
    for(int i=0; i < Points.size();i++){
      TableRow newRow = save.addRow();
      newRow.setInt("id",i);
      newRow.setInt("start.x",(int)Points.get(i).start.x);
      newRow.setInt("start.y",(int)Points.get(i).start.y);
      newRow.setInt("end.x",(int)Points.get(i).end.x);
      newRow.setInt("end.y",(int)Points.get(i).end.y);
    }
    int identifier = int(random(255));
    saveTable(save,"drawing" + str(identifier) + ".csv");
  }
