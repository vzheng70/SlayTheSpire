public class Neutralize extends Card{
  public Neutralize(){
    super(0,1,false,"Neutralize");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=3;
      if(super.upgrade)dmg=4;
      theSilent.dealAttackDamage(dmg,target);
      int w=1;
      if(super.upgrade)w=2;
      target.recieveDebuff(0,w);
      thisEncounter.energy-=super.energyCost;
      this.discard();
    }
  }
  public void play(){
  }
}
