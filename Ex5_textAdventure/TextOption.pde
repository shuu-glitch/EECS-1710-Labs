class TextOption {
  // represents an option the player can select
  String text;
  int nextState;
  
  TextOption(String initText, int initNextState) {
    // initialize the text and the next state after an option is chosen
    text = initText;
    nextState = initNextState;
  }
}
