public class Shiv extends Card{
  public Shiv(){
    super(0,1,false,"Shiv");
  }
  public Shiv(boolean upgrade){
    super(0,1,upgrade,"Shiv");
  }
  public void play(Enemy target){
    if(theSilent.fanOfKnives){
      play();
      return;
    }
    if(thisEncounter.energy>=super.energyCost){
      int dmg=4;
      if(super.upgrade)dmg=6;
      dmg+=theSilent.accuracy;
      dmg=theSilent.calcAttackDamage(dmg,target);
      //print(dmg);
      target.takeDamage(dmg);
      thisEncounter.energy-=super.energyCost;
      this.exhaust();
    }
  }
  public void play(){
    if(theSilent.fanOfKnives){
      if(thisEncounter.energy>=super.energyCost){
        int dmg=4;
        if(super.upgrade)dmg=6;
        dmg+=theSilent.accuracy;
        for(Enemy e:thisEncounter.enemies){
          int newDmg=theSilent.calcAttackDamage(dmg,e);
          e.takeDamage(newDmg);
        }
        thisEncounter.energy-=super.energyCost;
        this.exhaust();
      }
    }
  }
}
