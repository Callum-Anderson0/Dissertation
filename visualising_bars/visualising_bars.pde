Page p;
int BARS = 10;
void setup(){
 size(600,600); 
 background(0);
 p = new Page(20);
 p.bars = p.generateRandomBars(BARS);
 background(0);
 p.display();
 p.initialiseAM();
 p.AM.populate(p.bars);
 p.AM.display();
}
