public class SuckerPunch extends Card{
  public SuckerPunch(){
    super(1,1,false,"Sucker_Punch");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=7;
      if(super.upgrade)dmg=9;
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
