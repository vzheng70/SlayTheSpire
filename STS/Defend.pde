public class Defend extends Card{
  public Defend(){
    super(1,2,false,"../images/Defend_Silent.png");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      theSilent.gainBlock(5);
      thisEncounter.energy-=super.energyCost;
      discard();
    }
  }

}
