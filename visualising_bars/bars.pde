class Bar{
  int id,size,start,end;
  
  Bar(int tempId,int tempStart,int tempSize){
    id = tempId;
    size = tempSize;
    start = tempStart;
    end = start+size;
  }
  
  void display(int BH){
    fill(255);
    rect(start,id*BH*2,size,BH);
  }
}
