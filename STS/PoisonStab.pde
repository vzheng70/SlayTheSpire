public class PoisonStab extends Card{
  public PoisonStab(){
    super(1,1,false,"../images/Poisoned_Stab.png");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=6;
      if(super.upgrade)dmg=8;
      dmg=theSilent.calcAttackDamage(dmg,target);
      //print(dmg);
      target.takeDamage(dmg);
      target.gainPoison(3);
      thisEncounter.energy-=super.energyCost;
      this.discard();
    }
  }
  public void play(){
  }
}
