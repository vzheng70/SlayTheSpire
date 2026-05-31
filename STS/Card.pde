public abstract class Card{
  //cardType 0 =attack, 1=skill, 2=power
  private int energyCost,cardType;
  private boolean upgrade;
  private boolean innate=false;private boolean ethereal=false;
 // private String text;
  private PImage pic;
  private String imgFile;
  public abstract void play(Enemy target);
  public abstract void play();
  public Card(int cost,int type, boolean upgraded,String fileName){
    energyCost=cost;
    cardType=type;
    upgrade=upgraded;
    imgFile=fileName;
    pic = loadImage("../images/"+imgFile+".png");
  }
  public void discard(){
    thisEncounter.hand.remove(this);
    thisEncounter.discardPile.add(this);    
    thisEncounter.selectedCard=null;
  }
  public void keyDiscard(){
    discard();
    thisEncounter.cardDiscarded=true;
  }
  public void exhaust(){
    thisEncounter.hand.remove(this);
    thisEncounter.selectedCard=null;
  }
  public void drawCard(int x,int y,int size){
    if(thisEncounter!=null){
      if(thisEncounter.selectedCard==this)
        y-=10;
    }
    image(pic,x,y,size,size*5/4);
  }
  public void upgrade(){
    upgrade=true;
    imgFile+="+";
    pic = loadImage("../images/"+imgFile+".png");
  }
}
