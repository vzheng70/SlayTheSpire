public abstract class Card{
  //cardType 0 =attack, 1=skill, 2=power
  private int energyCost,cardType;
  private boolean upgrade;
 // private String text;
  private PImage pic;
  public abstract void play(Enemy target);
  public abstract void play();
  
  public Card(int cost,int type, boolean upgraded,String fileName){
    energyCost=cost;
    cardType=type;
    upgrade=upgraded;
    pic = loadImage(fileName);
  }
  public void discard(){
    thisEncounter.hand.remove(this);
    thisEncounter.discardPile.add(this);    
    thisEncounter.selectedCard=null;
  }
  public void drawCard(int x,int y,int size){
    if(thisEncounter.selectedCard==this)
      y-=10;
    image(pic,x,y,size,size*5/4);
  }
}
