public class DeadlyPoison extends Card{
  public DeadlyPoison(){
    super(1,2,false,"Deadly_Poison");
  }
  public void play(Enemy target){
    if(thisEncounter.energy>=super.energyCost){
      int p=5;
      if(super.upgrade)p=7;
      target.gainPoison(p);
      thisEncounter.energy-=super.energyCost;
      this.discard();
    }
  }
  public void play(){
  }
}
