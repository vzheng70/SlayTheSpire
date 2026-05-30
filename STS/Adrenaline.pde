public class Adrenaline extends Card{
  public Adrenaline(){
    super(0,2,false,"Adrenaline");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int e=1;
      if(super.upgrade)e=2;
      for(int i=0;i<2;i++)
        thisEncounter.drawCard();
      thisEncounter.energy+=e;
      thisEncounter.energy-=super.energyCost;
      exhaust();
    }
  }
} 
