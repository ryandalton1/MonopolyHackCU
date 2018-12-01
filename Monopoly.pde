PImage background;

Player[] players;
boolean knowNumPlayers = false;
boolean setNumPlayers = false;

final int NUM_TILES = 20;
Tile[] board = new Tile[NUM_TILES];

int currPlayerIndex;
Player currPlayer = null;



void setup(){
  //background size and color
  background = loadImage("monopoly board.png");
  size(900, 900);
  background(123);
  
  currPlayerIndex = 0;
  
  //set up the tiles
  for(int i = 0; i< board.length; i++){
    //board[i] = new Tile();
    //give them a position
  }
  
  
  //set up the number of players
  if(knowNumPlayers){
    for(int i = 0; i< players.length; i++){
      players[i] = new Player();
    }
    setNumPlayers = true;
    currPlayer = players[currPlayerIndex];
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
    
    background(background);
    rect(100, 100, 100, 100);
    
    //if( currPlayer.doneWithTurn ){
      currPlayerIndex = (currPlayerIndex + 1) % players.length ;
      currPlayer = players[currPlayerIndex];
    //}
  
  }
}
