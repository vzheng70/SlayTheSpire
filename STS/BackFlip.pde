public class BackFlip extends Card{
  public BackFlip(){
    super(1,2,false,"../images/Backflip.png");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      theSilent.gainBlock(5);
      for(int i=0;i<2;i++)
        thisEncounter.drawCard();
      thisEncounter.energy-=super.energyCost;
      discard();
    }
  }
}
