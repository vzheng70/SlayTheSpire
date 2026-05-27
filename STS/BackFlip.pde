public class BackFlip extends Card{
  public BackFlip(){
    super(1,2,false,"Backflip");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int blk=5;
      if(super.upgrade)blk=8;
      theSilent.gainBlock(blk);
      for(int i=0;i<2;i++)
        thisEncounter.drawCard();
      thisEncounter.energy-=super.energyCost;
      discard();
    }
  }
}
