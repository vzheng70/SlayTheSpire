public class FanOfKnives extends Card{
  public FanOfKnives(){
    super(2,3,false,"Fan_Of_Knives");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      theSilent.fanOfKnives=true;
      int shivs=4;
      if(super.upgrade)shivs=5;
      for(int i=0;i<shivs;i++)
        thisEncounter.hand.add(new Shiv());
      thisEncounter.energy-=super.energyCost;
      exhaust();
    }
  }
}
