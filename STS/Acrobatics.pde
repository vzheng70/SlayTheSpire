public class Acrobatics extends Card{
  public Acrobatics(){
    super(1,2,false,"Acrobatics");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int draw=3;
      if(super.upgrade)draw=4;
      for(int i=0;i<draw;i++)
        thisEncounter.drawCard();
      thisEncounter.energy-=super.energyCost;
      discard();
      thisEncounter.cardSelect=new CardSelectionScreen("Choose a card to discard");
    }
  }
}
