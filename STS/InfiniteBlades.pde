public class InfiniteBlades extends Card{
  public InfiniteBlades(){
    super(1,3,false,"Infinite_Blades");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      theSilent.infiniteBlades++;
      thisEncounter.energy-=super.energyCost;
      exhaust();
    }
  }
  @Override
  public void upgrade(){
    super.upgrade();
    super.innate=true;
  }
}
