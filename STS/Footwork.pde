public class Footwork extends Card{
  public Footwork(){
    super(1,3,false,"Footwork");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int dex=2;
      if(super.upgrade)dex=3;
      theSilent.dexterity+=dex;
      thisEncounter.energy-=super.energyCost;
      exhaust();
    }
  }

}
