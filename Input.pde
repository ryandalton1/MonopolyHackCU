

void mouseClicked(){
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
  }
}
