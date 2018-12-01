color[] playerColors = { color(0, 0, 127), color(255, 85, 127), color(255, 170, 0), color(0, 170, 255) };

void mouseClicked(){
  //make sure the game is set up
  //make sure they are in the house placing part of the turn
  if( setNumPlayers && currPlayer.turnProgress == 3){
    //check every tile
    for(int i = 0; i< board.length; i++){
      //make sure it's a property tile
      //check if they clicked on this tile
      if(  board[i].tileType.equals("PropertyTile") &&
           board[i].posOnTile(mouseX, mouseY) ){
         //pull out the tile
         PropertyTile tile = (PropertyTile) board[i];
         //make sure there is space for a house
         //check if they have the money
         if( tile.numHouses < 5 &&
           currPlayer.cash > tile.placeHouseCost){
           //change tile's house values
           tile.numHouses++;
           //subtract the money
           currPlayer.cash -= tile.placeHouseCost;
           //change turnProgress
           currPlayer.turnProgress = 2;
         }
      }
    }
  }
  println("mouse is at " + mouseX + " " + mouseY);
}


void keyPressed(){
  if( !knowNumPlayers ){
    switch(key){
      case '1': players = new Player[1]; knowNumPlayers = true; break;
      case '2': players = new Player[2]; knowNumPlayers = true; break;
      case '3': players = new Player[3]; knowNumPlayers = true; break;
      case '4': players = new Player[4]; knowNumPlayers = true; break;
    }
  } else if( setNumPlayers) {
    switch(currPlayer.turnProgress){
      case 0:
                if(key == ' ') currPlayer.rollDie(); break;
      case 1:
                //make sure they are on a property tile
                Tile blankTile = board[currPlayer.locationIndex];
                if( blankTile.tileType.equals("PropertyTile")){
                  //if the current player's tile is unowned
                  PropertyTile tile = (PropertyTile) blankTile;
                  if( !tile.owned ){
                    //and hit y
                    if(key == 'y'){
                      //buy the property
                      currPlayer.properties.add(tile);
                    }
                    else if(key == 'n'){ //hit n
                      //end roll
                      currPlayer.turnProgress = 2;
                    }
                  }
                } else {
                  currPlayer.turnProgress = 3;
                }
                break;
      case 2:
                //make sure they have properties
                if( currPlayer.properties.size() > 0 ){
                  if( key == 'b' ){
                    currPlayer.buyHouse();
                  } else if( key == 'q'){
                    //increase their progress
                    currPlayer.turnProgress = 4;
                    //change the player to the next player
                    currPlayerIndex = (currPlayerIndex + 1 ) % players.length;
                    currPlayer = players[currPlayerIndex];
                    //set the next player's progress to 0
                    currPlayer.turnProgress = 0;
                  }
                }
    }
  
    
  }
}
