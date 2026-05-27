public class BladeDance extends Card{
  public BladeDance(){
    super(1,2,false,"Blade_Dance");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int addShiv=0;
      if(super.upgrade)addShiv=1;
      for(int i=0;i<3+addShiv;i++)
        thisEncounter.hand.add(new Shiv());
      thisEncounter.energy-=super.energyCost;
      discard();
    }
  }
}
