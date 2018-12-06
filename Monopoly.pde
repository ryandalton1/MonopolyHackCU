color[] playerColors = { color(0, 0, 127), color(255, 85, 127), color(255, 170, 0), color(0, 170, 255) };

PImage background;

final int timeWait = 50;
int timer = timeWait;

Player[] players;
boolean knowNumPlayers = false;
boolean setNumPlayers = false;

final int NUM_TILES = 20;
Tile[] board = new Tile[NUM_TILES];

int currPlayerIndex;
Player currPlayer = null;

PImage[] houseShapes;

Card lastCard;

void setup(){
  //background size and color
  background = loadImage("Images/board.png");
  size(900, 900);
  background(123);
  
  currPlayerIndex = 0;
  
  //set up the tiles
  board[0] = new Tile(133,138); //go spot
  board[1] = new CardTile(238,138);//PropertyTile(238,138,70,50,4,20,60,180,320,450,40);
  board[2] = new PropertyTile(343,138,70,50,4,20,60,180,320,450,40);
  board[3] = new PropertyTile(448,138,80,50,6,30,80,200,340,500,60);
  board[4] = new PropertyTile(553,138,110,50,8,40,100,300,500,650,60);
  board[5] = new JailTile(653,138,5); //jail
  board[6] = new PropertyTile(653,238,110,50,8,40,100,300,500,650,60);
  board[7] = new CardTile(653,343); //draw card
  board[8] = new PropertyTile(653,448,150,100,14,70,200,550,750,950,90);
  board[9] = new PropertyTile(653,553,150,100,14,70,200,550,750,950,90);
  board[10] = new Tile(653,653); //free parking
  board[11] = new PropertyTile(548,653,200,100,18,90,250,700,875,1050,110);
  board[12] = new PropertyTile(443,653,200,100,18,90,250,700,875,1050,110);
  board[13] = new CardTile(343,653);//PropertyTile(343,653,210,100,20,100,270,700,890,1070,120);
  board[14] = new PropertyTile(238,653,270,150,24,120,360,850,1025,1200,140);
  board[15] = new JailTile(133,653,5); //go to jail
  board[16] = new PropertyTile(138,553,270,150,24,120,360,850,1025,1200,140);
  board[17] = new CardTile(138,448); //draw card
  board[18] = new PropertyTile(138,343,330,150,28,150,450,1000,1200,1400,160);
  board[19] = new PropertyTile(138,238,330,150,28,150,450,1000,1200,1400,160);
  
  //add cards to the card tiles
  ((CardTile)board[1]).addCards();
  ((CardTile)board[7]).addCards();
  ((CardTile)board[13]).addCards();
  ((CardTile)board[17]).addCards();
  
  //to bypass the player asking
//println("Remember to remove this");
//  players = new Player[4];
//  knowNumPlayers = true;
  
  //set up the number of players
  if(knowNumPlayers){
    for(int i = 0; i< players.length; i++){
      players[i] = new Player("Images/playerOutline" + i + ".png");
      players[i].playerIndex = i;
    }
    setNumPlayers = true;
    currPlayerIndex = (int) random(players.length);
    currPlayer = players[currPlayerIndex];
    
    houseShapes = new PImage[players.length];
    
    //load in the house images
    for(int i = 0; i< players.length; i++){
      houseShapes[i] = loadImage("Images/fishOutline" + i + ".png");
    }
  }
}


void draw(){
  fill(0);
  
  //before they've selected the number of players
  if( !knowNumPlayers ){
    background(123, 123, 170);
    textSize(50);
    textAlign(CENTER);
    text("How many players? 1-4", width/2, 100);
    textSize(30);
    text("(Use the keyboard)", width/2, 200);
    text("(You may have to click on the window first)", width/2, 300);
  }
  //after they've selected the number of players
  else if( !setNumPlayers) {
    setup();
   
  //ready to actually play
  } else {
    
    //animate player motion
    if( currPlayer.movingPiece() ){
      if(timer <= 0){ //when the time runs out, indicating it should move
        //reset the timer
        timer = timeWait;
        //move it foreward one
        currPlayer.locationIndex ++;
        //check if it's on go
        if( currPlayer.locationIndex == 0 || currPlayer.locationIndex == 20){
          currPlayer.cash += 200;
        }
        //check if it's made it to the right spot
        if( currPlayer.destinationIndex == currPlayer.locationIndex ){
          currPlayer.turnProgress = 1;
          currPlayer.analyzeTile();
        }
      // the timer has not run out yet
      } else {
        timer--;
      }
    }
    
    //draw the background in the back
    background(background);
    
    //draw the tile extras
    for(int i = 0; i< board.length; i++){
      board[i].displayExtras();
    }
    
    //draw the players on top of that
    for(int i = 0; i< players.length; i++){
      players[i].display(i);
    }
    
    fill(playerColors[currPlayerIndex]);
    textSize(50);
    //displaying the stuff to tell the player what to do
    if( currPlayer.turnProgress == 0){
      text("Press space to roll a die", width/2 - 200, height/2 - 200, 400, 400);
    } else if( currPlayer.turnProgress == 1) {
      text("Do you want to buy this property? Y/N", width/2 - 200, height/2 - 200, 400, 400);
    } else if( currPlayer.turnProgress == 2) {
      text("Do you want to buy a fish? B to buy, Q to quit", width/2 - 200, height/2 - 200, 400, 400);
    } else if( currPlayer.turnProgress == 3) {
      image(houseShapes[currPlayerIndex], mouseX, mouseY);
    } else if( currPlayer.turnProgress == 4) {
      textSize(30);
      text(lastCard.description, width/2 - 200, height/2 - 200, 400, 200);
      text("Press any key to continue", width/2 - 200, height/2+75, 400, 200);
    }
  }
  
  
}
