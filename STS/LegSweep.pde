public class LegSweep extends Card{
  public LegSweep(){
    super(2,2,false,"Leg_Sweep");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int blk=11;
      if(super.upgrade)blk=14;
      blk=theSilent.calcBlock(blk);
      //print(dmg);
      theSilent.gainBlock(blk);
      int w=2;
      if(super.upgrade)w=3;
      target.recieveDebuff(0,w);
      thisEncounter.energy-=super.energyCost;
      this.discard();
    }
  }
  public void play(){
  }
}
