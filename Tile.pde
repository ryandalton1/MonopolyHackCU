public enum TileType
{
  PropertyTile,
  TileTile,
  JailTile,
  CardTile,
}


class Tile {
  
  String tileName;
  TileType tileType;
  
  //the position of the top left corner
  int x, y;
  //the size
  int size;
  
  public Tile(int X, int Y){
    x = X;
    y = Y;
    size = 105;
    tileType = TileType.TileTile;
  }
  
  //draws anything onto the tile that's needed
  void displayExtras(){
    stroke(255);
    noFill();
    strokeWeight(1);
    //rect(x, y, size, size);
  }
  
  boolean posOnTile(int X, int Y){
    return (X > x && X < x + size) && (Y > y && Y < y + 100);
  }
  
}

class PropertyTile extends Tile {
  boolean owned;
  Player owner;
  //if you want, the bank will pay buy the property from you temporarily
  boolean mortgaged;
  int mortgagePrice;
  
  int numHouses;
  public int buyCost;
  int placeHouseCost;
  
  //cost of landing on that tile, changes by the number of houses
  //int rent, rent1, rent2, rent3, rent4, rentH;
  int[] rent = new int[6];
  
  public PropertyTile(int X, int Y, int costIn, int houseCostIn, int nh,int h1,int h2, int h3, int h4,int hotel, int mortgageIn){ //nhc: cost with no houses, h{n}: cost with n houses, hotel: cost with hotel
    super(X, Y);
    buyCost = costIn;
    placeHouseCost = houseCostIn;
    rent[0] = nh;
    rent[1] = h1;
    rent[2] = h2;
    rent[3] = h3;
    rent[4] = h4;
    rent[5] = hotel;
    mortgagePrice = mortgageIn;
    tileType = TileType.PropertyTile;
  }
  
  public int RentCost()
  {
    return rent[numHouses];
  }
  
  public void addHousingType()
  {
    this.numHouses++;
  }
  
  void displayExtras(){
    super.displayExtras();
    if( owner != null){
      //draw the bar to show ownership
      fill(playerColors[owner.playerIndex]);
      stroke(255);
      strokeWeight(2);
      rect(x, y+size-10, size, 10);
      //draw the fish and shark
      //if( numHouses == 5){
        //draw the shark
      //} else {
        for(int i = 0; i< numHouses; i++){
          //draw the fish
          image(houseShapes[owner.playerIndex], x + i*20, y+size-50);
        }
      //}
    }
  }
  
}


class JailTile extends Tile {
  
  ArrayList<Integer> indexOfPlayers;
  int[] turnsWaitedForPlayerIndex = new int[4];
  int jailPosition;
  
  final int turnsWait = 2;
  
  public JailTile(int X, int Y, int jailPosIn){
    super(X, Y);
    jailPosition = jailPosIn;
    indexOfPlayers = new ArrayList<Integer>();
    tileType = TileType.JailTile;
  }
  
  public void incTurnsWaited(int playerIndex)
  {
    turnsWaitedForPlayerIndex[playerIndex]++;
  }
  
  public boolean canLeaveJail(int playerIndex){
    return turnsWaitedForPlayerIndex[playerIndex] >= turnsWait;
  }
  
  void landInJail(int playerIndex){
    turnsWaitedForPlayerIndex[playerIndex] = 0;
    players[playerIndex].locationIndex = jailPosition;
  }
  
}
