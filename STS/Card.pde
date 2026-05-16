public abstract class Card{
  //cardType 0 =attack, 1=skill, 2=power
  private int energyCost,cardType;
  private boolean upgrade;
  private String text;
  public abstract void drawCard(int x,int y);
  public Card(int cost,int type, boolean upgraded, String txt){
    energyCost=cost;
    cardType=type;
    upgrade=upgraded;
    text=txt;
  }
  public void discard(){
    thisEncounter.hand.remove(this);
    thisEncounter.discardPile.add(this);    
  }
}
