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
  board[0] = new Tile(138,138,100); //go spot
  board[1] = new PropertyTile(238,138,100);
  
  board[2] = new PropertyTile(338,138,100);
  board[3] = new PropertyTile(438,138,100);
  board[4] = new PropertyTile(538,138,100);
  board[5] = new JailTile(638,138,100); //jail
  board[6] = new PropertyTile((638,238,100);
  board[7] = new CardTile((638,338,100); //draw card
  board[8] = new PropertyTile(638,438,100);
  board[9] = new PropertyTile(638,538,100);
  board[10] = new Tile((638,638,100); //free parking
  board[11] = new PropertyTile(538,638,100);
  board[12] = new PropertyTile(438,638,100);
  board[13] = new PropertyTile(338,638,100);
  board[14] = new PropertyTile(238,638,100);
  board[15] = new JailTile(138,638,100); //go to jail
  board[16] = new PropertyTile(138,538,100);
  board[17] = new CardTile(138,438,100); //draw card
  board[18] = new PropertyTile(138,338,100);
  board[19] = new PropertyTile(138,238,100);
  
  
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
    
    //if( currPlayer.doneWithTurn ){
      currPlayerIndex = (currPlayerIndex + 1) % players.length ;
      currPlayer = players[currPlayerIndex];
    //}
  
  }
}
