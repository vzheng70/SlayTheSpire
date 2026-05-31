public class Assassinate extends Card{
  public Assassinate(){
    super(1,1,false,"Assassinate");
    super.innate=true;
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=10;
      if(super.upgrade)dmg=13;
      int vuln=1;
      if(super.upgrade)vuln=2;
      theSilent.dealAttackDamage(dmg,target);
      target.recieveDebuff(vuln,0);
      thisEncounter.energy-=super.energyCost;
      exhaust();
    }
  }
  public void play(){
  }
}
