



void setup(){
 size(600,600); 
 background(0);
 Page p = new Page(20);
 p.bars = p.generateRandomBars(10);
 

}



void draw(){
  background(0);
  p.display();
}
  
