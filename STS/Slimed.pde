public class Slimed extends Card{
  public Slimed(){
    super(1,2,false,"Slimed");
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
        exhaust();
      }
  }
  public void play(Enemy target){play();}
  public void upgrade(){}
}
