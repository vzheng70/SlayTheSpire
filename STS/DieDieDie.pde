public class DieDieDie extends Card{
  public DieDieDie(){
    super(1,1,false,"Die_Die_Die");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=13;
      if(super.upgrade)dmg=17;   
      for(Enemy e:thisEncounter.enemies){
        int newDmg=theSilent.calcAttackDamage(dmg,e);
        e.takeDamage(newDmg);
      }
      thisEncounter.energy-=super.energyCost;
      exhaust();
    }
  }
}
