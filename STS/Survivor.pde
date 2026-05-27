public class Survivor extends Card{
  public Survivor(){
    super(1,2,false,"Survivor");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int blk=8;
      if(super.upgrade)blk=11;
      theSilent.gainBlock(blk);
      thisEncounter.energy-=super.energyCost;
      discard();
      thisEncounter.cardSelect=new CardSelectionScreen("Choose a card to discard");
    }
  }
}
