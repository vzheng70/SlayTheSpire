public class StormOfSteel extends Card{
  public StormOfSteel(){
    super(1,2,false,"Storm_Of_Steel");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int cardsDiscarded=thisEncounter.hand.size()-1;
      while(thisEncounter.hand.size()>0)
        thisEncounter.hand.get(0).keyDiscard();
      for(int i=0;i<cardsDiscarded;i++){
        if(super.upgrade)thisEncounter.hand.add(new Shiv(true));
        else thisEncounter.hand.add(new Shiv());
      }
      thisEncounter.energy-=super.energyCost;
    }
  }
}
