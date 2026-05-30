public class Shadowmeld extends Card{
  public Shadowmeld(){
    super(1,2,false,"Shadowmeld");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      theSilent.doubleBlock=true;
      thisEncounter.energy-=super.energyCost;
      discard();
    }
  }
  @Override
  public void upgrade(){
    super.upgrade();
    super.energyCost=0;
  }
}
