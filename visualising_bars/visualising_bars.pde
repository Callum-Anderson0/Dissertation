Page p;
int bars = 2;
void setup(){
 size(600,600); 
 background(0);
 p = new Page(20);
 p.Bars = p.generateRandomBars(bars);
 background(0);
 p.display();
 p.initialiseAM();
 for(int i = 1; i < bars; i++){
   p.Bars.get(0).compare(p.Bars.get(i));
 }
}
