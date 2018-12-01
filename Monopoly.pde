PImage background;

Player[] players;
boolean knowNumPlayers = false;
boolean setNumPlayers = false;

void setup(){
  //background size and color
  size(900, 900);
  background(123);
  
  if(knowNumPlayers){
    for(int i = 0; i< players.length; i++){
      players[i] = new Player();
    }
    setNumPlayers = true;
  }
}


void draw(){
  fill(0);
  
  //before they've selected the number of players
  if( !knowNumPlayers ){
    textSize(50);
    textAlign(CENTER);
    text("How many players? 1-4", width/2, 100);
    textSize(30);
    text("(Use the keyboard)", width/2, 200);
  }
  //after they've selected the number of players
  else if( !setNumPlayers) {
    setup();
   
  //ready to actually play
  } else {
    
    rect(100, 100, 100, 100);
  
  }
}

int roll(){
    return int(random(1,13));
}
