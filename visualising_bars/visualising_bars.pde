


Page p;
void setup(){
 size(600,600); 
 background(0);
 p = new Page(20);
 p.Bars = p.generateRandomBars(10);
 

}



void draw(){
  background(0);
  p.display();
}
  
