abstract class Card {
  
  String description;
  
  public Card(String desc){
    description = desc;
  }
    
}

class MoneyCard extends Card {
  
  int moneyChange;
  
  public MoneyCard(String desc, int money){
    super(desc);
    moneyChange = money;
  }
  
}

class MoveCard extends Card {
  
  int moveTo;
  
  public MoveCard(String desc, int moveLoc){
    super(desc);
    moveTo = moveLoc;
  }
  
}
class BothCard extends Card {
  int moneyChange;
  int moveTo;
  public BothCard(String desc, int money, int moveLoc){
    super(desc);
    moveTo = moveLoc;
    moneyChange = money;
  }

}
