public class Survivor extends Card{
  public Survivor(){
    super(1,2,false,"../images/Survivor.png");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      theSilent.gainBlock(8);
      thisEncounter.energy-=super.energyCost;
      discard();
      thisEncounter.cardSelect=new CardSelectionScreen("Choose a card to discard");
    }
  }
}
