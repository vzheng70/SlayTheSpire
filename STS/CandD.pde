public class CandD extends Card{
  public CandD(){
    super(1,2,false,"Cloak_And_Dagger");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      theSilent.gainBlock(theSilent.calcBlock(6));
      int addShiv=1;
      if(super.upgrade)addShiv=2;
      for(int i=0;i<addShiv;i++)
        thisEncounter.hand.add(new Shiv());
      thisEncounter.energy-=super.energyCost;
      discard();
    }
  }
}
