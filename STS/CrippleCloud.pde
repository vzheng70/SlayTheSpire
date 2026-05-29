public class CrippleCloud extends Card{
  public CrippleCloud(){
    super(2,2,false,"Crippling_Cloud");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int p=4;
      if(super.upgrade)p=7;
      int w=2;
      for(Enemy e:thisEncounter.enemies){
        e.gainPoison(p);
        e.recieveDebuff(0,w);
      }
      thisEncounter.energy-=super.energyCost;
      exhaust();
    }
  }
}
