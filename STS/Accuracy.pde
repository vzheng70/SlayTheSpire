public class Accuracy extends Card{
  public Accuracy(){
    super(1,3,false,"Accuracy");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int a=4;
      if(super.upgrade)a=6;
      theSilent.accuracy+=a;
      thisEncounter.energy-=super.energyCost;
      exhaust();
    }
  }
}
