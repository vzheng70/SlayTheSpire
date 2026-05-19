public class Defend extends Card{
  public Defend(){
    super(1,2,false,"gain 5 block");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      
    }
  }
}
