class Rule{
  ArrayList<String> inputVariables;
  ArrayList<String> outputTrue;
  ArrayList<String> outputFalse;
  boolean not;
  
  Rule(String input,String outputT,String outputF,boolean notT){
    not = notT;
    inputVariables = new ArrayList<String>();
    outputTrue = new ArrayList<String>();
    outputFalse = new ArrayList<String>();
    for(int i = 0; i < input.length();i++){
      inputVariables.add(str(input.charAt(i)));
    }
    for(int i = 0; i < outputT.length();i++){
      outputTrue.add(str(outputT.charAt(i)));
    }
    for(int i = 0; i < outputF.length();i++){
      outputFalse.add(str(outputF.charAt(i)));
    }
  }
  
  
  
  ArrayList<String> ruleParse(ArrayList<String> symbols){
    if(not == false){
      if(containsInput(symbols)){
        symbols = removeInput(symbols);
        for(int i = 0; i < outputTrue.size();i++){
          symbols.add(outputTrue.get(i));
        }
      }else{
        for(int i = 0; i < outputFalse.size();i++){
          symbols.add(outputFalse.get(i));
        }
      }
      return symbols;
    }else{
      if(containsInput(symbols)){
        for(int i = 0; i < outputFalse.size();i++){
          symbols.add(outputFalse.get(i));
        }
      }else{
        for(int i = 0; i < outputTrue.size();i++){
          symbols.add(outputTrue.get(i));
        }
      }
      return symbols;
    }
  }
  
  ArrayList<String> removeInput(ArrayList<String> symbols){
    for(int j = 0; j < inputVariables.size();j++){
      for(int i = symbols.size()-1; i > -1;i--){
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
      }
      if(found){
        inputCount+=1;
      }
    }
    if(inputCount == inputVariables.size()){
      return true;
    }else{
      return false;
    }   
    
  }
}
