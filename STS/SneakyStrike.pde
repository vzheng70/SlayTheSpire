public class SneakyStrike extends Card{
  public SneakyStrike(){
    super(2,1,false,"Sneaky_Strike");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=12;
      if(super.upgrade)dmg=16;
      dmg=theSilent.calcAttackDamage(dmg,target);
      target.takeDamage(dmg);
      thisEncounter.energy-=super.energyCost;
      if(thisEncounter.cardDiscarded)
        thisEncounter.energy+=2;
      this.discard();
    }
  }
  public void play(){
  }
}
