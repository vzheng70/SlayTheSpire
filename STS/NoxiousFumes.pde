public class NoxiousFumes extends Card{
  public NoxiousFumes(){
    super(1,3,false,"Noxious_Fumes");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int n=2;
      if(super.upgrade)n=3;
      theSilent.noxiousFumes+=n;
      thisEncounter.energy-=super.energyCost;
      exhaust();
    }
  }
}
