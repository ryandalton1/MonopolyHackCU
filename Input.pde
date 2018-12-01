

void mouseClicked(){
  if( currPlayer.turnProgress == 3){
    //loop through all of the tiles
    //when it finds one that's correct, stop
      //change tile's house values
      //change turnProgress
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
                //if the current player's tile is unowned
                  //and hit y
                    //buy the property
                  //and hit n
                    //end roll
                break;
      case 2:
                //if b
                  //currPlayer.buyHouse();
                //if q
                  //change turnProgress to 4
                  //change the player to the next player
                  //set the next player's progress to 0
    }
  
    
  }
}
