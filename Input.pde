void mouseClicked(){
  //make sure the game is set up
  //make sure they are in the house placing part of the turn
  if( setNumPlayers && currPlayer.turnProgress == 3){
    //check every tile
    for(int i = 0; i< board.length; i++){
      //make sure it's a property tile
      //check if they clicked on this tile
      if(  board[i].tileType == TileType.PropertyTile &&
           ((PropertyTile) board[i]).owner == currPlayer &&
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
           //check if they should just end their turn now
           if( currPlayer.hasOpenProperties() ){
             currPlayer.turnProgress = 2;
           } else {
             currPlayer.endTurn();
           }
         }
      }
    }
  }
}


void keyPressed(){
  if( !knowNumPlayers ){
    int numPlayers = 0;
    switch(key){
      case '1': numPlayers = 1; break;
      case '2': numPlayers = 2; break;
      case '3': numPlayers = 3; break;
      case '4': numPlayers = 4; break;
    }
    if( numPlayers != 0 ){
      players = new Player[numPlayers];
      println("There are " + players.length + " players.");
      knowNumPlayers = true;
    }
  } else if( setNumPlayers) {
    switch(currPlayer.turnProgress){
      case 0:
                if(currPlayer.IsInJail()) //don't let them do anything if in jail
                {
                  currPlayer.IncJailTime();
                  //increase their progress
                  currPlayer.turnProgress = 4;
                  //change the player to the next player
                  currPlayerIndex = (currPlayerIndex + 1 ) % players.length;
                  currPlayer = players[currPlayerIndex];
                  //set the next player's progress to 0
                  currPlayer.turnProgress = 0;
                }
                else if(key == ' ' && !currPlayer.movingPiece()) 
                  currPlayer.rollDie(); 
                break;
      case 1:
                //make sure they are on a property tile
                Tile blankTile = board[currPlayer.locationIndex];
                if( blankTile.tileType == TileType.PropertyTile){
                  //if the current player's tile is unowned
                  PropertyTile tile = (PropertyTile) blankTile;
                  if( !tile.owned ){
                    //and hit y
                    if(key == 'y'){
                      //buy the property
                      currPlayer.properties.add(tile);
                      tile.owned = true;
                      tile.owner = currPlayer;
                      currPlayer.turnProgress = 2;
                    }
                    else if(key == 'n'){ //hit n
                      //end roll
                      if(currPlayer.properties.size() > 0){
                        currPlayer.turnProgress = 2;
                      } else {
                        currPlayer.endTurn();
                      }
                    }
                  }
                } else {
                  //check if they should just end their turn now
                  if( currPlayer.hasOpenProperties() ){
                    currPlayer.turnProgress = 2;
                  } else {
                    currPlayer.endTurn();
                  }
                }
                break;
      case 2:
                //make sure they have properties
                if( currPlayer.hasOpenProperties() ){
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
                } else {
                  currPlayer.endTurn();
                }
                break;
      case 4:
                //any key is pressed to continue
                currPlayer.endTurn();
                break;
    }
  
    
  }
}
