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
    char symbol = '0';
    boolean describe = false;

    if(end < other.start){
      if(describe){
        print(id,"left of",other.id,"\n");
        print(other.id,"right of",id,"\n");
      }
      symbol = '1';
    }

    if(end == other.start){
      if(describe){
        print(id,"meets",other.id,"\n");
        print(other.id,"meets",id,"\n");
      }

      symbol = '2';
    }
    if(end > other.start && other.start > start && end < other.end){
      if(describe){
        print(id,"overlaps",other.id,"\n");
        print(other.id,"overlaps",id,"\n");
      }

      symbol = '3';
    }
    if(start > other.start && end < other.end){
       if(describe){
          print(id,"inside",other.id,"\n");
          print(other.id,"encloses",id,"\n");
      }
      symbol = '4';
    }
    if(symbol == '0'){
      char inverse_call = other.compare(this);
      switch(inverse_call){
        case '1':
          symbol = '5';
          break;
        case '2':
          symbol = '6';
          break;
        case '3':
          symbol = '7';
          break;
        case '4':
          symbol = '8';
          break;
      }
    }
    return symbol;
  }
}
