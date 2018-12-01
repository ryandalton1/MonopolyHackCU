
class Tile {
  
  String tileName;
  String tileType;
  
  ArrayList<Player> whoOn;
  
  //the position of the top left corner
  int x, y;
  //the size
  int size;
  
  public Tile(int X, int Y, int Size){
    x = X;
    y = Y;
    size = Size;
    
    whoOn = new ArrayList<Player>();
  }
  
  //draws anything onto the tile that's needed
  void displayExtras(){
    rect(x, y, size, size);
  }
  
  boolean posOnTile(int X, int Y){
    //check if that position is on the tile
    return true;
  }
  
}

class PropertyTile extends Tile {
  
  boolean owned;
  Player owner;
  //if you want, the bank will pay buy the property from you temporarily
  boolean mortgaged;
  int mortgagePrice;
  
  int buyCost;
  int placeHouseCost;
  
  //cost of landing on that tile, changes by the number of houses
  int rent, rent1, rent2, rent3, rent4, rentH;
  
  public PropertyTile(int X, int Y, int Size){
    super(X, Y, Size);
    tileType = "PropertyTile";
  }
  
  void displayExtras(){
    super.displayExtras();
    //draw the bar to show ownership
    //draw the fish and shark
  }
  
}


class JailTile extends Tile {
  
  ArrayList<Integer> indexOfPlayers;
  ArrayList<Integer> turnsWaited;
  
  final int turnsWait = 3;
  
  public JailTile(int X, int Y, int Size){
    super(X, Y, Size);
    indexOfPlayers = new ArrayList<Integer>();
    turnsWaited = new ArrayList<Integer>();
    tileType = "JailTile";
  }
  
  boolean canLeaveJail(int playerIndex){
    //find them
    //if turns waited is big enough
    //remove them from the wait list if they've waited long enough
    return false;
  }
  
  void landInJail(int playerIndex){
    //add them to the list
  }
  
}

class CardTile extends Tile {
  
  ArrayList<Card> cards;
  
  public CardTile(int X, int Y, int Size){
    super(X, Y, Size);
    tileType = "CardTile";
    
    //initialize cards with some cards plz
  }
  
  Card drawCard(){
    //randomly picks a card
    //removes it
    //returns it
    return cards.get(0);
  }
  
}
