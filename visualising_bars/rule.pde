class Rule{
  ArrayList<String> inputVariables;
  ArrayList<String> outputTrue;
  ArrayList<String> outputFalse;
  
  Rule(){
    
  }
  
  String ruleParse(ArrayList<String> symbols){
    if(containsInput(symbol)){
      symbols = removeInput(symbols);
      for(int i = 0; i < outputTrue.size();i++){
        symbols.add(outputTrue.get(i));
      }
    }else{
      for(int i = 0; i < outputFalse;i++){
        symbols.add(outputFalse.get(i));
      }
    }
  }
  
  ArrayList<String> removeInput(ArrayList<String> symbols){
    for(int j = 0; j < inputVariables.size();j++){
      for(int i = symbols.size(); i > -1;i--){
        if(inputVariables.get(j).equals(symbols.get(i))){
          symbols.remove(i);
        }
      }
    }
    return symbols;
  }
  
  boolean containsInput(ArrayList<String> symbols){
    int inputCount = 0;
    for(int j = 0; j < inputVariables.size();j++){
      boolean found = false;
      for(int i = 0; i < symbols.size();i++){
        if(symbols.get(i).equals(inputVariables.get(j))){
          found = true;
      }
      if(found){
        inputCount+=1;
      }
    }
    if(inputCount == inputVaraibles.size()){
      return true;
    }else{
      return false;
    }   
  }
  
  
}
