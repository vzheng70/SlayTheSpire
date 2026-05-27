public class Shiv extends Card{
  public Shiv(){
    super(0,1,false,"Shiv");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=4;
      if(super.upgrade)dmg=6;
      dmg=theSilent.calcAttackDamage(dmg,target);
      //print(dmg);
      target.takeDamage(dmg);
      thisEncounter.energy-=super.energyCost;
      this.exhaust();
    }
  }
  public void play(){
  }
}
