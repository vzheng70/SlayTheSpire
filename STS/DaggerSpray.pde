public class DaggerSpray extends Card{
  public DaggerSpray(){
    super(1,1,false,"Dagger_Spray");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=4;
      if(super.upgrade)dmg=8;
      for(Enemy e:thisEncounter.enemies){
        for(int i=0;i<2;i++)
          theSilent.dealAttackDamage(dmg,e);
      }
      thisEncounter.energy-=super.energyCost;
      exhaust();
    }
  }
}
