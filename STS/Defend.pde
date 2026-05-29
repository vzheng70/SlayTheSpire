public class Defend extends Card{
  public Defend(){
    super(1,2,false,"Defend_Silent");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int blk=5;
      if(super.upgrade)blk=8;
      theSilent.gainBlock(theSilent.calcBlock(blk));
      thisEncounter.energy-=super.energyCost;
      discard();
    }
  }

}
