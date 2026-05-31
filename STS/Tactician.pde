public class Tactician extends Card{
  public Tactician(){
    super(0,2,false,"Tactician");
  }
  public void play(){};
  public void play(Enemy target){};
  public void keyDiscard(){
    super.keyDiscard();
    int e =1;
    if(super.upgrade)e=2;
    thisEncounter.energy+=e;
  }
}
