Page p;
int bars = 5;
void setup(){
 size(600,600); 
 background(0);
 p = new Page(20);
 p.Bars = p.generateRandomBars(bars);
 background(0);
 p.display();
 p.initialiseAM();
 for(int i = 0; i < bars; i++){
   for(int j = i; j < bars; j++){
     if(j != i){
          p.Bars.get(i).compare(p.Bars.get(j));
     }
 }
 }
}
