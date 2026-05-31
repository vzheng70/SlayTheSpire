public class PoisonStab extends Card{
  public PoisonStab(){
    super(1,1,false,"Poisoned_Stab");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=6;
      if(super.upgrade)dmg=8;
      theSilent.dealAttackDamage(dmg,target);
      int p=3;
      if(super.upgrade)p=4;
      target.gainPoison(p);
      thisEncounter.energy-=super.energyCost;
      this.discard();
    }
  }
  public void play(){
  }
}
