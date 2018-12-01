class Tile {
  
  String tileName;
  String tileType;
  
  ArrayList<Player> whoOn;
  
  //the position of the top left corner
  int x, y;
  //the size
  int size;
  
  public Tile(int X, int Y){
    x = X;
    y = Y;
    size = 100;
    
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
  
  int numHouses;
  int buyCost;
  int placeHouseCost;
  
  //cost of landing on that tile, changes by the number of houses
  int rent, rent1, rent2, rent3, rent4, rentH;
  
  public PropertyTile(int X, int Y, int costIn, int houseCostIn, int r1,int r2,int r3, int r4, int r5, int mortgageIn){
    super(X, Y);
    buyCost = costIn;
    placeHouseCost = houseCostIn;
    rent = r1;
    rent1 = r2;
    rent2 = r3;
    rent3 = r4;
    rent4 = r5;
    mortgagePrice = mortgageIn;
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
  
  public JailTile(int X, int Y){
    super(X, Y);
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
