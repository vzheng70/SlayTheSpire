public class Strike extends Card{
  public Strike(){
    super(1,1,false,"Strike_Silent");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int dmg=6;
      if(super.upgrade)dmg=9;
      theSilent.dealAttackDamage(dmg,target);
      thisEncounter.energy-=super.energyCost;
      this.discard();
    }
  }
  public void play(){
  }
}
