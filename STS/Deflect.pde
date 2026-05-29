public class Deflect extends Card{
  public Deflect(){
    super(0,2,false,"Deflect");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int blk=4;
      if(super.upgrade)blk=7;
      theSilent.gainBlock(theSilent.calcBlock(blk));
      thisEncounter.energy-=super.energyCost;
      discard();
    }
  }

}
