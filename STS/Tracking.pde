public class Tracking extends Card{
  public Tracking(){
    super(2,3,false,"Tracking");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      theSilent.tracking=true;
      thisEncounter.energy-=super.energyCost;
      exhaust();
    }
  }
  @Override
  public void upgrade(){
    super.upgrade();
    super.energyCost=1;
  }
}
