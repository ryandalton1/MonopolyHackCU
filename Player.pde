
class Player{
  
  int cash;
  
  String name;
  public int playerIndex;
  
  //where they are
  int locationIndex;
  
  ArrayList<PropertyTile> properties;
  
  //reference to where they currently are
  int currOnIndex;
  
  //0 is starting turn (asking if want to roll)
  //1 is doing the action of the tile they landed on
  //2 is buying and placing houses
  //3 currently placing a house
  //4 means it should move to the next player
  int turnProgress;
  
  PImage sprite;
  
  public Player(String spriteFile){
    cash = 1500;
    locationIndex = 0;
    
    properties = new ArrayList<PropertyTile>();
    
    turnProgress = 0;
    
    sprite = loadImage(spriteFile);
  }
  
  void buyProperty(PropertyTile which){
    //reduce money
    //change the values for which
    which.owned = true;
    which.owner = this;
    which.mortgaged = false;
    cash -= which.buyCost;
    which.numHouses = 0;
    properties.add(which);
    //display a bar on the property showing new ownership TO-DO
  }
  
  void rollDie(){
    int roll = (int) (random(6) + 1);
    locationIndex += roll;
    locationIndex %= NUM_TILES;
    
    turnProgress = 1;
    
    analyzeTile();
  }
  
  void display(int which){
    //display the player at the tile's postions
    image(sprite, board[locationIndex].x+ which* 20 + 5, board[locationIndex].y + 20, 35, 35);
    //display their data
    displayData(which);
  }
  
  void displayData(int which){
    int x = 100;
    int y = 100;
    boolean vert = false;
    switch(which){
      case 0: x = 240; y=60; vert = false; break;
      case 1: x = 774; y = 260; vert = true; break;
      case 2: x = 240; y = 780; vert = false; break;
      case 3: x = 65; y = 260; vert = true; break;
      case 4: break;
    }
    noFill();
    stroke(0);
    strokeWeight(2);
    
    //transform to draw it;
    pushMatrix();
    translate(x, y);
    if(vert){ rotate(HALF_PI); translate(0, -60);}
    rect(0, 0, 400, 60);
    popMatrix();
  }
  
  boolean canKeepPlaying(){
    return cash > 0;
  }
  
  void analyzeTile(){
    if(board[locationIndex].tileType == TileType.TileTile){
      //just a normal tile so don't do anything (free parking, go, regular jail)
      turnProgress = 2;
    }
    else if(board[locationIndex].tileType == TileType.PropertyTile){
      PropertyTile tile = (PropertyTile) board[locationIndex];
      if(tile.owned){
        tile.owner.cash += tile.RentCost();
        cash -= tile.RentCost();
        turnProgress = 2;
      }
    }
    else if(board[locationIndex].tileType == TileType.JailTile){
      ((JailTile)board[locationIndex]).landInJail(playerIndex);
      endTurn();
    }
    else if(board[locationIndex].tileType == TileType.CardTile){
      Card drawn = ( (CardTile) board[locationIndex]).drawCard();
      println(drawn.description);
      if(drawn.type == CardType.MoneyCard){
        cash += ((MoneyCard) drawn).moneyChange;
      }
      if(drawn.type == CardType.MoveCard){
        locationIndex = ((MoveCard) drawn).moveTo;
      }
      if(drawn.type == CardType.BothCard){
        cash += ((BothCard) drawn).moneyChange;
        locationIndex = ((BothCard) drawn).moveTo;
      }
      endTurn();
    }
  }
  
  void endTurn(){
    turnProgress = 4;
    //change the player to the next player
    currPlayerIndex = (currPlayerIndex + 1 ) % players.length;
    currPlayer = players[currPlayerIndex];
    //set the next player's progress to 0
    currPlayer.turnProgress = 0;
  }
  
  void buyHouse(){
    //change player's money
    cash -= ((PropertyTile)board[1]).placeHouseCost;
    //change the progress
    turnProgress = 3;
  }
  
  void applyCard(Card which){
    //figure this out
  }
  
  public boolean IsInJail()
  {
    if(board[locationIndex].tileType == TileType.JailTile)
    {
      JailTile jt = (JailTile)board[locationIndex];
      return jt.canLeaveJail(playerIndex);
    }
    return false;
  }
  
  public void IncJailTime()
  {
    if(board[locationIndex].tileType == TileType.JailTile)
    {
      JailTile jt = (JailTile)board[locationIndex];
      jt.incTurnsWaited(playerIndex);
    }
  }
  
  public void SetPlayerIndex(int index)
  {
    playerIndex = index;
  }
  
  boolean hasOpenProperties(){
    //check all of the properties
    for(int i = 0; i< properties.size(); i++){
      //if you find any with space, return true
      if( properties.get(i).numHouses < 5){
        return true;
      }
    }
    //nothing was found
    return false;
  }
  
}
