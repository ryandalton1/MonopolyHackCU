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
  board[0] = new Tile(138,138); //go spot
  board[1] = new PropertyTile(238,138,70,50,4,20,60,180,320,450,40);
  board[2] = new PropertyTile(338,138,70,50,4,20,60,180,320,450,40);
  board[3] = new PropertyTile(438,138,80,50,6,30,80,200,340,500,60);
  board[4] = new PropertyTile(538,138,110,50,8,40,100,300,500,650,60);
  board[5] = new JailTile(638,138,5); //jail
  board[6] = new PropertyTile(638,238,110,50,8,40,100,300,500,650,60);
  board[7] = new CardTile(638,338); //draw card
  board[8] = new PropertyTile(638,438,150,100,14,70,200,550,750,950,90);
  board[9] = new PropertyTile(638,538,150,100,14,70,200,550,750,950,90);
  board[10] = new Tile(638,638); //free parking
  board[11] = new PropertyTile(538,638,200,100,18,90,250,700,875,1050,110);
  board[12] = new PropertyTile(438,638,200,100,18,90,250,700,875,1050,110);
  board[13] = new PropertyTile(338,638,210,100,20,100,270,700,890,1070,120);
  board[14] = new PropertyTile(238,638,270,150,24,120,360,850,1025,1200,140);
  board[15] = new JailTile(138,638,5); //go to jail
  board[16] = new PropertyTile(138,538,270,150,24,120,360,850,1025,1200,140);
  board[17] = new CardTile(138,438); //draw card
  board[18] = new PropertyTile(138,338,330,150,28,150,450,1000,1200,1400,160);
  board[19] = new PropertyTile(138,238,330,150,28,150,450,1000,1200,1400,160);
  
  
  //set up the number of players
  if(knowNumPlayers){
    for(int i = 0; i< players.length; i++){
      players[i] = new Player("player" + (i+1) + ".png");
      players[i].playerIndex = i;
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
    
    for(int i = 0; i< players.length; i++){
      players[i].display(i);
    }
    
    //displaying the stuff to tell the player what to do
    if( currPlayer.turnProgress == 0){
      textSize(50);
      text("Press space to roll a die", width/2, height/2);
    } else if( currPlayer.turnProgress == 1) {
      text("Do you want to buy this property? B to buy or Q to quit", width/2, height/2);
    } 
  
  }
}
