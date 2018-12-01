class CardTile extends Tile {
  
  ArrayList<Card> cards;
  
  public CardTile(int X, int Y){
    super(X, Y);
    tileType = "CardTile";
    
    //initialize cards with some cards plz
    //here is where you shall work
  }
  
  Card drawCard(){
    //randomly picks a card
    //removes it
    //returns it
    return cards.get(0);
  }
  
}
