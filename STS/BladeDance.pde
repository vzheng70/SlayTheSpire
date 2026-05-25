public class BladeDance extends Card{
  public BladeDance(){
    super(1,2,false,"../images/Blade_Dance.png");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      for(int i=0;i<3;i++)
        thisEncounter.hand.add(new Shiv());
      thisEncounter.energy-=super.energyCost;
      discard();
    }
  }
}
