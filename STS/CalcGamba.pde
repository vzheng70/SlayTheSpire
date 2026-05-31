public class CalcGamba extends Card{
  public CalcGamba(){
    super(0,2,false,"Calculated_Gamble");
  }
  public void play(Enemy target){
    play();
  }
  public void play(){
    if(thisEncounter.energy>=super.energyCost){
      int cardsDiscarded=thisEncounter.hand.size()-1;
      thisEncounter.hand.remove(this);
      thisEncounter.hand.add(this);
      while(thisEncounter.hand.size()>1)
        thisEncounter.hand.get(0).keyDiscard();
      for(int i=0;i<cardsDiscarded;i++)
        thisEncounter.drawCard();
      thisEncounter.energy-=super.energyCost;
      if(super.upgrade)
        discard();
      else
        exhaust();
    }
  }
}
