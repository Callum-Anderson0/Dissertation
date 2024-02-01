class Bar{
  int id,size,start,end;
  
  Bar(int tempId,int tempStart,int tempEnd){
    id = tempId;
    start = tempStart;
    end = tempEnd;
    size=tempEnd-tempStart;
  }
  
  void display(int BH){
    fill(255);
    rect(start,id*BH*2,size,BH);
  }
  
  char compare(Bar other){
    char symbol = 'n';
    print(start,end,other.start,other.end,"\n");

    if(end < other.start){
      print(id,"left of",other.id,"\n");
      symbol = '1';
    }
    if(other.end < start){
      print(id,"right",other.id,"\n");
      symbol='4';
    }
    if(end == other.start){
      print(id,"meets",other.id,"\n");
      symbol = '2';
    }
    if(end > other.start && other.start > start && end < other.end){
      print(id,"overlaps",other.id,"(with unoverlapped bit at the begginning of the interval)\n");
      symbol = '3';
    }
    if(start < other.start && end > other.end){
      print(id,"encloses",other.id,"\n");
      symbol = '4';
    }
    
    return symbol;
  }
}
