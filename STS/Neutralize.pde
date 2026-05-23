public class Neutralize extends Card{
  public Neutralize(){
    super(0,1,false,"../images/Neutralize.png");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=3;
      if(super.upgrade)dmg=4;
      dmg=theSilent.calcAttackDamage(dmg,target);
      //print(dmg);
      target.takeDamage(dmg);
      target.recieveDebuff(0,1);
      thisEncounter.energy-=super.energyCost;
      this.discard();
    }
  }
  public void play(){
  }
}
