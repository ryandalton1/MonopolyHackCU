
class Player{
  
  int cash;
  
  String name;
  
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
  }
  
  boolean canKeepPlaying(){
    return cash > 0;
  }
  
  void analyzeTile(){
    if(board[locationIndex].tileType == TileType.TileTile){
      //just a normal tile so don't do anything (free parking, go, regular jail)
    }
    else if(board[locationIndex].tileType == TileType.PropertyTile){
      PropertyTile tile = (PropertyTile) board[locationIndex];
      if(tile.owned){
        tile.owner.cash += tile.RentCost();
        cash -= tile.RentCost();
      }
      else{
        
      }
    }
    else if(board[locationIndex].tileType == TileType.JailTile){
      
    }
    else if(board[locationIndex].tileType == TileType.CardTile){
      
    }
    else if(board[locationIndex].tileType == TileType.JailTile)
    {
      
    }
    //if property
      //if unowned
        //ask if buying
      //if owned
        //pay rent
    //if go to jail
      //go to jail
    //if draw card
      //draw a card
      
    //all of those change turnProgress accordingly
  }
  
  void buyHouse(){
    //change player's money
    //change the progress
  }
  
  void applyCard(Card which){
    //figure this out
  }
  
}
