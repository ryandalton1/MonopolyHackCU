class CardTile extends Tile {
  
  ArrayList<Card> cards;
  
  public CardTile(int X, int Y){
    super(X, Y);
    tileType = TileType.CardTile;
    
    cards = new ArrayList<Card>();
    
    //initialize cards with some cards plz
    //here is where you shall work
    cards.add(new BothCard("Some wayward warm water whooshes you past go. You spot $200 among the coral. Collect it!",200,0));
    cards.add(new BothCard("Some wayward warm water whooshes you past go. You spot $200 among the coral. Collect it!",200,0));
    cards.add(new MoneyCard("Oil spill cleanup causes economic growth! Collect $50 from the bank.",50));
    cards.add(new MoneyCard("Oil spill cleanup causes economic growth! Collect $50 from the bank.",50));
    cards.add(new MoneyCard("Oil spill cleanup causes economic growth! Collect $50 from the bank.",50));
    cards.add(new MoneyCard("A game of sharks and minnows gets out of hand. Pay $25 for every fish owned, and 100 for every shark.",-25));
    cards.add(new MoneyCard("A gang of hungry sharks mugs you on the street for a measly $15. Pay up, buttercup.", -15));
    cards.add(new MoneyCard("A gang of hungry sharks mugs you on the street for a measly $15. Pay up, buttercup.", -15));
    cards.add(new MoneyCard("Hard times have fallen upon your fellow fishermen. Be charitable, you cheap bastard.",-50));
    cards.add(new MoneyCard("Hard times have fallen upon your fellow fishermen. Be charitable, you cheap bastard.",-50));
    cards.add(new MoneyCard("A cargo ship hits an iceberg. You've found the wreckage and goods! Collect $100.",100));
    cards.add(new MoneyCard("A cargo ship hits an iceberg. You've found the wreckage and goods! Collect $100.",100));
    cards.add(new MoneyCard("You found some change in the couch! Collect $1.",1));
    cards.add(new MoneyCard("A whole school of king alaskan salmon gets caught in your net. Collect $500!",500));
    cards.add(new MoneyCard("Millenials are destroying the fish market. Pay $100.",-100));
    cards.add(new MoneyCard("Millenials are destroying the fish market. Pay $100.",-100));
    cards.add(new MoveCard("No fish round these parts! Go to location 6",6));
    cards.add(new MoveCard("I'm dead inside! Go to 10",10));
    cards.add(new MoveCard("Boat's nearly out of gas. Head over to 15 to grab more.",15));
    cards.add(new MoveCard("How's the wallet looking? Pay 20 a visit.",20));
    cards.add(new MoveCard("You've been naughty naughty ;) . Go to jail.", 5));
    cards.add(new MoveCard("Harbors are expensive. Head on over to free parking!", 10));
    cards.add(new MoveCard("You've heard fishing's good at 11. Check it out.",11));
    cards.add(new BothCard("You're kidnapped by pirates. You befriend them and tell them fishing's good at 1. Collect $200 as you pass go.",200,1));
    cards.add(new BothCard("You surf a wave of money to 8",5000,8));
    cards.add(new MoveCard("You get big fisherman gains and accidentally row all the way to 19.",19));
    cards.add(new MoveCard("The sirens call you to 2. You can't resist.",2));

  }
  
  Card drawCard(){
    //randomly picks a card
    int loc = (int) random(cards.size());
    //removes it and returns it
    return cards.remove(loc);
  }
  
}
